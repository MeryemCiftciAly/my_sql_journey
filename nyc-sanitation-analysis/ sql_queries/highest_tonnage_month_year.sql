--Question: Which brough highest paper tonnage in a single month and year?
SELECT
	borough,
	month,
	SUM(paper_tons_collected) AS Total_Paper_collected
FROM cleaned_sanitation_data
GROUP BY 
	borough, 
	month
ORDER BY Total_Paper_collected DESC;
