SET search_path to gold;
SHOW search_path;

/*========================================
Poverty Database
Geography Dimension Table
==========================================*/

INSERT INTO gold.dim_geography_poverty (geography_name)
SELECT DISTINCT
	CASE
		WHEN attribute = 'Rural_Urban_Continuum_Code' THEN 'Urban Mixed Areas'
		WHEN attribute = 'Urban_Influence_Code' THEN 'Urban Areas'
		ELSE NULL
	END AS geography_name	
FROM silver.dim_geography_poverty
GROUP BY attribute;