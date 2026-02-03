/*========================================
Laborforce Dataset - Silver Layer
Dim Geography
--=========================================*/

CREATE TABLE silver.dim_geography_laborforce (
    fips_code NUMERIC NOT NULL,
    year INTEGER NOT NULL,
    attribute TEXT NOT NULL,
    code_value INTEGER,
    PRIMARY KEY (fips_code, year, attribute)
);

CREATE INDEX idx_dim_geo_lforce_fips ON silver.dim_geography_laborforce (fips_code);
CREATE INDEX idx_dim_geo_lforce_year ON silver.dim_geography_laborforce (year);
CREATE INDEX idx_dim_geo_lforce_attribute ON silver.dim_geography_laborforce (attribute);

COMMENT ON TABLE silver.dim_geography_laborforce  
IS 'Standardize geographic attributes and transform data from bronze layer';
