DELIMITER //

CREATE PROCEDURE GetOrderDetails(IN p_order_id VARCHAR(32))
BEGIN
	SELECT
		o.order_id,
        c.customer_city,
        c.customer_state,
        p.product_category_name,
        oi.price,
        oi.freight_value,
        o.order_delivered_customer_date
	FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_id = p_order_id;
END //

DELIMITER ;

USE erp_simulation;
SELECT order_id FROM orders LIMIT 1;
CALL GetOrderDetails('5f79b5b0931d63f1a42989eb65b9da6e');