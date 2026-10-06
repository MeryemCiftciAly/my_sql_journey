--Choose a location of your own and write a SQL query to find the normal temperature at 0 meters, 100 meters, and 200 meters.
--You might find Google Earth helpful if you’d like to find some coordinates to use!

/* Searching for location
SELECT "latitude", "longitude"
FROM normals
WHERE "latitude" BETWEEN 17 and 19
    --AND "longitude" BETWEEN -79 and -76; */

SELECT "0m", "100m", "200m"
FROM normals
WHERE "latitude" = 15.5
    AND "longitude" = -78.5;
