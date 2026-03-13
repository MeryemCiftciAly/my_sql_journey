/*====================================
Silver County Dimension Table
==============================*/

INSERT INTO silver.dim_county (fips_code, state_abbrev, county_name)
SELECT 
    fips_code, 
    MAX(state_abbrev), 
    MAX(standardized_name)
FROM (  
    -- making sure all county name are the same 
    SELECT
        fips_code, 
        state_abbrev, 
        CASE
            WHEN cleaned_county ILIKE '% County' THEN cleaned_county
            ELSE cleaned_county || ' County'
        END AS standardized_name
    FROM (
        SELECT 
            fips_code, 
            stateabbv AS state_abbrev, 
            TRIM(REGEXP_REPLACE(county::TEXT, '[, ]+.*$', '')) AS cleaned_county --cleaning laborforce county name
        FROM bronze.source_laborforce_ny 
        UNION ALL
        SELECT 
            fips_code, 
            stateabbv AS state_abbrev, 
            TRIM(county::TEXT) AS cleaned_county
        FROM bronze.source_poverty_ny
    ) AS raw_union
    WHERE fips_code <> 36000
) AS final_subquery_alias
GROUP BY fips_code; 



