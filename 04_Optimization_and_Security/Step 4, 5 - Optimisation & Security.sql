USE erp_simulation;

EXPLAIN SELECT * FROM customers WHERE customer_city = 'sao paulo';

CREATE INDEX idx_customer_city ON customers(customer_city);

CREATE VIEW marketing_customer_locations AS
SELECT customer_id, customer_city, customer_state
FROM customers;


SELECT * FROM marketing_customer_locations LIMIT 10;