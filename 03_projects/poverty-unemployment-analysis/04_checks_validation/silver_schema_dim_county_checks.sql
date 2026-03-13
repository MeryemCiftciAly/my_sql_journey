/*====================================
Silver Schema 
County Dimension Table Profiling
====================================*/

--Checking null and unique values and county validation

SELECT
	COUNT(*) AS total_rows,
	COUNT(DISTINCT fips_code) AS unique_fips,
	COUNT(*) FILTER (WHERE fips_code IS NULL) AS null_fips
FROM silver.dim_county;

--Duplicate checks
SELECT county_name, COUNT(*)
FROM silver.dim_county
GROUP BY county_name
HAVING COUNT(*) > 1;

--Sanity Check
SELECT DISTINCT fips_code
FROM bronze.source_laborforce_ny
WHERE fips_code NOT IN (SELECT fips_code FROM silver.dim_county);

