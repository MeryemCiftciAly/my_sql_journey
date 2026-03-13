set search_path to silver;
/*===================================================
Laborforce Dataset - Silver Layer
Fact table
purpose: All attributes and values except income
--===================================================*/

CREATE TABLE silver.laborforce_fact(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrev CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	employed_value NUMERIC,
	unemployed_value NUMERIC,
	unemployment_rate NUMERIC,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX idx_laborforce_fact_year ON silver.laborforce_fact(year);
CREATE INDEX idx_laborforce_fact_fips ON silver.laborforce_fact(fips_code);
CREATE INDEX idx_laborforce_fact_attribute ON silver.laborforce_fact(attribute);

COMMENT ON TABLE silver.laborforce_fact IS 'Silver layer laborforce fact with income excluded';