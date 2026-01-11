
-- checking tables in the schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public';

-- Checking the columns in a table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema ='public'
	AND table_name = 'offices';

SELECT * FROM employees
LIMIT 10;

