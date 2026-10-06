/*Write a SQL query to find the average ocean surface temperature, rounded to two decimal places, along the equator.
Call the resulting column “Average Equator Ocean Surface Temperature”. */

SELECT ROUND(AVG("0m"),2) AS 'Average Equator Ocean Surface Temperature'
FROM normals
WHERE "latitude" = -0.5

+----------------------+
| Average Equator O... |
+----------------------+
|                27.57 |
+----------------------+

--The dataset does not contain observations at exactly 0° latitude, so the closest available latitude, -0.5°, was used to represent the equator.
