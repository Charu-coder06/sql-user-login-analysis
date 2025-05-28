-- Display user ids that login in Jan 2024 and did not login in November 2023
-- return user_id

select distinct USER_ID from logins
where FORMAT(LOGIN_TIMESTAMP, 'MM/y') = '01/24' and USER_ID not in (select distinct USER_ID from logins
where FORMAT(LOGIN_TIMESTAMP, 'MM/y') = '11/23' )