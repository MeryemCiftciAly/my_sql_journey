/*============================================================================
Gold Layer - Poverty Fact Table
Purpose: Combine Silver Poverty and Income Facts, link to all deminsion tables
		 data mapped to County + Year + Age Group.
================================================================================*/

CREATE TABLE gold.fact_poverty (
	poverty_fact_id SERIAL PRIMARY KEY,
	year_id INTEGER REFERENCES gold.dim_year(year_id),
	county_id INTEGER REFERENCES gold.dim_county(county_id),
	age_group_id INTEGER REFERENCES gold.dim_age_group(age_group_id),
	geo_id INTEGER REFERENCES gold.dim_geography(geo_id),
	fips_code VARCHAR(5),

	--Poverty data
	poverty_count INTEGER,
	poverty_rate NUMERIC (5,1),

	--Income data
	median_income NUMERIC,
	lower_income_estimates NUMERIC,
	upper_income_estimates NUMERIC
);

