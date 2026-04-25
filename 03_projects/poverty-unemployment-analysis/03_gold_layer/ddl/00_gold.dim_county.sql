/*===================================================================
County Dimension Table
=======================================================================*/

CREATE TABLE IF NOT EXISTS gold.dim_county
(
    county_id SERIAL PRIMARY KEY,
    fips_code integer NOT NULL,
    state_abbrev character(2) NOT NULL,
    county_name VARCHAR(100) NOT NULL,
    CONSTRAINT unique_fips UNIQUE (fips_code)
);
