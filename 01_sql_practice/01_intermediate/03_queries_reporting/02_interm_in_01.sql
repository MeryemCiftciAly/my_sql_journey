/* Find the title and author of all books that meet the following criteria:
--The book has more than 150,000 words AND
--The author is 'J.K. Rowling' OR 'Stephenie Meyer' */

SELECT 
  author, title
FROM
  books
WHERE 
  words > 150000
AND author IN ("J.K. Rowling", "Stephenie Meyer");


/*
1.  Find the author and title of all books with more than 150,000 words.
2.  Filter this set further to include only books by 'J.K. Rowling' OR 'Stephenie Meyer'.
3.  The final result set **must be permanent, static, and optimized for fast access** (data freshness is not a requirement, as the source data will not change). */

--CREATE TABLE AS SELECT statement is used instead of a CRETE VIEW because the resulting data is required to be static and fast for querying, and also, because the underlying 'books' data is not expected to change.

CREATE TABLE big_author_books AS 
SELECT 
  author, title
FROM
  books
WHERE 
  words > 150000
AND author IN ("J.K. Rowling", "Stephenie Meyer");
