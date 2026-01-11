--========================================
--Silver Layer: Poverty Fact Table DDL
--=========================================

CREATE TABLE silver.poverty_fact(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	stateabbrv CHAR(2) NOT NULL,
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	attribute_value_count INTEGER,
	attribute_value_percent NUMERIC(5,2),
	rural_urban_continuum_code INTEGER,
	urban_influence_code INTEGER,
	PRIMARY KEY (fips_code, year, attribute)
);

COMMENT ON TABLE silver.poverty_fact IS 'Standardize and transform data from bronze layer';


--====================================================================
--Added the attribute currency column to separate the values more accurately
--=======================================================================

ALTER TABLE IF EXISTS silver.poverty_fact
ADD COLUMN attribute_value_currency NUMERIC(14,2);


--====================================================================
--Added the value type column to separate the values more accurately
--=======================================================================

ALTER TABLE IF EXISTS silver.poverty_fact
ADD COLUMN value_type TEXT;