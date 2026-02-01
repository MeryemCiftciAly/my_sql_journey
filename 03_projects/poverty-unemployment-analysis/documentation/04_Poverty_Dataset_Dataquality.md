📝 ##Data Quality Update – Fulton County
<hr>
**Scope of the Problem**

The anomaly exists in Fulton County in the Poverty dataset (POV017) only.

Labor Force data for Fulton County is valid — there is no anomaly there.

**Impact**

If performing Poverty-only analysis, Fulton County is excluded to avoid skewed results.

If performing Labor Force-only analysis, Fulton County remains included and valid.

If performing combined Poverty-to-Labor Force analysis, including Fulton County from Labor Force would cause a mismatch because there is no corresponding valid Poverty data for comparison.

**Steps Taken**

Fulton County has been removed from the Silver Poverty Fact table.

Fulton County remains in the Labor Force dataset to keep Labor Force-only analyses intact.

Users performing combined analyses must apply a filter to exclude Fulton County, as its absence in Poverty data will create inconsistencies.


# Poverty Dataset – Data Quality Notes

## Note
The Poverty dataset has the **same structure and data quality patterns** as the Labor Force dataset.

For that reason, I followed the **exact same data quality review process**, and all findings from the Labor Force dataset apply here as well—**with one important exception**.

---

## Attribute Value Column (Key Difference)
While reviewing the Poverty dataset, I noticed a data quality issue in the `attribute_value` column at the **county level**.

In some records, the value includes:
- A numeric poverty value
- Additional descriptive text in the same field

This makes the value unusable for analysis in its raw form.

---

## How This Is Handled
Because these records are **county-level and within project scope**, they should not be excluded.

Instead, in the Silver layer:
- The text portion of the value is removed
- The numeric portion is retained and converted to a numeric data type

This allows each county to be:
- Counted correctly
- Aggregated properly
- Used consistently across analyses

---

## Scope Reminder
- Only New York counties are included in the Silver layer
- No state-level aggregates are introduced
- The Bronze layer remains unchanged

---

## Final Notes
The goal here is consistency and usability, not over-engineering.

Where the data supports county-level analysis, it is cleaned and retained.  
Where it does not (such as state-level aggregates), it is intentionally excluded.
