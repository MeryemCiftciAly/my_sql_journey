--Data quality check for silver table after insertion

--Checking for null 
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
WHERE attribute IS NULL;,

--Checking for leading or trailıng spaces
SELECT *
FROM silver.poverty_fact
WHERE
 	stateabbrv <> TRIM(stateabbrv)
 OR county <> TRIM (county)
 OR attribute <> TRIM(attribute);

 --Validate the year
 SELECT DISTINCT year
 FROM silver.poverty_fact
 ORDER BY year;

 --Checking columns have correct values
 SELECT *
 FROM silver.poverty_fact
 WHERE attribute_value_count IS NOT NULL
 	AND value_type <> 'count';

--Percentage values
SELECT *
 FROM silver.poverty_fact
 WHERE attribute_value_percent IS NOT NULL
 	AND value_type <> 'percentage';

--Income
SELECT *
 FROM silver.poverty_fact
 WHERE income_value IS NOT NULL
 	AND value_type <> 'income';

--Code
SELECT *
 FROM silver.poverty_fact
 WHERE attribute IN ('rural_urban_continuum_code','urban_influence_code') 
 	AND value_type IS NOT NULL
	 AND value_type <> 'code';