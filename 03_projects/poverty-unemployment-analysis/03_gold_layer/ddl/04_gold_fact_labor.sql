/*===============================
Laborforce Fact Table
================================*/

CREATE TABLE gold.fact_labor(
	labor_fact_id SERIAL PRIMARY KEY,
	year_id INTEGER REFERENCES gold.dim_year(year_id),
	county_id INTEGER REFERENCES gold.dim_county(county_id),
	age_group_id INTEGER REFERENCES gold.dim_age_group(age_group_id),
	geo_id INTEGER REFERENCES gold.dim_geography(geo_id),
	fips_code VARCHAR(5),
	employed_value INTEGER,
	unemployed_value INTEGER,
	unemployment_rate NUMERIC(5,4),
	median_income_value INTEGER,
	median_income_rate NUMERIC(5,2)

);

