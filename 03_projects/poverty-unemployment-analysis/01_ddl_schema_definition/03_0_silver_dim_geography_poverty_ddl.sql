SET search_path to silver;

--========================================
--Creatıng Silver Layer: Poverty Dim Table DDL
--=========================================

CREATE TABLE silver.dim_geography_poverty(
	fips_code INTEGER NOT NULL,
	year INTEGER NOT NULL,
	attribute TEXT NOT NULL,
	code_value INTEGER NOT NULL,
	PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX idx_dim_geography_fips ON silver.dim_geography(fips_code);
CREATE INDEX idx_dim_geography_year  ON  silver.dim_geography (year);
CREATE INDEX idx_dim_geography_attribute ON  silver.dim_geography (attribute);

COMMENT ON TABLE silver.dim_geography  IS  'Standardize and transform data from bronze layer'