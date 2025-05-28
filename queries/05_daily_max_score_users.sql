-- Display the users that had the max session score for each day
--Return : Date, username, score
with cte as (
select USER_ID, CAST(LOGIN_TIMESTAMP as date)as Login_Date,SUM(Session_SCORE) as score from logins
group by USER_ID, CAST(LOGIN_TIMESTAMP as date)
--order by CAST(LOGIN_TIMESTAMP as date), score
)
select * from(
select *,
ROW_NUMBER() over(partition by Login_Date order by score desc) as rnk
from cte) as cte_2
where rnk = 1