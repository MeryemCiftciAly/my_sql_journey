-- Write a query to find the English title, artist, and average color
-- of prints where the average color includes "aaa",
-- ordered from least bright to brightest.

SELECT english_title AS "Least Bright aaa Prints", artist, average_color
FROM views
WHERE average_color LIKE '%aaa%'
ORDER BY brightness ASC;

+-------------------------------------------+---------+---------------+
|           Least Bright aaa ...            | artist  | average_color |
+-------------------------------------------+---------+---------------+
| Under Mannen Bridge at Fukagawa           | Hokusai | #aaa999       |
| Sazai hall - Temple of Five Hundred Rakan | Hokusai | #aaaa94       |
| Tsukuda Island in Musashi Province        | Hokusai | #aaada0       |
