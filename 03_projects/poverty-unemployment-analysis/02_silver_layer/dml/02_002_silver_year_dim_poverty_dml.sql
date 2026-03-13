/*================================================================================
Poverty Dataset - Silver layer
Year Dimension Table
Purpose: Reference table across fact and dimension tables
=================================================================================*/


WITH cleaned_attributes_year AS(
	SELECT
		CAST(regexp_replace(attribute, '.*_(\d{4})$', '\1') AS INTEGER) AS year_extracted
	FROM bronze.source_poverty_ny
)
INSERT INTO silver.year_dim_poverty(
SELECT DISTINCT year_extracted AS year
FROM cleaned_attributes_year
);


