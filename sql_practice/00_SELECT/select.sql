-- Date: July 2, 2025: Practing retrieving date from a customers dataset I made up.


-- Retrieving based on country
SELECT 
	first_name,
	income,
	country
FROM customers
WHERE country = 'Kenya';

--Sorting the result
SELECT *
FROM customers
ORDER BY income DESC;

--Sorting the result by income
SELECT *
FROM customers
ORDER BY income;

SELECT *
FROM customers
ORDER BY 
income DESC,
last_name;

--Grouping the result

SELECT 
 country,
 SUM(income) AS total_score
FROM customers
GROUP BY country
ORDER BY sum(income) DESC;

-- Grouping the result
SELECT 
 country,
 SUM(income) AS total_score,
 COUNT(customer_id)
FROM customers
GROUP BY country
ORDER BY sum(income) DESC;

--Filtering the data after aggregation

SELECT
	country,
SUM(income)
FROM customers
WHERE income < 60000
GROUP BY country
HAVING SUM(income)< 50000;

--Removing Duplicates
SELECT DISTINCT
country
FROM customers;

--Specifying rows needed
--SELECT LIMIT 5 * --This is MySQL
--FROM customers;

SELECT * FROM customers --This is PostgreSQL
LIMIT 5;

--SELECT TOP 3 * -- This is MySQL
--FROM customers
--ORDER BY income DESC;

SELECT * FROM customers
ORDER BY income DESC --sorting in descending order making the highest value on top
LIMIT 5;

SELECT * FROM customers
ORDER BY income ASC --sorting in ascending order making the lowest value on top
LIMIT 5;

-- Sorting by dates

SELECT *
FROM customers
ORDER BY signup_date DESC
LIMIT 2;
