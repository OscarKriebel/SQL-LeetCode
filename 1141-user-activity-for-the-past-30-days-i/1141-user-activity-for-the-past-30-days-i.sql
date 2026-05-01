/* Write your T-SQL query statement below */
SELECT
    activity_date AS "day",
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date <= DATEFROMPARTS(2019,7,27) AND activity_date >= DATEFROMPARTS(2019,6,28)
GROUP BY activity_date