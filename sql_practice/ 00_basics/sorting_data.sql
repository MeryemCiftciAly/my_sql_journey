/*Retrieve all customers and sort the result by the highest score first */

SELECT * FROM customers; -- checking the data

SELECT *
FROM customers
ORDER BY score DESC;

SELECT *
FROM customers
ORDER BY score ASC;


--Retrieve all customers and sort the result by the country and then by the highest score
SELECT * 
FROM customers
Order by score DESC, country ASC;