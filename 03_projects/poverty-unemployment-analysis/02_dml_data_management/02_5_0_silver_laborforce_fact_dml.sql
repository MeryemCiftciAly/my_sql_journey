/*================================================================
 Laborforce Dataset - Silver Layer
 Laborforce Fact
 Purpose: Separate year from attribute text and derive values columns
 ====================================================================*/

WITH cleaned_attribute_labor AS(
	SELECT
		fips_code,
		stateabbrv,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS extracted_year,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
 FROM bronze.source_laborforce_ny
 WHERE attribute_value ~ '^\d+(\.\d+)?$'
)
INSERT INTO silver.laborforce_fact(
	fips_code,
	year,
	stateabbrev,
	county,
	attribute,
	employed_value,
	unemployed_value,
	unemployment_rate
)
SELECT
	fips_code,
	extracted_year AS year,
	stateabbrv AS stateabbrev,
	county,
	attribute_extracted AS attribute,
	CASE WHEN attribute_extracted = 'Employed' 
		THEN attribute_value::NUMERIC 
		ELSE NULL
	END AS employed_value,
	CASE WHEN attribute_extracted = 'Unemployed' 
		THEN attribute_value::NUMERIC 
		ELSE NULL
	END AS unemployed_value,
	CASE WHEN attribute_extracted = 'Unemployment_rate' 
		THEN attribute_value::NUMERIC
		ELSE NULL
	END AS unemployment_rate
FROM cleaned_attribute_labor
WHERE attribute_extracted NOT IN (
	'Civilian_labor_force',
	'Median_Household_Income',
	'Med_HH_Income_Percent_of_State_Total',
	'Urban_Influence_Code',
	'Rural_Urban_Continuum_Code',
	'Metro'
)
AND county <> 'New York';
	

