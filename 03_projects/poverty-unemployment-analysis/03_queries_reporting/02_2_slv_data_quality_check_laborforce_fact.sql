/*=========================================================
Laborforce Dataset - Silver Layer
Purpose: Check the quality of the data
==========================================================*/

--Count rows

SELECT COUNT(*)FROM silver.laborforce_fact; --created without income rows
SELECT COUNT(*)FROM bronze.source_laborforce_ny;

--Null checks to ensure DDL constraints

SELECT *
FROM silver.laborforce_fact
WHERE fips_code IS NULL
	OR year IS NULL
	OR stateabbrev IS NULL
	OR county IS NULL
	OR attribute IS NULL;

SELECT COUNT(*)
FROM silver.laborforce_fact
WHERE employed_value IS NULL
	AND attribute = 'employment';

SELECT COUNT(*)
FROM silver.laborforce_fact
WHERE unemployed_value IS NULL
	AND attribute = 'unemployed';

SELECT COUNT(*)	
FROM silver.laborforce_fact
WHERE unemployment_rate IS NULL
	AND attribute = 'unemployment_rate';

--Logic and outlier check

SELECT MIN(employed_value), MAX(employed_value) AS employed_value,
	   MIN(unemployed_value), MAX(unemployed_value) AS unemployed_value,
	   MIN(unemployment_rate), MAX(unemployment_rate) AS unemployment_rate
FROM silver.laborforce_fact;


--Checking formatting on text

SELECT DISTINCT attribute FROM silver.laborforce_fact;

--Checking by year and other columns
SELECT DISTINCT year
FROM silver.laborforce_fact;
