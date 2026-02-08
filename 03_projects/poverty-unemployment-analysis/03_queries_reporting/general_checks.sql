/*=======================================================
Validation and general checks
=======================================================*/

--Bronze Layer Checks

SELECT * FROM bronze.laborforce_fact;
SELECT * FROM bronze.poverty_fact;

--Checking file path
SHOW data_directory;

--Check New York Sorce Table
SELECT * FROM bronze.source_laborforce_ny --bronze
LIMIT 10;

SELECT COUNT(*) FROM bronze.source_laborforce_ny;

----------

SELECT * FROM bronze.source_poverty_ny --bronze
LIMIT 10;

SELECT COUNT(*) FROM bronze.source_poverty_ny;
--=======================================================

SELECT * FROM silver.poverty_fact -- silver 
LIMIT 10;

SELECT COUNT(*) FROM silver.poverty_fact;

-----------------

SELECT * FROM silver.income_fact_poverty --silver
LIMIT 10;

SELECT COUNT(*) FROM silver.income_fact_poverty;

------

SELECT * FROM silver.county_dim_poverty -- silver
LIMIT 10;

SELECT COUNT(*) FROM silver.county_dim_poverty;

----------

SELECT * FROM silver.dim_geography_poverty
LIMIT 10; -- silver

SELECT COUNT(*) FROM silver.dim_geography_poverty;

-------

-- Checking data type in schema
SELECT 
	column_name,
	data_type
FROM information_schema.columns
WHERE table_schema ='bronze'
	AND table_name = 'source_poverty_ny'
	AND column_name = 'attribute_value';

-- Checking for null values
SELECT *
FROM bronze.source_poverty_ny
WHERE attribute_value IS NULL;

--looking for non-numeric values
SELECT *
FROM bronze.source_poverty_ny
WHERE attribute_value::text ~ '[A-Za-z]';

--Checking row counts scope table against source table

SELECT COUNT(*) AS numeric_rows
FROM silver.poverty_fact
WHERE attribute_value_count IS NOT NULL
	OR attribute_value_percent IS NOT NULL;

SELECT COUNT(*) AS numeric_rows
FROM silver.poverty_fact
WHERE stateabbrev = 'NY';




	

