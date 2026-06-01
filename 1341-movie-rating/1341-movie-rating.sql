/* Write your T-SQL query statement below */
WITH one AS (SELECT TOP 1 u.name AS results
FROM MovieRating AS r
INNER JOIN Users AS u
    ON r.user_id = u.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC, u.name ASC),
two AS (SELECT TOP 1 m.title AS result
FROM MovieRating AS r
INNER JOIN Movies AS m
    ON r.movie_id = m.movie_id
WHERE YEAR(r.created_at) = 2020 AND MONTH(r.created_at) = 2
GROUP BY m.title
ORDER BY AVG(r.rating * 1.0) DESC, m.title ASC)

SELECT *
FROM one
UNION ALL
SELECT *
FROM two