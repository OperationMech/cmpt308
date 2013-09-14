-- CAP2 Queries 1
-- Anthony Cali
-- Sept 15, 2013

--List all customers.
SELECT *
FROM customers;

--List all agents named Smith.
SELECT name, city
FROM agents
WHERE name = 'Smith';


--List products (pid, name, and quantity) over USD 1.50.
SELECT pid, name, quantity
FROM products
WHERE priceusd > 1.50;

--List the order number and agent id of all orders.
SELECT ordno, aid
FROM orders;

--List the names and cities of customers not in Dallas.
SELECT name, city
FROM customers
WHERE city <> 'Dallas';

--List the names of agents in New York or Newark.
SELECT name
FROM agents
WHERE city = 'New York'
OR city = 'Newark';

--List all product data for thoes not in New York or Newark and USD 1.00 or less.
SELECT *
FROM products
WHERE priceusd <= 1.00
AND (city <> 'New York' AND city <> 'Newark');

--List all data for orders in Jan or March
SELECT *
FROM orders
WHERE mon = 'jan'
OR mon = 'mar';

--List all data for orders in Feb less than USD 100.
SELECT *
FROM orders
WHERE dollars < 100.00
AND mon = 'feb';

--List all orders for customer C005.
SELECT *
FROM orders
WHERE cid = 'c005';
