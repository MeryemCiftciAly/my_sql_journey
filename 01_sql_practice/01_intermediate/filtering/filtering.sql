/* This is a practice in excluding values - Intermediate */

SELECT * FROM bookstore;

SELECT * FROM bookstore
WHERE author = 'Meryem Ciftci';

SELECT * FROM bookstore
WHERE price > 10.00;

SELECT * FROM bookstore
WHERE genre != 'Autobiography';

SELECT *
 FROM bookstore
 WHERE isbn != NULL
  OR genre = 'Coloring';

SELECT *
	FROM bookstore
	WHERE discount_price IS NOT NULL;

SELECT author
	FROM bookstore
	WHERE published_date IS NULL
	AND
	discount_price > 2.00;

--Filtering by excluding values

SELECT *
FROM bookstore
	WHERE NOT author = 'Meryem Ciftci';

SELECT *
 FROM bookstore
   WHERE author != 'Meryem Ciftci';

SELECT *
FROM bookstore
	WHERE author <> 'Meryem Ciftci';

-- Replacing an incorrect value without matching the entire values
UPDATE bookstore
SET Author = REPLACE(Author, 'Citcti', 'Ciftci');

