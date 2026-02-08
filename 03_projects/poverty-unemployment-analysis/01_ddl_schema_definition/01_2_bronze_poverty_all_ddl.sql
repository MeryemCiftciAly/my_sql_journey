
/*========================================
Poverty Dataset -- Bronze Layer - Fact Table
--=========================================*/

CREATE TABLE bronze.poverty_fact(
	fips_code INTEGER NOT NULL,
	stateabbv CHAR (2),
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	attribute_value NUMERIC (12,2) NOT NULL,
	load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	PRIMARY KEY (fips_code, county, attribute)
);

COMMENT ON TABLE bronze.povety_fact IS 'Raw data from source unaltered in bronze schema.';

