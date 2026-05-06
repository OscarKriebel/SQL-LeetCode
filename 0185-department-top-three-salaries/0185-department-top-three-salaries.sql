/* Write your T-SQL query statement below */
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
INNER JOIN (
    SELECT
        salary,
        departmentId,
        ROW_Number() OVER (Partition By departmentId order by salary desc) AS ranking
    FROM Employee
    GROUP BY departmentId, salary
) AS sal
    ON e.departmentId = sal.departmentId AND e.salary = sal.salary
INNER JOIN Department AS d
    ON e.departmentId = d.id
WHERE sal.ranking <= 3
ORDER BY d.name ASC, e.salary DESC