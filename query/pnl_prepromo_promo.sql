with order_economics as (
select 
t.period,
t.service_type,
t.transaction_id,
t.item_subtotal,
-- assumption: 
-- gross-revenue
(t.item_subtotal * m.take_rate) + t.delivery_fee_collected as gross_revenue,

-- assumption:
-- direct-cost
t.driver_payout + t.promo_discount as direct_cost,

-- assumption
-- contribution margins
((t.item_subtotal * m.take_rate) + t.delivery_fee_collected) - (t.driver_payout + t.promo_discount) as contribution_margin
from transactions t
join merchants m 
    on t.merchant_id = m.merchant_id
where 1=1
    and t.city = 'Ho Chi Minh City' 
    and t.period in ('Pre-Promo', 'Promo')
)
select 
service_type,
period,
count(transaction_id) as total_orders,
round(sum(item_subtotal), 1) as total_gmv,

round(avg(gross_revenue), 1) as avg_revenue_per_order,
round(avg(direct_cost), 1) as avg_cost_per_order,
round(avg(contribution_margin), 1) as avg_margin_per_order,

round(SUM(contribution_margin), 1) as total_contribution_margin
from order_economics
group by 
    service_type, 
    period
order by 
    service_type, 
    case 
        when period = 'Pre-Promo' then 1 
    else 2 
    end;