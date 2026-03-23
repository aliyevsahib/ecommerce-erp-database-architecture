USE erp_simulation;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM customers;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED  BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM sellers;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, @v_category, @v_name_len, @v_desc_len, @v_photos, @v_weight, @v_length, @v_height, @v_width)
SET
	product_category_name = NULLIF(@v_category, ''),
    product_name_length = NULLIF(@v_name_len, ''),
    product_description_length = NULLIF(@v_desc_len, ''),
    product_photos_qty = NULLIF(@v_photos, ''),
    product_weight_g = NULLIF(@v_weight, ''),
    product_length_cm = NULLIF(@v_length, ''),
    product_height_cm = NULLIF(@v_height, ''),
    product_width_cm = NULLIF(@v_width, '');

SELECT COUNT(*) FROM products;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, @v_order_stat, @v_order_purc_time, @v_order_appr_at, @v_order_del_car_date, @v_order_del_cus_date, @v_order_est_del_date)
SET
	order_status = NULLIF(@v_order_stat, ''),
    order_purchase_timestamp = NULLIF(@v_order_purc_time, ''),
    order_approved_at = NULLIF(@v_order_appr_at, ''),
    order_delivered_carrier_date = NULLIF(@v_order_del_car_date, ''),
    order_delivered_customer_date = NULLIF(@v_order_del_cus_date, ''),
    order_estimated_delivery_date = NULLIF(@v_order_est_del_date, '');

SELECT COUNT(*) FROM orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM order_items;