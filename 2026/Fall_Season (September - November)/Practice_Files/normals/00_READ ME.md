# Ocean Temperature Normals — SQL Practice

## About

This folder contains my SQL practice using the `normals.db` dataset from the **CS50 SQL** course.

The dataset contains normal ocean temperature measurements at different geographic locations and depths. It includes latitude, longitude, and ocean temperature measurements ranging from the surface (`0m`) to deeper ocean levels.

The `normals` table is a **wide table**, with each depth stored as a separate column.

## Dataset

The main table is:

`normals`

Some of the columns include:

* `id` — unique identifier for each data point
* `latitude` — latitude of the location
* `longitude` — longitude of the location
* `0m` — normal ocean surface temperature
* `50m` — normal ocean temperature at 50 meters
* `100m` — normal ocean temperature at 100 meters
* Additional columns for deeper measurements

Because some column names begin with numbers, such as `0m` and `50m`, they are enclosed in quotation marks when used in SQL.

Example:

```sql
SELECT "latitude", "longitude", "0m"
FROM normals;
```

## SQL Practice

The exercises in this folder practice:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `BETWEEN`
* `AVG()`
* `ROUND()`
* `COUNT()`
* `DISTINCT`
* Column aliases
* Sorting with multiple conditions
* Working with geographic coordinates
* Working with a wide table

## Questions Practiced

The queries explore questions such as:

1. What is the normal ocean surface temperature at a specific location?
2. What is the deepest available temperature measurement at a location?
3. What are the surface, 100-meter, and 200-meter temperatures at a selected location?
4. What is the lowest normal ocean surface temperature?
5. What is the highest normal ocean surface temperature?
6. What are the normal ocean temperatures at 50 meters within the Arabian Sea?
7. What is the average ocean surface temperature near the equator?
8. Which 10 locations have the lowest normal ocean surface temperatures?
9. Which 10 locations have the highest normal ocean surface temperatures?
10. How many distinct latitude values have at least one data point?

## Notes

The dataset does not necessarily contain an observation at every possible latitude or longitude. Some latitude lines may have no ocean data because they pass through land or because measurements are not available for that location.

For the equator exercise, the dataset did not contain a data point at exactly `0°` latitude. The closest available latitude used was `-0.5°`.

## Learning Source

These exercises are part of the **CS50's Introduction to Databases with SQL** course from Harvard University.

The purpose of this folder is to practice writing SQL queries and understanding how different SQL clauses work together.
