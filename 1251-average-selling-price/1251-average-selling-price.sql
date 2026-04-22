/* Write your T-SQL query statement below */
SELECT 
    p.product_id AS product_id,
    ISNULL(ROUND(CAST(SUM(p.price * u.units) AS FLOAT) / SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
    ON u.purchase_date BETWEEN p.start_date AND p.end_date AND p.product_id = u.product_id
GROUP BY p.product_id