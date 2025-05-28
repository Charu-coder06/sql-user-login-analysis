-- Add to the query from 2 the percentage change in sessions from last quarter
-- Return. First day of the quarter, session_cnt, session_prev-cnt, session_per_change

SELECT 
       DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)) as first_quarter_date,
       COUNT(DISTINCT USER_ID) AS UserCount,
       COUNT(SESSION_ID) AS session_cnt,
	   LAG(COUNT(SESSION_ID) ,1) over (order by DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP))) as session_prev_cnt,
	   (COUNT(SESSION_ID) - (LAG(COUNT(SESSION_ID) ,1) over (order by DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)))))
	   * 100.0 / (LAG(COUNT(SESSION_ID) ,1) over (order by DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP)))) as session_per_change

FROM logins
GROUP BY DATEPART(QUARTER, LOGIN_TIMESTAMP)
order by DATETRUNC(QUARTER, MIN(LOGIN_TIMESTAMP))