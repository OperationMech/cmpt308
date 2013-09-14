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
