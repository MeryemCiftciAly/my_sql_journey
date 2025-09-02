--Checking the orders table before inserting the data

SELECT column_name, data_type, character_maximum_length, is_nullable, column_default
FROM information_schema.columns
WhERE table_name = 'orders';

--referencing data in both tables
SELECT * FROM orders;
SELECT * FROM bookstore;

/* Inserting books that were sold into the orders table
This will create a new dataset with books sold and order information*/

INSERT INTO orders(order_id, customer_id, order_date, sales)
SELECT
		book_id + 2000 AS order_id,
		CASE book_id
		WHEN 1	THEN 1
		WHEN 2 	THEN 2
		WHEN 4 	THEN 3
		WHEN 6 	THEN 6
		WHEN 8 	THEN 1
		WHEN 10	THEN 2
		WHEN 5  THEN 3
	END AS customer_id,
	COALESCE(published_date, CURRENT_DATE-(RANDOM()*365)::INT) AS order_date,
	CEIL(RANDOM()*50)::INT AS sale
FROM bookstore
WHERE book_id IN (1,2,4,6,8,10,5);

--checking table after insertion
SELECT * FROM orders;

--calculating total revenue

--============================================================

--Updating the orders table
UPDATE orders
SET order_date = '2025-8-28',
	sales = 8
WHERE order_id = 2002;


--Updating multiple vaues
UPDATE orders
SET
	order_date = CASE
		WHEN order_id = 1001 THEN '2025-03-28'
		WHEN order_id = 1002 THEN '2025-02-18'
		WHEN order_id = 1003 THEN '2024-12-31'
		WHEN order_id = 1004 THEN '2025-05-10'
		ELSE order_date
	END,

	sales = CASE
		WHEN order_id = 2006 THEN 20
		ELSE sales
	END
	
WHERE order_id IN (1001, 1002, 1003, 1004, 2006);

--Adding new colums to orders table
ALTER TABLE orders
ADD COLUMN price DECIMAL(10,2),
ADD COLUMN quantity INT;

--Dropping quantity column
ALTER TABLE orders
DROP COLUMN quantity;

--Updating orders table
ALTER TABLE orders
RENAME COLUMN sales to quantity;

--Renaming price column
ALTER TABLE orders
RENAME COLUMN price to unit_price;

--Addingt total revenue column
ALTER TABLE orders
ADD COLUMN total_revenue NUMERIC(10,2)

/* In this step the unit price is taken from the bookstore table
it is inserted in the orders table to calculate total revenue */

-- Adding book ID column
ALTER TABLE orders
ADD COLUMN book_id INT;

--Adding book ID values
UPDATE orders
SET book_id = CASE
	WHEN order_id = 2001 THEN 1
	WHEN order_id = 2002 THEN 2
	WHEN order_id = 2004 THEN 4
	WHEN order_id = 2006 THEN 6
	WHEN order_id = 2008 THEN 8
	WHEN order_id = 2010 THEN 10
	WHEN order_id = 2005 THEN 5
	ELSE NULL
END;

/* There are null values in the book ID column. All books should have an id
going to introduce book ID number*/

WITH new_ids AS(
	SELECT
		order_id,
		ROW_NUMBER() OVER (ORDER BY order_id) + 10 AS new_book_id
	FROM orders
	WHERE book_id IS NULL
)

UPDATE orders AS o
SET book_id = n.new_book_id
FROM new_ids AS n
WHERE o.order_id = n.order_id;

--Enduring going forward all book id are entered
ALTER TABLE orders
ALTER COLUMN book_id SET NOT NULL;

--Taking price from bookstore table to orders table to calculate revenue

UPDATE orders AS o
SET unit_price = b.price - COALESCE(b.discount_price, 0) --makes sure discount is calculate where indicated
FROM bookstore AS b
WHERE o.book_id = b.book_id;

SELECT * FROM orders;

--Replacing null in the unit price from the original orders table

WITH new_price AS(
	SELECT
	  order_id,
	  ROUND((random()*(30 - 10)+ 10)::NUMERIC,2) AS new_unit_price
	FROM orders
	WHERE unit_price IS NULL
)

UPDATE orders AS o
SET unit_price = n.new_unit_price
FROM new_price AS n
WHERE o.order_id = n.order_id;

--Calculating and adding total revenue
UPDATE orders
SET total_revenue = quantity * unit_price
WHERE total_revenue IS NULL;

--Checking the table after update
SELECT * FROM orders;
