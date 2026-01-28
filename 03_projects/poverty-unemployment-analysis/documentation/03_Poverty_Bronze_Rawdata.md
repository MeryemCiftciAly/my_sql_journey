
## Poverty Dataset - Bronze Layer
### Documentation and Observations of Raw Data


/*
Dataset Overview:
- The raw dataset covers all states within the United States.
- For the purposes of this project, only the New York State data is included.
- A scoped table is created to filter and retain only county-level data for New York.
- Aggregated state-level data is not included because all county-level records are necessary for analysis.
- The dataset will be broken into fact and dimension tables in the silver layer, consistent with the ERD.
*/

/*
Column Focus:
- The dataset contains population-focused and household-focused attributes:
    - Population-focused metrics: POVALL (overall count), POV517 (children 5-17), 0-17 population (POP017)
    - Household-focused metrics: median income and related household measures
- Confidence intervals are provided:
    - CI90LBALL and CI90UBALL for counts
    - CI90LBALLP and CI90UBALLP for percentages
- Percentage metrics are indicated with PCT prefix (e.g., PCTPOVALL)
*/

/*
Attribute Handling:
- Raw attributes combine metric names with years (e.g., POVALL_2023, CI90LBALL_2023, PCTPOVALL_2023)
- ETL process separates:
    - 'attribute_extracted' → clean metric name (e.g., POVALL, PCTPOVALL, CI90LBALL)
    - 'year_extracted' → numeric year (e.g., 2013, 2023, 2024)
- Attribute values may have varying data types; they are cast to numeric or integer during transformation.
*/

/*
Geography Attributes:
- Slow-changing attributes included in the dataset:
    - rural_urban_continuum_code
    - urban_influence_code
    - metro indicator
- These attributes are consistent across counties and link with labor force dataset geography dimensions.
*/

/*
Age Group Focus:
- Some metrics focus on specific age ranges:
    - POP017: children 0 to 17 years
    - POV517: children 5 to 17 years
- This allows analysis of poverty rates by age group.
*/

/*
Data Quality and Profiling Notes:
- Raw values include numeric metrics, percentages, and confidence bounds in a single column.
- Attributes with attached years need to be cleaned and separated into distinct columns for analysis.
- No aggregation of underlying records is required because each value (e.g., POVALL) represents a single county-level metric for the given year.
- Data will be transformed to ensure numeric integrity and proper casting for aggregation and calculations in fact tables.
*/

/*
ETL Summary:
1. Load raw poverty data into the bronze layer.
2. Create a scoped table for New York counties, retaining only county-level metrics.
3. Clean attributes:
    - Extract year into 'year_extracted'
    - Extract metric into 'attribute_extracted'
    - Cast 'attribute_value' as integer or numeric
4. Transform confidence intervals, percentages, and population metrics into separate columns in fact tables.
5. Populate geography dimension table with slow-changing attributes, linking county-level records.
6. Ensure column naming and structure align with labor force dataset for consistency in reporting and visualization.
*/
