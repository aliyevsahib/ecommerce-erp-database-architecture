USE erp_simulation;

-- Top 10 Product Categories Based on Total Revenue
SELECT
	p.product_category_name,
    COUNT(oi.order_item_id) AS total_items_sold,
    SUM(oi.price) AS total_revenue
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 Product Categories Based on Total Revenue ($ > 100)
SELECT
	p.product_category_name,
    COUNT(oi.order_item_id) AS total_items_sold,
    SUM(oi.price) AS total_revenue
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
WHERE oi.price > 100
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 5 Best Sellers Based on Total Revenue (Delivered Only)
SELECT
	oi.seller_id,
    s.seller_city,
    SUM(oi.price) AS total_revenue
FROM order_items oi
INNER JOIN sellers s ON oi.seller_id = s.seller_id
INNER JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id, s.seller_city
ORDER BY total_revenue DESC
LIMIT 5;