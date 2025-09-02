-- Showing where the data is stored or pulled from

SHOW data_directory;

SELECT datname FROM pg_database;

-- Exploring table schema

SELECT table_schema, table_name FROM information_schema.tables
WHERE table_type = 'BASE TABLE';


--Inspecting tables

SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema='public'
	AND table_name ='customers';

