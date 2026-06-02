/* Write your T-SQL query statement below */
WITH daily AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), moving AS (
    SELECT
        visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        AVG(amount * 1.0) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount
    FROM daily
)

SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM moving
WHERE visited_on >= DATEADD(day, 6, (SELECT MIN(visited_on) FROM moving))