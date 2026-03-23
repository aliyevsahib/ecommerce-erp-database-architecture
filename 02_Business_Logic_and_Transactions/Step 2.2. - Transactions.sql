USE erp_simulation

DELIMITER //

CREATE PROCEDURE CreateNewOrder(
	IN p_order_id VARCHAR(32),
    IN p_customer_id VARCHAR(32),
    IN p_product_id VARCHAR(32),
    IN p_seller_id VARCHAR(32),
    IN p_price DECIMAL(10,2),
    IN p_freight DECIMAL(10,2)
)
BEGIN
	-- The Safety: Any SQL error activates the ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT 'Transaction Failed: Error encountered, all changes undone.' AS Status;
	END;
    
    START TRANSACTION;
    
    INSERT INTO orders (
		order_id, customer_id, order_status, order_purchase_timestamp
    )
    VALUES (
		p_order_id, p_customer_id, 'created', NOW()
	);
    
    INSERT INTO order_items (
		order_id, order_item_id, product_id, seller_id, price, freight_value
    )
    VALUES (
		p_order_id, 1, p_product_id, p_seller_id, p_price, p_freight
    );
    
    COMMIT;
    SELECT 'Transaction Successful: Order Created.' AS Status;
END //

DELIMITER ;

SELECT customer_id FROM customers LIMIT 1;
SELECT product_id FROM products LIMIT 1;
SELECT seller_id FROM sellers LIMIT 1;

CALL CreateNewOrder(
	'test-order-001',
    '00012a2ce6f8dcda20d059ce98491703',
    '00066f42aeeb9f3007548bb9d3f33c38',
    '0015a82c2db000af6aaaf3ae2ecb0532',
    149.99,
    15.50
);

SELECT * FROM orders WHERE order_id = 'test-order-001';
SELECT * FROM order_items WHERE order_id = 'test-order-001';