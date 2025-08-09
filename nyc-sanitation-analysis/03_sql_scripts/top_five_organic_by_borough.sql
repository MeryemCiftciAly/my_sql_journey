--Question: Top 5 boroughs with the most orgaic collection overall?

SELECT * FROM  cleaned_sanitation_data;

WITH top_five_by_borough AS(
	SELECT
		borough,
		SUM(
		res_organics_tons +
		school_organic_tons  +
		leaves_organic_tons
		) AS total_organic
 FROM cleaned_sanitation_data
GROUP BY borough, month
)
