/* ======================================================
Laborforce Dataset - Silver Layer
Income Fact Table 
Purpose: Extract income attribute and value only from the bronze layer
====================================================*/

WITH cleaned_attributes_income_labor AS(
	SELECT
		fips_code,
		stateabbrv AS stateabbrev,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
	FROM bronze.source_laborforce_ny
),

income_attributes AS (
	SELECT
		fips_code,
		stateabbrev,
		county,
		year_extracted,
		attribute_value,
		attribute_extracted
	FROM cleaned_attributes_income_labor
	WHERE
		attribute_extracted ILIKE '%_income%'
		OR attribute_extracted ILIKE '%MED_HH_%'
)
INSERT INTO silver.income_fact_laborforce(
		fips_code,
		year,
		stateabbrev,
		county,
		attribute,
		median_income_value,
		median_income_rate
)
SELECT
	fips_code,
	year_extracted AS year,
	stateabbrev,
	county,
	attribute_extracted AS attribute,
	CASE 
		WHEN attribute_extracted = 'Median_Household_Income' THEN attribute_value::NUMERIC
	END AS median_income_value,
	CASE 
		WHEN attribute_extracted = 'Med_HH_Income_Percent_of_State_Total' THEN attribute_value::NUMERIC
	END AS median_income_rate
FROM income_attributes
WHERE county != 'New York';

	

