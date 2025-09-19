-- Query to inspect the table structure, schema and data in the table

-- Checking the tables in the database 'Classic Models'
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE';

--Looking at the rows
SELECT table_name,
	(SELECT COUNT(*) FROM public."offices") AS row_count
FROM information_schema.tables
WHERE table_schema = 'public';


SELECT * FROM offices
Limit 5;
