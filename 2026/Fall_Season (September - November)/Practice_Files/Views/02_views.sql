-- Write a SQL query to list the average colors of prints by Hokusai that include “river” in the English title. (As an aside, do they have any hint of blue?)
SELECT average_color
FROM views
WHERE artist = 'Hokusai'
 AND english_title LIKE '%river%';

+---------------+
| average_color |
+---------------+
| #8ba1a5       |
| #b3b399       |
| #a6a799       |
+---------------+
