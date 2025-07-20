-- Question: Which borough generated the most total refuse waste

SELECT 
	borough,
	SUM(refuse_tons_collected) AS "Total_Refuse_Waste"
FROM cleaned_sanitation_data
GROUP BY borough
ORDER BY "Total_Refuse_Waste" DESC;
