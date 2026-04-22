/* Write your T-SQL query statement below */
SELECT e.name
FROM Employee AS e
INNER JOIN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) AS m
    ON m.managerId = e.id 