/* Write your T-SQL query statement below */
SELECT 
    p.product_id, 
    ISNULL(CAST(ROUND(SUM(p.price * u.units * 1.0) / NULLIF(SUM(u.units), 0), 2) AS DECIMAL(10,2)), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;