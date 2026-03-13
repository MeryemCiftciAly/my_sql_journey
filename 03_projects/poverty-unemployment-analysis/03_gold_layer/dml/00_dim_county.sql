/*==============================
GOLD Dimension Table Insert
============================*/

INSERT INTO gold.dim_county(fips_code, state_abbrev, county_name)
SELECT
	fips_code,
	state_abbrev,
	county_name
FROM silver.dim_county;