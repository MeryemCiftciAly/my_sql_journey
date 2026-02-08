Set search_path to silver;

/*==============================================================
Poverty Dataset - Silver layer
County Dimension Table
Purpose: Serves as a Lookup table for joins, labels and filtering
--===============================================================*/

CREATE TABLE silver.county_dim_poverty(
    fips_code INTEGER NOT NULL,
    stateabbrev TEXT NOT NULL,
    county TEXT NOT NULL,
    PRIMARY KEY (fips_code)
);

COMMENT ON TABLE silver.county_dim_poverty
IS 'Extracted from bronze layer as lookup table for multi-table queries'
