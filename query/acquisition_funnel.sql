WITH promo_txn AS (
SELECT
    t.*
FROM transactions t
WHERE 1=1
    AND t.city = 'Ho Chi Minh City'
    AND t.period = 'Promo'
),
food_users AS (
SELECT
user_id,

COUNT(*) AS food_txn,
SUM(item_subtotal) AS food_gmv,

MAX(
    CASE
        WHEN item_subtotal > 100 THEN 1
        ELSE 0
    END
) AS has_eligible_food_order

FROM transactions
WHERE 1=1
    AND city = 'Ho Chi Minh City'
    AND period = 'Promo'
    AND service_type = 'GrabFood'
GROUP BY user_id
),
mart_users AS (
SELECT
user_id,

COUNT(*) AS mart_txn,
SUM(item_subtotal) AS mart_gmv,

SUM(
    CASE
        WHEN is_cross_sell_voucher = 1 THEN 1
        ELSE 0
    END
) AS voucher_txn,

SUM(
    CASE
        WHEN is_cross_sell_voucher = 1
        THEN item_subtotal
        ELSE 0
    END
) AS voucher_mart_gmv

FROM transactions
WHERE 1=1
    AND city = 'Ho Chi Minh City'
    AND period = 'Promo'
    AND service_type = 'GrabMart'
GROUP BY user_id
), 
funnel AS (
SELECT
f.user_id,

f.food_txn,
f.food_gmv,

f.has_eligible_food_order,

COALESCE(m.mart_txn, 0) AS mart_txn,
COALESCE(m.mart_gmv, 0) AS mart_gmv,
COALESCE(m.voucher_txn, 0) AS voucher_txn,
COALESCE(m.voucher_mart_gmv, 0) AS voucher_mart_gmv,

CASE
    WHEN f.has_eligible_food_order = 1
        AND COALESCE(m.voucher_txn, 0) > 0
    THEN 1
ELSE 0
END AS acquired_by_campaign

FROM food_users f
LEFT JOIN mart_users m
    ON f.user_id = m.user_id
)
SELECT
COUNT(*) AS food_users,

SUM(has_eligible_food_order) AS eligible_food_users,

SUM(
    CASE
        WHEN voucher_txn > 0 THEN 1
        ELSE 0
    END
) AS voucher_redeemers,

SUM(acquired_by_campaign) AS campaign_acquired_users,

ROUND(
    100.0 * SUM(has_eligible_food_order)
    / COUNT(*),
    2
) AS food_eligibility_rate,

ROUND(
    100.0 * 
    SUM(
        CASE WHEN voucher_txn > 0 THEN 1 ELSE 0 END
    )
    / NULLIF(SUM(has_eligible_food_order), 0),
    2
) AS voucher_redemption_rate,

ROUND(
    100.0 * SUM(acquired_by_campaign)
    / COUNT(*),
    2
) AS campaign_acquisition_rate

FROM funnel