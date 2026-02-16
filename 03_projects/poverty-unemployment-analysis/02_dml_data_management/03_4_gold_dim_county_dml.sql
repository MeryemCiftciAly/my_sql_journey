SET search_path to gold;
SHOW search_path;

/*========================================
Poverty Database
County Dimension Table
==========================================*/

INSERT INTO gold.dim_county (county_id,county_name, state_abbreviation)
SELECT 
	ROW_NUMBER() OVER (ORDER BY county) AS county_id,
	county AS county_name,
	stateabbrev AS state_abbreviation
FROM silver.county_dim_poverty
WHERE county <> 'New York';
