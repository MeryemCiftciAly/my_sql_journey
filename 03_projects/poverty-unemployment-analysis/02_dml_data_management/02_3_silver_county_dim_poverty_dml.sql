/*===================================================================
Poverty Dataset - Silver Layer
County Dimension Table
Purpose: Serves as a lookup table across all fact and dimension tables
=======================================================================*/

INSERT INTO silver.county_dim_poverty(
    fips_code,
    stateabbv,
    county
)
SELECT DISTINCT 
	fips_code,
  	stateabbv AS stateabbrev,
  	county
FROM bronze_source_poverty_ny;
