USE erp_simulation;

-- The Most Valuable Sellers Based on Total Revenue ($ > 200,000)
WITH VendorTotals AS (
	SELECT oi.seller_id, s.seller_city, SUM(oi.price) AS total_revenue
    FROM order_items oi
    INNER JOIN orders o ON oi.order_id = o.order_id
    INNER JOIN sellers s ON oi.seller_id = S.seller_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.seller_id, s.seller_city
)

SELECT * FROM VendorTotals
WHERE total_revenue > 200000;

-- The Most Valuable Customers Based on Total Spent ($ > 1000)
WITH CustomerTotals AS (
	SELECT o.customer_id, c.customer_city, SUM(oi.price) AS total_spent
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY customer_id, customer_city
)

SELECT * FROM CustomerTotals
WHERE total_spent > 1000
ORDER BY total_spent DESC;