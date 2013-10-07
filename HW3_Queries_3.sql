--SQL Queries3 HW
--Anthony Cali
--Oct 7, 2013
--HW3_Queries_3.sql

--Get the cities of agents booking an order for customer c002 (subquery).
--taken from hw2
SELECT city
  FROM agents
 WHERE aid IN 
( SELECT aid
    FROM orders
   WHERE cid = 'c002'
);

--Get the cities of agents booking an order for customer c002 (join).
SELECT a.city AS "Agent City"
  FROM agents a, orders o
 WHERE o.cid = 'c002'
   AND o.aid = a.aid;
   
/*Get the pids of all products ordered by an agent
  who has at least one order from Kyoto (subquery).*/ 
-- taken from hw2
SELECT DISTINCT o1.pid 
  FROM orders o1
 WHERE o1.aid IN
( SELECT o2.aid
    FROM orders o2 
   WHERE o2.cid IN
  ( SELECT c.cid
      FROM customers c
     WHERE c.city = 'Kyoto'
  )
)
ORDER BY o1.pid ASC;

/*Get the pid(s) of all product(s) ordered by an agent
  who has at least one order from Kyoto (join)*/
SELECT DISTINCT o1.pid
  FROM orders o1
 INNER JOIN orders o2 ON o1.aid = o2.aid
 INNER JOIN customers c ON o2.cid = c.cid
 WHERE c.city = 'Kyoto'
 ORDER BY o1.pid ASC;

--Name(s) of customer(s) who have not placed any orders (subquery).
SELECT c.name
  FROM customers c
 WHERE c.cid not in 
(  SELECT cid
     FROM orders 
);

--Name(s) of customer(s) who have not placed any orders (join).
SELECT c.name
  FROM orders o RIGHT OUTER JOIN customers c
  on o.cid = c.cid
  WHERE o.cid IS null;
  
--Name(s) of customer(s) who ordered through local agent(s).
SELECT DISTINCT c.name, a.name
  FROM agents a 
 INNER JOIN orders o ON a.aid = o.aid
 INNER JOIN customers c ON o.cid = c.cid
 WHERE c.city = a.city;
 
--Name(s) of customer(s) and agent(s) who are in the same city.
SELECT DISTINCT c.name, a.name, c.city
  FROM agents a , customers c
 WHERE c.city = a.city;
  
--Name of customer(s) who live in the city with the least product(s) made.
SELECT c.name, c.city
  FROM customers c
 WHERE c.city in
( SELECT city
   FROM
(  SELECT p1.city, count(p1.pid)
     FROM products p1
    WHERE p1.city in
  (  SELECT DISTINCT p2.city
       FROM products p2
  )
    GROUP BY p1.city  
    limit 1 
  ) subquery
);