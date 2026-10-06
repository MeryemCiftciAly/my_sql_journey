--Write a SQL query to determine how many points of latitude we have at least one data point for. There are 180 whole degrees of latitude.
--Why might we not have data points for all latitudes?)

SELECT COUNT(DISTINCT( "latitude")) AS "Latitude Not NULL"
FROM normals
WHERE "latitude" IS NOT NULL;

+-------------------+
| Latitude Not NULL |
+-------------------+
|               168 |
+-------------------+


--Some latitudes may not have data points because those latitude lines may pass through land rather than ocean.
