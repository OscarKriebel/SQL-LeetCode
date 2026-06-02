/* Write your T-SQL query statement below */
WITH u AS (
    SELECT DISTINCT sell_date, product
    FROM Activities
)

SELECT
    sell_date,
    COUNT(*) AS num_sold,
    STRING_AGG(product,',') AS products
FROM u
GROUP BY sell_date
ORDER BY sell_date