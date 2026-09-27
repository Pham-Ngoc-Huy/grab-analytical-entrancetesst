with user_period_metrics as (
-- Tính toán các chỉ số cốt lõi cho từng user trong từng giai đoạn
SELECT 
user_id,
period,
count(transaction_id) as total_orders,
sum(item_subtotal) as total_gmv,
avg(item_subtotal) as aov,
sum(
    case
        when item_subtotal > 100  then 1
    else 0
    end
) as qualifying_orders,
sum(is_cross_sell_voucher) as discounted_orders
 
FROM transactions
WHERE 1=1
    and city = 'Ho Chi Minh City' 
    and service_type = 'GrabFood'
    and period in ('Pre-Promo', 'Promo')
group by
    user_id, 
    period
),
cohort_comparison as (
-- Chỉ ghép cặp những user có mặt ở CẢ 2 giai đoạn
select 
pre.user_id,
pre.total_orders as orders_pre,
pre.total_gmv as gmv_pre,
pre.qualifying_orders AS qualifying_pre,
pre.aov as aov_pre,

promo.total_orders as orders_promo,
promo.total_gmv as gmv_promo,
promo.qualifying_orders AS qualifying_promo,
promo.aov as aov_promo
from user_period_metrics pre
join user_period_metrics promo 
    on pre.user_id = promo.user_id
where 1=1
    and pre.period = 'Pre-Promo' 
    and promo.period = 'Promo'
)
-- Tính trung bình toàn tập user và % thay đổi
select 
count(user_id) as cohort_size,

-- Metrics: Trước Promo
round(avg(orders_pre), 2) as avg_orders_per_user_pre,
round(avg(qualifying_pre), 2) as avg_qualifying_orders_pre,
round(avg(gmv_pre), 1) as avg_gmv_per_user_pre,
round(avg(aov_pre), 1) as avg_gmv_per_order_pre,

-- Metrics: Trong Promo
round(avg(orders_promo), 2) as avg_orders_per_user_promo,
round(avg(qualifying_promo), 2) as avg_qualifying_orders_promo,
round(avg(gmv_promo), 1) as avg_gmv_per_user_promo,
round(avg(aov_promo), 1) as avg_gmv_per_order_promo,

-- Bằng chứng Order Splitting (Phần trăm thay đổi)
round(100.0 * (avg(orders_promo) - avg(orders_pre)) / avg(orders_pre), 1) as pct_change_orders_per_user,
round(100.0 * (avg(qualifying_promo) - avg(qualifying_pre)) / nullif(avg(qualifying_pre), 1), 1) as pct_change_qualifying_orders,
round(100.0 * (avg(gmv_promo) - avg(gmv_pre)) / avg(gmv_pre), 1) as pct_change_gmv_per_user,
round(100.0 * (avg(aov_promo) - avg(aov_pre)) / avg(aov_pre), 1) as pct_change_gmv_per_order

from cohort_comparison