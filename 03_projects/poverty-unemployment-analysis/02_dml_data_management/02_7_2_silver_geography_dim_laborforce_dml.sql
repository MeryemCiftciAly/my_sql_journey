/*==========================================================================================
Laborforce Dataset - Silver layer
Geography Dimension 
Purpose: Store all geography-related data that changes infrequent relative to all other tables
=============================================================================================*/
--Step 1 Clean attributes
--Extract year from the attribute column and get a clean attribute name

WITH cleaned_attributes_geo_labor AS(
	SELECT
		fips_code,
		stateabbrv,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
	FROM bronze.source_laborforce_ny
	WHERE attribute_value ~ '^\d+(\.\d+)?$'
)

--Step 2 Insert into silver layer
INSERT INTO silver.dim_geography_laborforce(
	fips_code,
	year,
    attribute,
	code_value
)
--Step 3 workhorse getting the data into step no.2
SELECT
	fips_code,
	year_extracted AS year,
    attribute_extracted AS attribute,
	CASE 
	    WHEN TRIM(attribute_extracted) = 'Rural_Urban_Continuum_Code' AND year_extracted = 2023 THEN attribute_value::INTEGER
	    WHEN TRIM(attribute_extracted) = 'Metro' AND year_extracted = 2023 THEN attribute_value::INTEGER
	    WHEN TRIM(attribute_extracted) = 'Urban_Influence_Code' AND year_extracted = 2013 THEN attribute_value::INTEGER
END AS code_value
FROM cleaned_attributes_geo_labor
WHERE attribute_extracted IN ('Rural_Urban_Continuum_Code', 'Urban_Influence_Code', 'Metro');
