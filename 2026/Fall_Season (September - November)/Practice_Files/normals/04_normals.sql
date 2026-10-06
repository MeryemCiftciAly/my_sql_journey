--Write a SQL query to find the lowest normal ocean surface temperature.

SELECT "0m" AS 'lowest normal ocean surface temperature'
FROM normals
ORDER BY "0m" ASC
LIMIT 1;

+-----------------------------------------------+
|             lowest normal oce...              |
+-----------------------------------------------+
|                                        -1.837 |
+-----------------------------------------------+
