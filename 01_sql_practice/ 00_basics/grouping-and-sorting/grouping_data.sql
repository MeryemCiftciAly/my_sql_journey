--Find the total score for each country

SELECT * FROM customers;

SELECT country, sum(score) AS total_score
FROM customers
GROUP BY country
ORDER BY sum(score) DESC;

--Find the total score and the total number of customers of each country
SELECT country, COUNT(id) AS total_customers, SUM(score) AS total_score
FROM customers
GROUP BY country
ORDER BY SUM(score) DESC;