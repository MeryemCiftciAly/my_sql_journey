--Write a query to find the English title and artist where the average color includes "aaa" order by lowest brightness.Call the results "Brightest aaa Prints".

SELECT english_title AS "Least Bright aaa Prints", artist
FROM views
WHERE average_color LIKE '%aaa'
ORDER BY brightness ASC;

+---------------------------------------+---------+
|             english_title             | artist  |
+---------------------------------------+---------+
| A View of Mount Fuji Across Lake Suwa | Hokusai |
+---------------------------------------+---------+
