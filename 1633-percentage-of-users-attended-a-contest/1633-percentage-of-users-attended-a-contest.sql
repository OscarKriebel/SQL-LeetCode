/* Write your T-SQL query statement below */
SELECT
    re.contest_id as contest_id,
    ROUND((CAST(SUM(IIF(r.user_id IS NULL, 0, 1)) AS FLOAT) / COUNT(*)) * 100, 2) AS percentage
FROM Users AS u
CROSS JOIN (SELECT DISTINCT contest_id FROM Register) AS re
LEFT JOIN Register AS r
    ON r.contest_id = re.contest_id AND r.user_id = u.user_id
GROUP BY re.contest_id
ORDER BY percentage DESC, contest_id ASC