SELECT
SUM(item_subtotal) AS total_mart_gmv,

SUM(
    CASE
        WHEN is_cross_sell_voucher = 1
        THEN item_subtotal
        ELSE 0
    END
) AS voucher_mart_gmv,

ROUND(
    100.0 *
    SUM(
        CASE
            WHEN is_cross_sell_voucher = 1
            THEN item_subtotal
            ELSE 0
        END
    )
    / SUM(item_subtotal),
    2
) AS voucher_gmv_share

FROM transactions
WHERE 1=1
    AND city = 'Ho Chi Minh City'
    AND period = 'Promo'
    AND service_type = 'GrabMart';