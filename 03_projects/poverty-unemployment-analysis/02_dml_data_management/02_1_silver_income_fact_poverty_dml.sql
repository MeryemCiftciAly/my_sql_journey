/* ====================================================================
Poverty Dataset - Silver Layer
Income Fact Table Insert

Purpose: Extract income attribute and value only from the bronze layer
========================================================================*/
--Step 1 create a table to reference later with the cleaned attribute data
WITH cleaned_attributes_income AS(
	SELECT
		fips_code,
		stateabbrv,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
	FROM bronze_source_poverty_ny
	WHERE attribute_value ~ '^\d+(\.\d+)?$' --Keep only numeric values no comma, text)
)

--Step 2 Insert into silver layer
--Identify target columns in the silver schema table
INSERT INTO silver.income_fact_poverty(
	fips_code,
	year,
	stateabbrev,
	county,
	attribute,
	median_income,
	upper_income_estimate,
	lower_income_estimate
)

--Step 3 workhorse
--Finalize transformation: Distribute values based on classification
SELECT
	fips_code,
	year_extracted AS year,
	stateabbrv as stateabbrev,
	county,
	attribute_extracted AS attribute,
	CASE WHEN value_type = 'income' AND attribute_extracted ILIKE '%MED%' THEN attribute_value::NUMERIC
	END AS median_income,
	CASE WHEN value_type ='income' AND attribute_extracted ILIKE '%UB%' THEN attribute_value::NUMERIC
	END AS upper_income_estimate,
	CASE WHEN value_type = 'income' AND attribute_extracted ILIKE '%LB%' THEN attribute_value::NUMERIC
	END AS lower_income_estimate
	FROM cleaned_attributes_income;
