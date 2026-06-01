/* Write your T-SQL query statement below */
WITH groupings AS (
    SELECT
        num,
        id - ROW_NUMBER() OVER (Partition By num ORDER BY id) AS grp
    FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM groupings
GROUP BY num, grp
HAVING COUNT(*) >= 3