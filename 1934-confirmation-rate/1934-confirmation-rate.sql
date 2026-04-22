/* Write your T-SQL query statement below */
SELECT 
    su.user_id AS user_id,
    ROUND(
        CAST(
            SUM(
            CASE WHEN con.action = 'confirmed'
            THEN 1 ELSE 0 END
            )  
        AS FLOAT)
        / 
        CAST(
        CASE WHEN 
        SUM(
            CASE WHEN con.user_id IS NOT NULL 
            THEN 1 ELSE 0 END
            ) = 0 THEN 1 ELSE SUM(
            CASE WHEN con.user_id IS NOT NULL 
            THEN 1 ELSE 0 END
            ) END
        AS FLOAT)
        , 2) AS confirmation_rate
FROM Signups AS su
LEFT JOIN Confirmations AS con
    ON su.user_id = con.user_id
GROUP BY su.user_id