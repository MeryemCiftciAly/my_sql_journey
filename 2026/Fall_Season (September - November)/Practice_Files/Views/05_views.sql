--Write a SQL query to find the highest contrast value of prints by Hokusai.
--Name the column “Maximum Contrast”. Does Hokusai’s prints most contrasting print actually have much contrast?

SELECT max(contrast) AS "Maximum Contrast"
FROM views
WHERE artist = 'Hokusai';

+------------------+
| Maximum Contrast |
+------------------+
|             0.65 |
+------------------

-- Hokusai's maximum contrast is 0.65. Since contrast ranges from 0 to 1, with 1 representing the highest contrast, a value of 0.65 indicates relatively high contrast between the light and dark areas of the print.
