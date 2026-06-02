WITH ranks AS (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
    FROM Employee
)

SELECT
    MAX(salary) AS SecondHighestSalary
FROM ranks
WHERE ranking = 2