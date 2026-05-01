/* Write your T-SQL query statement below */
SELECT
    s.product_id AS product_id,
    s.year AS first_year,
    s.quantity AS quantity,
    s.price AS price
FROM Sales AS s
INNER JOIN (
    SELECT
        product_id,
        MIN(f.year) AS first_year
    FROM Sales AS f
    GROUP BY product_id
) AS f
    ON s.product_id = f.product_id AND s.year = f.first_year