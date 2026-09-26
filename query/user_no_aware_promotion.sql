select  
t2.user_segment,
count(distinct t1.user_id) as cnt_user,
count(distinct
    case 
        when t1.service_type = 'GrabFood' then t1.user_id
    end
) as Food_users,
count(distinct
    case
        when t1.service_type = 'GrabMart' then t1.user_id
    end
) as Mart_users
from transactions t1
join users t2
    on t1.user_id = t2.user_id
where 1=1
and upper(t1.period) = 'PROMO'
and upper(t1.city) = 'HO CHI MINH CITY'
and t1.user_id not in (
        -- This completely excludes any user who used a cross-sell voucher
        select user_id 
        from transactions 
        where is_cross_sell_voucher = 1 
          and upper(period) = 'PROMO'
    )
group by
t2.user_segment
