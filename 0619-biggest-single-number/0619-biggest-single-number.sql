/* Write your T-SQL query statement below */
WITH single AS (
    SELECT 
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)

SELECT
    MAX(num) AS num
FROM single