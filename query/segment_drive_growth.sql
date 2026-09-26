
select
t.city,
u.user_segment,

case
    when u.first_mart_order_date >= '2024-02-12' then 'new-mart-user'
    else 'existed-mart-user'
end as user_type,

round(sum(t.item_subtotal) / 1e3 , 1) as gross_gmv_M_vnd,

t.service_type

from transactions t
join users u
    on t.user_id = u.user_id
    and upper(t.period) = 'PROMO'
    and upper(t.city) = 'HO CHI MINH CITY'
group by
    t.city,
    user_type,
    u.user_segment,
    t.service_type

order by
gross_gmv_M_vnd desc
