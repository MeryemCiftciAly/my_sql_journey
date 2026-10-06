--Write a SQL query to find the highest normal ocean surface temperature.

SELECT "0m" AS 'Highest NOS temp'
FROM normals
ORDER BY "0m" DESC
LIMIT 1;

+-----------------------------------------------+
|               Highest NOS temp                |
+-----------------------------------------------+
|                                        30.559 |
+-----------------------------------------------
