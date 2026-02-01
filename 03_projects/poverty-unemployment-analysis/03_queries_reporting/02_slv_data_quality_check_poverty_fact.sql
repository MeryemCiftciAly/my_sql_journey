/*=========================================================
Poverty Dataset - Silver Layer
Purpose: Check the quality of the data
==========================================================*/
--Checking for leading or trailıng spaces
SELECT *
FROM silver.poverty_fact
WHERE
 	stateabbrev <> TRIM(stateabbrev)
 OR county <> TRIM (county)
 OR attribute <> TRIM(attribute);

 --Validate the year
 SELECT DISTINCT year
 FROM silver.poverty_fact
 ORDER BY year;

 --Count rows

SELECT COUNT(*)FROM silver.poverty_fact; --created without income rows
SELECT COUNT(*)FROM bronze_source_poverty_ny;

--Null checks to ensure DDL constraints

SELECT *
FROM silver.poverty_fact
WHERE fips_code IS NULL
	OR year IS NULL
	OR stateabbrev IS NULL
	OR county IS NULL
	OR attribute IS NULL
	OR attribute_value;

-- Checking numeric values
SELECT *
FROM silver.poverty_fact
WHERE attribute_value_count IS NOT NULL
	OR attribute_value_percent IS NOT NULL;


--fips_code

SELECT
	COUNT (*) AS null_fips_code
FROM silver.poverty_fact
WHERE fips_code IS NULL;

--year

SELECT
	COUNT (*) AS null_year
FROM silver.poverty_fact
WHERE year IS NULL;

--attribute
SELECT
	COUNT (*) AS null_attribute
FROM silver.poverty_fact
WHERE attribute IS NULL;

--Logic and outlier check

SELECT MIN(attribute_value_count) 	AS min_attribute_count, MAX(attribute_value_count) 	 AS max_attribute_count,
	   MIN(attribute_value_percent) AS min_attribute_percentage, MAX(attribute_value_percent) AS max_attribute_percentage
FROM silver.poverty_fact;

SELECT *
FROM silver.poverty_fact
WHERE attribute_value_count = 203479962;

SELECT county, year, TRIM(attribute), attribute_value_count
FROM silver.poverty_fact
WHERE TRIM(attribute) ='POV017'
ORDER BY attribute_value_count DESC;


--Checking formatting on text

SELECT DISTINCT attribute FROM silver.poverty_fact;

--Checking by year and other columns
SELECT DISTINCT year
FROM silver.poverty_fact;
