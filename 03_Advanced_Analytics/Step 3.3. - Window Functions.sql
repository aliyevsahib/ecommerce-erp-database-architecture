USE erp_simulation;

SELECT
	p.product_id,
    p.product_category_name,
    oi.price,
    AVG(oi.price) OVER(PARTITION BY p.product_category_name) AS category_average
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id;