/*========================================================================
Labor Force / Unemployment Dataset - Bronze Layer
Documentation and Observations of Raw Data
========================================================================*/

/*
Dataset Overview:
- The raw dataset covers all states within the United States.
- For the purposes of this project, only the New York State data is included.
- Aggregated data for the entire state of New York is excluded from the silver layer.
- A scope table is created to filter and retain only county-level data for New York.
- The final dataset will be used for Tableau visualization and is structured into fact and dimension tables, consistent with the ERD.
*/

/*
Column Standardization:
- Column names have been aligned with the poverty dataset to maintain consistency:
    - 'state' → 'stateabbrev'
    - 'area_name' → 'county'
- This ensures uniformity across datasets for filtering, joining, and reporting.
*/

/*
Attribute Handling:
- Raw attributes combine metric names with years (e.g., employed_2023, unemployed_2023).
- During ETL, these are separated into:
    - 'attribute_extracted' → clean metric name (e.g., employed, unemployed, unemployment_rate)
    - 'year_extracted' → numeric year (e.g., 2013, 2023, 2024)
- Attribute values in the raw data are stored as text in some cases; they are cast to numeric or integer values during insertion to ensure proper aggregation and calculations.
- All attribute values are consolidated into a single column ('attribute_value') before transformation.
*/

/*
Civilian Labor Force Observation:
- Civilian labor force represents the sum of employed + unemployed for a given year.
- To avoid double counting in the fact table, only 'employed' and 'unemployed' are retained.
*/

/*
Geography Attributes:
- Slow-changing attributes included in the dataset:
    - rural_urban_continuum_code
    - urban_influence_code
    - metro indicator
- These attributes are consistent across counties and used to populate the geography dimension table.
*/

/*
Data Quality and Profiling Notes:
- Raw values may include non-numeric characters or whitespace, requiring trimming and casting during ETL.
- Aggregated state-level rows are excluded; only distinct county-level data is used.
- Numeric integrity is validated by checking that 'employed + unemployed' equals civilian labor force in the raw data.
*/

/*
ETL Summary:
1. Load raw labor force/unemployment data into the bronze layer.
2. Create a scoped table for New York counties, excluding state-level aggregates.
3. Clean attributes:
    - Extract year into 'year_extracted'
    - Extract metric into 'attribute_extracted'
    - Cast 'attribute_value' as integer or numeric
4. Exclude 'civilian_labor_force' to prevent double counting.
5. Insert cleaned and scoped data into silver fact tables.
6. Populate geography dimension table with slow-changing attributes.
7. Ensure column naming and structure align with poverty dataset for consistency in reporting and visualization.
*/
