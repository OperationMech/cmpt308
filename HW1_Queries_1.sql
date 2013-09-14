-- CAP2 Queries 1
-- Anthony Cali
-- Sept 15, 2013

--List all customers.

SELECT *
FROM customers;

--List all agents named Smith.

SELECT name, city
WHERE name = "Smith"
FROM agents;

--List products (pid, name, and quantity) over USD 1.50.

SELECT pid, name, quantity
WHERE priceusd > 1.50
FROM products;

--List the order number and agent id of all orders.

SELECT ordno, aid
WHERE *
FROM oeders;

