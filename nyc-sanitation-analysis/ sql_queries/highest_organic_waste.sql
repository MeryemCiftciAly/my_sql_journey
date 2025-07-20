--Question: Which month saw the highest organic waste collection in NYC?

--Inspect the dataset
SELECT * FROM cleaned_sanitation_data;

--Quering the data 

WITH organic_waste_total AS ( 
 	SELECT
	    borough, 
		SUBSTRING(month FROM 8 FOR 2) AS month_number,
		SUM(res_organics_tons +
		school_organic_tons +
		leaves_organic_tons) AS organics
FROM cleaned_sanitation_data
GROUP BY borough, month
)
SELECT * FROM organic_waste_total
ORDER BY organics DESC
LIMIT 5;


