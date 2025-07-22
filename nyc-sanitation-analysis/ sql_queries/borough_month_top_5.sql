--Question: Top 5 borough-month combination with the most total waste collected?

SELECT * FROM  cleaned_sanitation_data;

WITH top_five AS(
	SELECT
		SUBSTRING(month FROM 1 FOR 4) AS year, 
		borough,
		SUBSTRING(month FROM 8 FOR 2) AS month, 
		SUM(paper_tons_collected +
		mgp_tons_collected +
		refuse_tons_collected +
		res_organics_tons +
		school_organic_tons  +
		leaves_organic_tons +
		xmas_tree_ton) AS “total_waste”
 FROM cleaned_sanitation_data
GROUP BY year, borough, month
)
SELECT *
FROM  top_five 
ORDER BY “total_waste” DESC
LIMIT 5;
