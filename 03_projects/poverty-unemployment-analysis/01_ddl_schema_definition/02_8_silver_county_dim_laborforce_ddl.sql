/*================================================
Laborforce Dataset - Silver Layer
County Dim Table
==========================================*/

CREATE TABLE silver.county_dim_laborforce(
    fips_code INTEGER NOT NULL,
    stateabbrev TEXT NOT NULL,
    county TEXT NOT NULL,
    PRIMARY KEY (fips_code)
);

COMMENT ON TABLE silver.county_dim_laborforce
IS 'Extracted from bronze layer as lookup table for multi-table queries';
