/*=====================================================================================================
Gold Layer - Poverty Fact Table INSERT
Purpose: Insert silver table records and join all share dimensions. Filter out state-level Fips_codes
========================================================================================================*/

INSERT INTO gold.fact_poverty(
	year_id,
	county_id,
	age_group_id,
	geo_id,
	fips_code,
	poverty_count,
	poverty_rate,
	median_income,
	lower_income_estimates,
	upper_income_estimates
)
SELECT
	y.year_id,
	c.county_id,
	a.age_group_id,
	g.geo_id,
	p.fips_code::VARCHAR(5) AS fips_code,

	--Separate the count and percentages from the attribute column
	MAX(p.attribute_value_count) AS poverty_count,
	MAX(p.attribute_value_percent) AS poverty_rate,
	MAX(i.median_income) AS median_income,
	MAX(i.lower_income_estimate) AS lower_income_estimate,
	MAX(i.upper_income_estimate) AS upper_income_estimate
	
FROM silver.poverty_fact p

--Join the income fact table from the silver schema
LEFT JOIN silver.income_fact_poverty i
	ON p.fips_code = i.fips_code AND p.year = i.year

--Join the dimension tables

JOIN gold.dim_year y
	ON y.year_label::INTEGER = p.year
	
--County
JOIN gold.dim_county c
	ON c.fips_code = p.fips_code

--Age Group
JOIN gold.dim_age_group a
	ON a.age_group_code = CASE
			WHEN p.attribute ILIKE  '%ALL%' THEN 'ALL'
			WHEN p.attribute ILIKE '%017%' THEN '017'
			WHEN p.attribute ILIKE '%517%' THEN '517'
		END

--Geography
LEFT JOIN gold.dim_geography g
	ON g.fips_code = p.fips_code AND g.year_id = y.year_id
	WHERE p.fips_code NOT IN (36000)

--Grouping the the deminsions to collapse the rows into a single row while the MAX filter out any null values
GROUP BY
	y.year_id,
	c.county_id,
	a.age_group_id,
	g.geo_id,
	p.fips_code;
	