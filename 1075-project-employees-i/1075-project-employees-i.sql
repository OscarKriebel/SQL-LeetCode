/* Write your T-SQL query statement below */
SELECT 
    project_id,
    ROUND(AVG(CAST(e.experience_years AS DECIMAL)), 2) AS average_years
FROM Project AS p
INNER JOIN Employee AS e
    ON p.employee_id = e.employee_id
GROUP BY project_id
ORDER BY project_id ASC