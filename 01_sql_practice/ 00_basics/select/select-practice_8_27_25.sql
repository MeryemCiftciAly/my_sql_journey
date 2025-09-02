--Selecting all data from the table
SELECT * FROM customers;

--Selecting top 3 customers by score
SELECT * FROM customers
ORDER BY score DESC
LIMIT 3;


/* I experimented to see how ordering looks and found
this behavior in PostgreSQL. Ordering by table flipped the
dataset from bottom to top */

SELECT * FROM customers
ORDER BY customers DESC
LIMIT 5;

--Just selecting top three customers no regard to other data in table
SELECT * FROM customers
LIMIT 3;