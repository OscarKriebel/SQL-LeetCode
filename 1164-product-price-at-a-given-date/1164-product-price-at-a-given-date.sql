/* Write your T-SQL query statement below */
SELECT
    p.product_id AS product_id,
    ISNULL(AVG(c.price), 10) AS price
FROM Products AS p
LEFT JOIN (SELECT
        p.product_id AS product_id,
        p.new_price AS price,
        p.change_date AS change_date
    FROM Products AS p
    INNER JOIN (
        SELECT
            product_id,
            MAX(change_date) AS change_date
        FROM Products
        WHERE change_date <= DATEFROMPARTS(2019,8,16)
        GROUP BY product_id
    ) AS n
        ON p.product_id = n.product_id
    WHERE p.change_date = n.change_date) AS c
    ON p.product_id = c.product_id AND p.change_date = c.change_date
    GROUP BY p.product_id