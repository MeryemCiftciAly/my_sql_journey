/*======================================================================================
Poverty Dataset - Silver Layer
Fact Table
Purpose: Store all non-income and geography code attributes and values
==========================================================================================*/

--Step 1 Clean attributes
--Extract year from the attribute column and get a clean attribute name

WITH cleaned_attributes AS(
	SELECT
		fips_code,
		stateabbrv,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
	FROM bronze_source_poverty_ny
	WHERE attribute_value ~ '^\d+(\.\d+)?$'
),

--Step 2 classify attributes
--Create a classification table to identify value types separately
classified AS(
	SELECT *,
		  CASE
			WHEN attribute_extracted LIKE '%PCT_%' OR attribute_extracted LIKE '%_P%' THEN 'percentage'
			ELSE 'count'
		END AS value_type 
	FROM cleaned_attributes
)

--Step 3 Insert into silver layer
--Identify target columns in the silver schema table
INSERT INTO silver.poverty_fact(
	fips_code,
	year,
	stateabbrev,
	county,
	attribute,
	attribute_value_percent,
	attribute_value_count	
)

--Step 4 workhorse
--Finalize transformation: Distribute values based on classification
SELECT
	fips_code,
	year_extracted AS year,
	stateabbrv as stateabbrev,
	county,
	attribute_extracted AS attribute,
	CASE WHEN value_type = 'percentage' THEN attribute_value::NUMERIC END AS percentage_value,
	CASE WHEN value_type = 'count' 		THEN attribute_value::INTEGER END AS count_value
FROM classified
WHERE attribute_extracted NOT ILIKE '%INC%'
  AND attribute_extracted NOT ILIKE '%CODE%';
