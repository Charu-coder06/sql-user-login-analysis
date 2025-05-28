-- To identify our best users - Return the users that had a session on every single day since their first login
-- (make asumptions when needed)
-- Return user_id


with cte as (
select USER_ID,
DATEDIFF(Day,MIN(CAST(LOGIN_TIMESTAMP as date)),CAST('2024-06-28' as date)) + 1 as day_diff,
COUNT(DISTINCT CAST(LOGIN_TIMESTAMP as date))as count_logins from logins
group by USER_ID)

select USER_ID from cte
where count_logins = day_diff