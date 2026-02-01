SET search_path to silver;
/*========================================
Poverty Dataset
Creatıng Silver Layer: Income Fact Table DDL
--=========================================*/

CREATE TABLE IF NOT EXISTS silver.income_fact(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrev CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	median_income NUMERIC NOT NULL,
	lower_income_estimate NUMERIC NOT NULL,
	upper_income_estimate NUMERIC NOT NULL,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX indx_income_fact_fips_county_year ON silver.income_fact(fips_code, county, year);
CREATE INDEX  indx_income_fact_year ON silver.income_fact(year);

COMMENT ON TABLE silver.income_fact IS 'Standardize and transformed data from bronze layer includes median, upper and lower income'

ALTER TABLE silver.income_fact
RENAME TO income_fact_poverty;

COMMENT ON TABLE silver.income_fact_poverty IS
'Standardize and transformed data from bronze layer includes median, upper and lower income';
