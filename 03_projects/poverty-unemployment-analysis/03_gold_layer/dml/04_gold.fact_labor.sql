
/*=====================================
Gold Labor Fact Table
=====================================*/
INSERT INTO gold.fact_labor(
	year_id, county_id, age_group_id,
	geo_id,fips_code, employed_value, unemployed_value, unemployment_rate,
	median_income_value, median_income_rate
)

SELECT
		y.year_id,
		c.county_id,
		a.age_group_id,
		g.geo_id,
		l.fips_code,
		MAX(CASE WHEN l.attribute = 'Employed' THEN l.employed_value END) AS employed_value,
		MAX(CASE WHEN l.attribute = 'Unemployed' THEN l.unemployed_value END) AS unemployed_value,
		MAX(CASE WHEN l.attribute ='Unemployment_rate' THEN l.unemployment_rate END) AS unemployment_rate,
		MAX(m.median_income_value) AS median_income_value,
		MAX(m.median_income_rate) AS median_income_rate
	FROM silver.laborforce_fact l
	LEFT JOIN silver.income_fact_laborforce m
		ON l.fips_code = m.fips_code AND l.year =  m.year
	JOIN gold.dim_year y ON  y.year_label::INTEGER = l.year
	JOIN gold.dim_county c ON c.fips_code = l.fips_code
	JOIN gold.dim_age_group a ON a.age_group_code = 'ALL'
	LEFT JOIN gold.dim_geography g ON g.fips_code = l.fips_code AND g.year_id = l.year
	GROUP BY
		y.year_id,
		c.county_id,
		a.age_group_id,
		g.geo_id,
		l.fips_code;









	
