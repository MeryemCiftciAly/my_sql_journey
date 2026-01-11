# Poverty Dataset – Data Quality Assessment & Cleaning Documentation

## Project Scope
The analytical scope of this project is **New York counties only**.  
As with the Labor Force dataset, all data quality checks are performed on the **entire raw (Bronze) dataset** to fully understand data integrity before applying scoped transformations in the Silver layer.

---

## Dataset Consistency Note
The **Poverty dataset is structurally and qualitatively identical to the Labor Force dataset**, including:
- Column structure
- Data types
- Known data quality patterns
- Scope-related exclusions

As a result, **all data quality checks documented for the Labor Force dataset apply equally to the Poverty dataset**, **except where explicitly noted below**.

---

## Data Layers
- **Bronze Layer:** Raw, unmodified source data  
- **Silver Layer:** Cleaned, standardized, and New York county–level data

The Bronze layer remains unchanged.

---

## Data Quality Checks (Inherited from Labor Force Dataset)

The following checks were performed and yielded identical results to the Labor Force dataset:

- Space checks (leading/trailing spaces)
- Null checks
- State abbreviation consistency
- County-level scope filtering
- County naming issues (evaluated globally, resolved within NY scope)

Refer to **Labor Force Dataset – Data Quality Assessment & Cleaning Documentation** for full methodological detail.

---

## Attribute Value Column – Poverty Dataset (Key Difference)

### Objective
Ensure the `attribute_value` column is analytically usable at the **county level**.

### Findings
Unlike the Labor Force dataset, the Poverty dataset contains **county-level records where `attribute_value` includes both numeric and text components**.

Example pattern:
- Numeric poverty value followed by descriptive text

This presents a **county-level data quality issue**, not an aggregation or scope violation.

---

### Silver Layer Action
- **Remove the text component** from `attribute_value`
- **Preserve and cast the numeric portion** as a numeric data type
- Retain the county record for analysis

This enables:
- Accurate aggregation
- County inclusion in analysis
- Consistent numeric operations across datasets

---

## Scope Validation
- All cleaned records remain **county-level**
- No state-level aggregates are introduced
- Only **New York counties** are retained in the Silver layer

---

## Summary of Silver Layer Handling (Poverty Dataset)

| Issue | Action |
|-----|-------|
| Leading/trailing spaces | No action required |
| Null values | No action required |
| State abbreviations | No action required |
| County naming (NY scope) | Cleaned and standardized |
| Attribute value (county-level text + numeric) | Text removed, numeric retained |
| State-level aggregates | Not applicable |

---

## Notes
- Differences between datasets are **explicitly documented** to avoid silent assumptions.
- Cleaning decisions are driven by **project scope and analytical usability**, not convenience.
- Documentation is intentionally aligned across datasets to ensure consistency and auditability.
