/* Write your T-SQL query statement below */
SELECT 
    Man.employee_id AS employee_id,
    Man.name AS name,
    COUNT(Emp.employee_id) AS reports_count,
    ROUND(AVG(CAST(Emp.age AS FLOAT)), 0) AS average_age
FROM Employees AS Man
INNER JOIN Employees AS Emp
    ON Man.employee_id = Emp.reports_to
GROUP BY Man.employee_id, Man.name
ORDER BY Man.employee_id ASC