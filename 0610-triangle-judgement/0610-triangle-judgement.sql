/* Write your T-SQL query statement below */
SELECT 
    *,
    CASE WHEN x > 0 AND y > 0 AND z > 0 AND y + z > x AND x + z > y AND x + y > z THEN
        'Yes'
    ELSE
        'No'
    END
    AS triangle
FROM Triangle