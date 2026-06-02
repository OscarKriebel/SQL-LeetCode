/* Write your T-SQL query statement below */
WITH c AS (
    SELECT
        lat,
        lon,
        COUNT(pid) AS num
    FROM Insurance
    GROUP BY lat, lon
), f AS (
    SELECT 
        tiv_2015,
        COUNT(pid) AS num
    FROM Insurance
    GROUP BY tiv_2015
)

SELECT ROUND(SUM(tiv_2016 * 1.0), 2) AS tiv_2016
FROM Insurance AS i
INNER JOIN f ON i.tiv_2015 = f.tiv_2015
INNER JOIN c ON i.lat = c.lat AND i.lon = c.lon
WHERE f.num > 1 AND c.num = 1
