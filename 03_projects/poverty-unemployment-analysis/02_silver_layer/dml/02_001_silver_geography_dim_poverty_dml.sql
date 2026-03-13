/*==================================================================
Poverty Dataset - Silver layer
Geography Dimension Table
Purpose: Store all grography-related data that changes infrequent relative to all other tables
=============================================================================================*/
--Step 1 Clean attributes
--Extract year from the attribute column and get a clean attribute name

WITH cleaned_attributes_geography AS(
	SELECT
		fips_code,
		stateabbv,
		county,
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted,
		regexp_replace(attribute, '(.*)_[0-9]{4}$', '\1') AS attribute_extracted,
		attribute_value
	FROM bronze.source_poverty_ny
)

--Step 2 Insert into silver layer
--Identify target columns in the silver schema table
INSERT INTO silver.dim_geography_poverty(
	fips_code,
	year,
    attribute,
	code_value
)
--Step 3 workhorse
--Finalize transformation: place values into urban and rural columns adjacent to respective year
SELECT
	fips_code,
	year_extracted AS year,
    attribute_extracted AS attribute,
	CASE 
	    WHEN TRIM(attribute_extracted) = 'Rural_Urban_Continuum_Code' AND year_extracted = 2013 THEN attribute_value::INTEGER
	    WHEN TRIM(attribute_extracted) = 'Rural_Urban_Continuum_Code' AND year_extracted = 2023 THEN attribute_value::INTEGER
	    WHEN TRIM(attribute_extracted) = 'Urban_Influence_Code' AND year_extracted = 2013 THEN attribute_value::INTEGER
	    WHEN TRIM(attribute_extracted) = 'Urban_Influence_Code' AND year_extracted = 2024 THEN attribute_value::INTEGER
END AS code_value
FROM cleaned_attributes_geography
WHERE attribute_extracted IN ('Rural_Urban_Continuum_Code', 'Urban_Influence_Code');
