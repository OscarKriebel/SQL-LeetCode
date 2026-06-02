/* Write your T-SQL query statement below */
WITH req AS (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)

SELECT TOP 1
    id,
    COUNT(id) AS num
FROM req
GROUP BY id
ORDER BY COUNT(id) DESC