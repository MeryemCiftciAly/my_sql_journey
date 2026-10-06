/* write a SQL query to find the 10 locations with the highest normal ocean surface temperature, sorted warmest to coldest.
If two locations have the same normal ocean surface temperature, sort by latitude, smallest to largest.
Include latitude, longitude, and surface temperature columns. */

SELECT "latitude", "longitude", "0m"
FROM normals
ORDER BY "0m" DESC, "latitude" ASC
LIMIT 10;

+----------+-----------+--------+
| latitude | longitude |   0m   |
+----------+-----------+--------+
|     24.5 |      52.5 | 30.559 |
|     17.5 |      41.5 | 29.936 |
|     16.5 |      42.5 | 29.892 |
|     17.5 |      40.5 | 29.866 |
|     -6.5 |     157.5 | 29.789 |
|     16.5 |      41.5 | 29.773 |
|     -2.5 |     149.5 | 29.768 |
|     -4.5 |     165.5 |  29.76 |
|     -4.5 |     166.5 | 29.759 |
|     -5.5 |     167.5 | 29.756 |
+----------+-----------+-------
