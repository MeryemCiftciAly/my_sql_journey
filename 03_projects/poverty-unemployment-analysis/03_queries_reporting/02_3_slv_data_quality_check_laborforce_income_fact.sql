/*=========================================================
Laborforce Dataset - Silver Layer
Income fact
Purpose: Check the quality of the data
==========================================================*/

--Count rows

SELECT COUNT(*)FROM silver.income_fact_laborforce; --created without income rows

SELECT COUNT(*)
FROM bronze.source_laborforce_ny
WHERE attribute ILIKE '%income%'
	AND county != 'New York';
  
--Null checks to ensure DDL constraints

SELECT *
FROM silver.income_fact_laborforce
WHERE fips_code IS NULL
	OR year IS NULL
	OR stateabbrev IS NULL
	OR county IS NULL
	OR attribute IS NULL;


--Logic and outlier check

SELECT MIN(median_income_value) AS min_income,  MAX(median_income_value) AS max_income,
	   MIN(median_income_rate)  AS min_rate,    MAX(median_income_rate)  AS max_rate
   FROM silver.income_fact_laborforce;


--Checking formatting on text

SELECT DISTINCT attribute FROM silver.income_fact_laborforce;

--Checking by year and other columns
SELECT DISTINCT year
FROM silver.income_fact_laborforce;