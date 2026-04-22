/* Write your T-SQL query statement below */
SELECT 
    s.machine_id AS machine_id,
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity AS s
INNER JOIN (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
) AS e
    ON s.machine_id = e.machine_id AND s.process_id = e.process_id 
WHERE s.activity_type = 'start'
GROUP BY s.machine_id