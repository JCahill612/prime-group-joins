-- Get all customers and their addresses.
SELECT * FROM customers;

SELECT * FROM customers JOIN addresses on customers.id = addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM orders;

SELECT * FROM orders JOIN line_items on line_items.order_id = orders.id;

-- Which warehouses have cheetos?
SELECT * FROM warehouse_product;

SELECT * FROM warehouse_product 
JOIN warehouse on warehouse_product.warehouse_id=warehouse.id
JOIN products on warehouse_product.product_id=products.id
WHERE description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM warehouse_product;

SELECT * FROM warehouse_product 
JOIN warehouse on warehouse_product.warehouse_id=warehouse.id
JOIN products on warehouse_product.product_id=products.id
WHERE description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT customer_id, COUNT(*) FROM customers
JOIN addresses on addresses.customer_id = customers.id
JOIN orders ON orders.address_id = addresses.id
GROUP BY first_name;

-- How many customers do we have?

SELECT COUNT(*) FROM customers;

-- How many products do we carry?

SELECT COUNT(*) FROM products;

-- What is the total available on-hand quantity of diet pepsi?

SELECT sum(on_hand) as total FROM products 
JOIN warehouse_product on warehouse_product.product_id= products.id
WHERE description = 'diet pepsi';
