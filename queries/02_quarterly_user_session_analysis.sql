-- For the business units quarterly analysis, calculate how many users and how many sessions were at each quarter
--order by quarter from newest to oldest
--Return first day of the quarter, user_count, session_count

SELECT CONCAT('Q', DATEPART(QUARTER, LOGIN_TIMESTAMP)) AS Quarter,
       MIN(LOGIN_TIMESTAMP) as first_login,
       DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as first_quarter_date,
       COUNT(DISTINCT USER_ID) AS UserCount,
       COUNT(SESSION_ID) AS TotalSession
FROM logins
GROUP BY DATEPART(QUARTER, LOGIN_TIMESTAMP)
order by DATEPART(QUARTER, LOGIN_TIMESTAMP) desc