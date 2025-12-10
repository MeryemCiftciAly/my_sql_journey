SELECT * FROM customers;

-- Retrieve customers with score not equal to 0
SELECT * FROM customers
WHERE score <> 0;

--Retrieve customers from USA
SELECT * FROM customers
WHERE country = 'USA';

--Retrieving multiple information
SELECT
	first_name,
	country
FROM customers
WHERE country ='Germany';
