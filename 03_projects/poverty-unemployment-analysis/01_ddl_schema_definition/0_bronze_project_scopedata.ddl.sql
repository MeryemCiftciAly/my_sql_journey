
/*==========================================================================
 Poverty Dataset - Bronze Layer

Project Scope Table Creation: New York Poverty Data
Purpose: First step before beginning the silver layer
Extract all New York data from the bronze layer
--==========================================================================*/

--Creating table with only New York data for the scope of the project from the bronze layer

CREATE TABLE bronze.bronze_source_poverty_ny AS
SELECT *
FROM bronze.poverty_fact
WHERE stateabbrv = 'NY';

--Inspecting table after creation

SELECT *
FROM bronze_source_poverty_ny
LIMIT 100;

--Checking bronze schema for table creation

SELECT 
	table_name,
	column_name,
	data_type
FROM information_schema.columns
WHERE table_schema ='bronze'
ORDER BY table_name, ordinal_position;

