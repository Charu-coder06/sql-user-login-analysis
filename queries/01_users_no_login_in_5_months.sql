-- Manager wants to see all the users who didn't login in past 5 months
-- return username

with cte_last_login_per_user
as (select USER_ID,
           MAX(LOGIN_TIMESTAMP) as last_login_time
    from logins
    group by USER_ID
    having MAX(LOGIN_TIMESTAMP) < DATEADD(M, -5, '2024-06-28')
   )
select t1.USER_NAME
from users as t1
    inner join cte_last_login_per_user as t2
        on t1.USER_ID = t2.USER_ID