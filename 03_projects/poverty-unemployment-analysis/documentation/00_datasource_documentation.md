# Gold Layer Data Documentation

This document outlines the source datasets, key variables, and preparation details for the Gold Layer of the Poverty and Labor Force project. This serves as a reference to understand the origins, structure, and meaning of the data used.

---

## 1. Poverty & Income Estimates

**Source:** [U.S. Census Bureau – Small Area Income and Poverty Estimates (SAIPE)](https://www.census.gov/programs-surveys/saipe.html)  
**Reference Year:** 2023  


**Description:**  
The SAIPE program produces single-year estimates of income and poverty for all counties in the United States, including childhood poverty estimates for school districts. For this project, county-level data is used. This dataset provides income and poverty statistics at the county and state level for 2023.

### Key Variables (County Level)

| Variable | Definition |
|----------|------------|
| POVALL | Total population in poverty |
| POV017 | Children under age 18 in poverty |
| POV517 | Related children ages 5–17 in families in poverty |
| MEDHHINC | Median household income (in USD) |
| CI variables | 90% confidence intervals for each estimate |

**Notes:**  
- Estimates represent a single-year snapshot (2023).  
- Confidence intervals indicate the statistical bounds for reliability.  
- Childhood poverty estimates are available for school districts but are not used in this project.  

---

## 2. County Classification Systems

**Source:** [USDA Economic Research Service (ERS) – County-Level Data Sets](https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data)  
**Publication Date:** January 31, 2025  

**Description:**  
ERS provides county-level classification systems to categorize counties based on urbanization and economic adjacency. These classifications are used for linking geographic identifiers in the Gold Layer.

### Key Variables

| Variable | Definition |
|----------|------------|
| Rural–Urban Continuum Code (RUCC) | Classifies counties based on population size and degree of urbanization. Lower values indicate more urban counties; higher values indicate more rural counties. |
| Urban Influence Code (UIC) | Classifies counties by metropolitan status and economic adjacency to metro areas. Metro-adjacent counties and non-metro counties have distinctions based on economic connections. |
| Metro Status | Indicates whether a county is part of a metropolitan area. |

---

## 3. Data Preparation Notes

- **Poverty Fact Table:**  
  - Grain: `Country + Geography + Year + Age Group`  
  - Measures include poverty counts, poverty percentages, median income, and income confidence intervals.  
  - Human-readable variable names applied to replace source codes (e.g., POVALL → `total_population_in_poverty`).

- **Labor Force Fact Table:**  
  - Grain: `Country + Geography + Year` (no age group)  
  - Measures include employed count, unemployed count, and unemployment rate.  
  - Geographic variables: Urban Influence Code and Metro Status.

- **Dimensional Integrity:**  
  - Fact tables remain separate due to mismatched grain and differing year coverage.  
  - Both fact tables link to shared dimensions: `Dim_Country`, `Dim_Geography`, `Dim_Year`, and `Dim_Age_Group` (used only by poverty).  
  - Classification variables included in `Dim_Geography` to preserve context without forcing alignment.  

---

## 4. References

1. U.S. Census Bureau – SAIPE 2023: [https://www.census.gov/programs-surveys/saipe.html](https://www.census.gov/programs-surveys/saipe.html)  
2. USDA ERS County-Level Data Sets: [https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data](https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data)
