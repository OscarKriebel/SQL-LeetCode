/* Write your T-SQL query statement below */
SELECT
    query_name,
    ROUND(AVG(CAST(rating AS FLOAT) / position), 2) AS quality,
    ROUND((CAST(SUM(IIF(rating < 3, 1, 0)) AS FLOAT) * 100) / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name