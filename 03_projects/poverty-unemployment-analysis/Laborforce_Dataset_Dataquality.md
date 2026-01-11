# Labor Force Dataset – Data Quality Notes

## How I Approached This Dataset
The scope of this project is **New York counties only**.  
That said, I intentionally reviewed the **entire raw dataset first** to understand its overall quality before applying any filters or transformations.

All observations below are based on working directly with the raw (Bronze) data.

---

## Space Checks
The first thing I checked was whether there were any leading or trailing spaces in the text columns.

- I ran an initial trim and length comparison.
- I then ran a second, more explicit check using a `CASE WHEN` approach to confirm the results.

**Result:**  
No spaces were found in any of the text columns.

**What this means:**  
There is nothing to fix related to spaces. The Silver layer does not need any special handling for this, beyond optional defensive trimming.

---

## Null Values
Next, I checked for null values across the dataset.

**Result:**  
No null values were found.

**What this means:**  
No null handling is required in the Silver layer.

---

## Attribute Value Column
I then focused on the `attribute_value` column, since this is the column used directly in analysis.

During this check, I found a value that included a **state-level total for New York** (for example, total civilian labor force for the entire state).

**Important context:**  
This project is focused on **county-level analysis only**.

**What this means:**  
- State-level aggregate rows are out of scope.
- These rows remain unchanged in the Bronze layer.
- They are **excluded from the Silver layer** so that only county-level data is used in analysis.

---

## State Abbreviation Column
I reviewed the state abbreviation column to see if there were any inconsistencies (such as lowercase letters or alternate formats).

**Result:**  
All values are consistently formatted as two-letter uppercase state codes.

**What this means:**  
No changes are required for this column.

---

## County Column (Initial Observations)
Looking at the dataset as a whole, I noticed several county naming issues:
- Inconsistent capitalization of the word “city”
- Slashes (`/`) appearing in some county names
- State abbreviations attached to county names
- Year values embedded in county-related fields

These are clear data quality issues when looking at the full dataset.

---

## County Column (New York Scope)
Once I filtered the data to **New York counties only**, the situation became clearer.

**What I found for New York:**
- Capitalization is consistent.
- However, some county names still include:
  - State abbreviations
  - Embedded year values

**What this means:**  
In the Silver layer:
- State abbreviations are removed from county names.
- Year values are separated into their own column.
- Only New York county-level records are retained.

---

## Final Notes
All changes in the Silver layer are driven by:
- Project scope (New York counties only)
- The need for clean, analyzable county-level data

The Bronze layer is preserved and remained unchanged as the original dataset.
