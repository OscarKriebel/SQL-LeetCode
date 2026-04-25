/* Write your T-SQL query statement below */
SELECT
    ROUND(CAST(COUNT(later.later_date) AS FLOAT) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity AS a
LEFT JOIN (
    SELECT 
        player_id,
        DATEADD(day, 1, MIN(event_date)) AS later_date
    FROM Activity
    GROUP BY player_id
) AS later
    ON a.player_id = later.player_id AND a.event_date = later.later_date