with order_baskets as (
select
period,
item_subtotal,
case
    when item_subtotal < 80 then '< 80k'
    when item_subtotal >= 80 and item_subtotal < 100 then '80k - 99.99k'
    when item_subtotal >= 100 and item_subtotal < 120 then '100k - 119.9k'
else '>= 120k'
end as basket_tier
from transactions
where 1=1
    and service_type = 'GrabFood'
    and upper(city) = 'HO CHI MINH CITY'
    and upper(period) in ('PRE-PROMO', 'PROMO')
)
select 
period,
count(*) as total_food_orders,
round(avg(item_subtotal), 1) as aov_vnd_k,
round(100.0 * sum(case when basket_tier = '< 80k' then 1 else 0 end) / count(*),1) as shared_below_80k,
round(100.0 * sum(case when basket_tier = '80k - 99.99k' then 1 else 0 end) / count(*),1) as shared_80k_to_99k,
round(100.0 * sum(case when basket_tier = '100k - 119.9k' then 1 else 0 end) / count(*),1) as shared_100k_to_119k,
round(100.0 * sum(case when basket_tier = '>= 120k' then 1 else 0 end) / count(*),1) as shared_above_120k

from order_baskets
where 1=1
group by 
    period
order by 
    case 
        when upper(period) = 'PRE-PROMO' then 1 
    else 2
    end