/* Write your T-SQL query statement below */
SELECT 
    ROUND((CAST(SUM(IIF(del.order_date = del.customer_pref_delivery_date, 1, 0)) AS FLOAT) * 100) / COUNT(*),2) AS immediate_percentage
FROM Delivery AS del
RIGHT JOIN (
    SELECT 
        customer_id,
        MIN(order_date) AS recent_order
    FROM Delivery
    GROUP BY customer_id
) AS recent
    ON del.customer_id = recent.customer_id AND del.order_date = recent.recent_order