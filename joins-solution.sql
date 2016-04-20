-- task 1: Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type
FROM customers
JOIN addresses ON addresses.customer_id = customers.id;

-- task 2: Get all orders and their line items.
SELECT orders.order_date, orders.total, line_items.unit_price, line_items.quantity
FROM orders
JOIN line_items ON line_items.order_id = orders.id;

-- task 3: Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'cheetos';

-- task 4: Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';

-- task 5: Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT sum(orders.total), customers.first_name
FROM orders
JOIN addresses ON orders.address_id = addresses.id
JOIN customers ON addresses.customer_id = customers.id
GROUP BY customers.first_name;

-- task 6: How many customers do we have?
SELECT count(*) FROM customers;

-- task 7: How many products do we carry?
SELECT count(*) FROM products;

-- task 8: What is the total available on-hand quantity of diet pepsi?
SELECT products.description, sum(warehouse_product.on_hand)
FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
GROUP BY products.description;
