/* Write your T-SQL query statement below */
SELECT
    cw.id AS id
FROM Weather AS cw
LEFT JOIN (
    SELECT 
        DATEADD(day, 1, recordDate) AS oldDate,
        temperature
    FROM Weather
) AS ow
    ON cw.recordDate = ow.oldDate
WHERE ow.temperature IS NOT NULL AND cw.temperature > ow.temperature;