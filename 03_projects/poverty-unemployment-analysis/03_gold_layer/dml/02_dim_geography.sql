/*================================
Geography Dimension Table
==================================*/

INSERT INTO gold.dim_geography(
	fips_code,
	year_id,
	mixed_area_label,
	urban_area_label,
	metro_area_label
)
SELECT
	combined.fips_code, 
	y.year_id, 
	MAX(CASE WHEN combined.attribute = 'Rural_Urban_Continuum_Code' AND combined.year IN (2013, 2023)
	THEN 'Mixed_Area' END) AS mixed_area,
	
	MAX(CASE WHEN combined.attribute = 'Urban_Influence_Code' AND combined.year IN (2013, 2024)
	THEN 'Urban_Area'  END) AS urban_area,
	
	MAX(CASE WHEN combined.attribute = 'Metro' AND combined.year = 2023
	THEN 'Metropolitan Area' END) AS metro_area
FROM(
	SELECT fips_code, year, attribute FROM silver.dim_geography_poverty
	UNION ALL
	SELECT fips_code, year, attribute FROM silver.dim_geography_laborforce
)AS combined
--Joing table for the Year ID
JOIN gold.dim_year y ON combined.year = y.year_label::INTEGER
GROUP BY combined.fips_code, y.year_id;
