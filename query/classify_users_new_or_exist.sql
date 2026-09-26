select
t.period,
case
    when u.first_mart_order_date >= '2024-02-12' then 'new-mart-user'
    else 'existed-mart-user'
end as user_type,
count(distinct t.user_id) as unique_users,
count(*) as n_transactions
from transactions t
join users u
    on t.user_id = u.user_id
    and upper(t.city) = 'HO CHI MINH CITY'
    and upper(t.service_type) = 'GRABMART'
    -- and upper(t.period) = 'PROMO'
group by
    user_type,
    t.period