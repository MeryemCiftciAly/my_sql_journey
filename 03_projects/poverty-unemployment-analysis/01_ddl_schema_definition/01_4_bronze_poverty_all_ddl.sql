
/*========================================
Poverty Dataset -- Bronze Layer
--=========================================*/

CREATE TABLE bronze.poverty_fact(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrev CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	attribute_value_count INTEGER,
	attribute_value_percent NUMERIC(5,2),
	rural_urban_continuum_code INTEGER,
	urban_influence_code INTEGER,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX idx_poverty_fact_year ON bronze.poverty_fact(year);
CREATE INDEX idx_poverty_fact_fips ON bronze.poverty_fact(fips_code);

COMMENT ON TABLE bronze.poverty_fact IS 'Standardize and transform data from bronze layer'

