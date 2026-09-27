with user_aov_per_period AS (
select 
user_id,
period,
avg(item_subtotal) as avg_basket_size
from transactions
where 1=1
    and city = 'Ho Chi Minh City' 
    and service_type = 'GrabFood'
    and period IN ('Pre-Promo', 'Promo')
group by
    user_id, 
    period
),
same_user_comparison AS (
select 
pre.user_id,
pre.avg_basket_size AS aov_pre,
promo.avg_basket_size AS aov_promo,
(promo.avg_basket_size - pre.avg_basket_size) AS aov_diff
from user_aov_per_period pre
join user_aov_per_period promo 
    on pre.user_id = promo.user_id
where 1=1
    and pre.period = 'Pre-Promo' 
    and promo.period = 'Promo'
)
select 
count(user_id) AS total_tracked_users,
round(avg(aov_pre), 1) as user_aov_pre_promo,
round(avg(aov_promo), 1) as user_aov_during_promo,
round(avg(aov_diff), 1) as avg_uplift_per_user,
-- Bao nhiêu % user vốn có giỏ hàng < 100k trước promo và thành công qua mốc 100k trong promo?
round(
    100.0 * 
    sum(
        case 
            when aov_pre < 100 and aov_promo >= 100 then 1 
        else 0 
        end
    ) / count(user_id), 1
) as percentage_users_crossing_threshold
FROM same_user_comparison