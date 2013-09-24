--SQL Queries2 HW
--Anthony Cali
--Sept 23, 2013
--HW2_Queries_2.sql

--Changed all queries to reflect Alan's idea of life being contradictory.

--Display the cities of agent(s) who ordered for customer c002.
SELECT city
  FROM agents
 WHERE aid IN 
( SELECT aid
    FROM orders
   WHERE cid = 'c002'
);

/*Get the pids of all products ordered by an agent
  who has at least one order from Kyoto.*/
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
);

--Find cid(s) and name(s) of customer(s) who never ordered from a03
SELECT c.cid, name
  FROM customers c
 WHERE c.cid not in
(  SELECT o.cid
     FROM orders o
    WHERE o.aid = 'a03'
);  

-- Cid(s) and name(s) of customers who ordered products p01 and p07
SELECT c.cid, name
  FROM customers c
 WHERE c.cid IN
(  SELECT o1.cid
     FROM orders o1
    WHERE o1.pid = 'p01'
      AND cid IN
  (  SELECT o2.cid
       FROM orders o2
      WHERE o2.pid = 'p07'
  )
); 

--Find pid(s) for all customers who ordered from a03.
SELECT DISTINCT o1.pid
  FROM orders o1
 WHERE cid IN 
(  SELECT c.cid
     FROM customers c
    WHERE c.cid IN
  (  SELECT o2.cid
     FROM orders o2
    WHERE o2.aid = 'a03'
  )
);

--Name(s) and discount(s) for customer(s) who deal with agent(s) in Dallas or Duluth.
SELECT c.cid, c.discount
  FROM customers c
 WHERE c.cid IN
( SELECT o.cid
    FROM orders o 
   WHERE o.aid IN
  ( SELECT a.aid
      FROM agents a
     WHERE a.city = 'Dallas'
	    OR a.city = 'Duluth'
  )
);

--Find all customers who have the same discount of any in Dallas or Kyoto.
SELECT name, discount
  FROM customers
 WHERE discount IN 
(  SELECT discount
     FROM customers
    WHERE city = 'Dallas'
	   OR city = 'Kyoto'
);

--Find the IDs of customers who have placed orders but not with a03.
SELECT o1.cid
  FROM orders o1
 WHERE o1.cid not in
(  SELECT o2.cid
     FROM orders o2
    WHERE aid = 'a03' 
);