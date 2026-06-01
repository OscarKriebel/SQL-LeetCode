/* Write your T-SQL query statement below */
WITH board AS (SELECT 
    *,
    SUM("weight") OVER (ORDER BY turn) AS "limit"
FROM "Queue")

SELECT TOP 1 person_name
FROM board
WHERE "limit" <= 1000
ORDER BY "limit" DESC