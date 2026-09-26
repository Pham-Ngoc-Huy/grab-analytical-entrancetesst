WITH mart_promo AS (
SELECT
    t.user_id,
    t.item_subtotal,
    t.is_cross_sell_voucher,
    u.first_mart_order_date,

    CASE
        WHEN u.first_mart_order_date >= '2024-02-12'
            THEN 'New Mart User'
        ELSE 'Existing Mart User'
    END AS mart_user_type

FROM transactions t
JOIN users u
    ON t.user_id = u.user_id

WHERE t.city = 'Ho Chi Minh City'
    AND t.period = 'Promo'
    AND t.service_type = 'GrabMart'
),

user_level AS (
SELECT
    user_id,
    mart_user_type,

    -- User có sử dụng cross-sell voucher hay không
    MAX(
        CASE
            WHEN is_cross_sell_voucher = 1 THEN 1
            ELSE 0
        END
    ) AS used_cross_sell_voucher,

    COUNT(*) AS mart_txn,
    SUM(item_subtotal) AS mart_gmv,

    SUM(
        CASE
            WHEN is_cross_sell_voucher = 1
            THEN item_subtotal
            ELSE 0
        END
    ) AS cross_sell_gmv

FROM mart_promo
GROUP BY
    user_id,
    mart_user_type
),

summary AS (
SELECT
    mart_user_type,

    COUNT(*) AS users,

    SUM(
        CASE
            WHEN used_cross_sell_voucher = 1 THEN 1
            ELSE 0
        END
    ) AS cross_sell_users,

    SUM(mart_gmv) AS mart_gmv,

    SUM(cross_sell_gmv) AS cross_sell_gmv

FROM user_level
GROUP BY mart_user_type
)
SELECT
    mart_user_type,

    users,

    ROUND(
        100.0 * users
        / SUM(users) OVER (),
        2
    ) AS user_share,

    cross_sell_users,

    ROUND(
        100.0 * cross_sell_users
        / NULLIF(users, 0),
        2
    ) AS cross_sell_user_rate,

    mart_gmv,

    ROUND(
        100.0 * mart_gmv
        / SUM(mart_gmv) OVER (),
        2
    ) AS gmv_share,

    cross_sell_gmv,

    ROUND(
        100.0 * cross_sell_gmv
        / NULLIF(mart_gmv, 0),
        2
    ) AS cross_sell_gmv_share,

    ROUND(
        mart_gmv / NULLIF(users, 0),
        2
    ) AS gmv_per_user

FROM summary
ORDER BY
    CASE
        WHEN mart_user_type = 'New Mart User' THEN 1
        ELSE 2
    END;