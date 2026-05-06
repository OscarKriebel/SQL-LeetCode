/* Write your T-SQL query statement below */
SELECT c.customer_id AS customer_id
FROM Customer AS c
CROSS JOIN (
    SELECT COUNT(product_key) AS total
    FROM Product
) AS p
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = MAX(p.total)