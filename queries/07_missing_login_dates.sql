-- Return the dates where no login was done by the users
-- Return Date

select CAST(LOGIN_TIMESTAMP AS DATE) from logins
order by LOGIN_TIMESTAMP
-- Assuming @StartDate and @EndDate are from your table
DECLARE @StartDate DATE = (SELECT MIN(CAST(LOGIN_TIMESTAMP AS DATE)) FROM Logins);
DECLARE @EndDate   DATE = CAST('2024-06-28' as date) ;

WITH DateRange AS (
    SELECT @StartDate AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateRange
    WHERE DateValue < @EndDate
)
SELECT DateValue
FROM DateRange
where DateValue not in (select CAST(LOGIN_TIMESTAMP AS DATE) from logins)
OPTION (MAXRECURSION 32767); -- Increase if your range spans many years
