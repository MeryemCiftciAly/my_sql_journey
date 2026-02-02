
SET search_path to silver;
/*========================================
Laborforce Dataset - Silver Layer
Income Fact Table DDL
--=========================================*/

CREATE TABLE IF NOT EXISTS silver.income_fact_laborforce(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrev CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	median_income_value NUMERIC,
	median_income_rate NUMERIC,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX indx_income_fact_laborforce_fips ON silver.income_fact_laborforce (fips_code, county, year);
CREATE INDEX  indx_income_fact_laborforce_year ON silver.income_fact_laborforce (year);

COMMENT ON TABLE income_fact_laborforce 
IS 'Standardize and transformed data from bronze layer includes median income and median income rate'
