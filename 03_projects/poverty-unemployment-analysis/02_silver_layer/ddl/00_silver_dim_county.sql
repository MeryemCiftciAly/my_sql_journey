/*===================================================================
Poverty Dataset - Silver Layer
County Dimension Table
=======================================================================*/

CREATE TABLE IF NOT EXISTS silver.dim_county
(
    fips_code integer NOT NULL,
    state_abbrev character(2) NOT NULL,
    county_name VARCHAR(100) NOT NULL,
    CONSTRAINT dim_county_pkey PRIMARY KEY (fips_code)
)
