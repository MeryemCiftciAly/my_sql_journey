--Write a SQL query to find the normal temperature of the deepest sensor near the Gulf of Maine, at the coordinates 42.5° of latitude and -69.5° of longitude.
--The deepest sensor records temperatures at 225 meters of depth, so you can find this data in the 225m column.

SELECT "latitude", "longitude", "225m"
FROM normals
WHERE "latitude" = 42.5
    AND "longitude" = -69.5;

+----------+-----------+-------+
| latitude | longitude | 225m  |
+----------+-----------+-------+
|     42.5 |     -69.5 | 7.453 |
+----------+-----------+-------
