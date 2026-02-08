SET search_path to silver;
/*========================================
Poverty Dataset
Creatıng Silver Layer: Income Fact Table DDL
--=========================================*/

CREATE TABLE IF NOT EXISTS silver.income_fact_poverty(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrev CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	median_income NUMERIC,
	lower_income_estimate NUMERIC ,
	upper_income_estimate NUMERIC,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX indx_income_fact_fips_county_year ON silver.income_fact_poverty(fips_code, county, year);
CREATE INDEX  indx_income_fact_year ON silver.income_fact_poverty(year);

COMMENT ON TABLE silver.income_fact_poverty IS 'Standardize and transformed data from bronze layer includes median, upper and lower income';

