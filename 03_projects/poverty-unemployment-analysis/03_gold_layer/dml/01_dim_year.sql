/*=======================
Gold Layer
Year Dimension Table
========================*/

INSERT INTO gold.dim_year(year_id, year_label)
SELECT DISTINCT
	year,
	year::TEXT
FROM (
	SELECT year FROM silver.year_dim_poverty
	UNION
	SELECT year FROM silver.year_dim_laborforce
 ) AS combined_years
;

