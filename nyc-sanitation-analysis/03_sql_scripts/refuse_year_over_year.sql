--Question: How has total refuse change year-over-year for each borough?

-- Inspecting the data

SELECT * FROM cleaned_sanitation_data;

--query the data
SELECT
	 borough,
	 SUBSTRING(month FROM 1 FOR 4) AS year,
	 SUM(refuse_tons_collected)	AS total_refuse
FROM cleaned_sanitation_data
GROUP BY borough, year
ORDER BY borough, total_refuse DESC;

--Using CTE
With yearly_refuse AS(
	SELECT
	 borough,
	 SUBSTRING(month FROM 1 FOR 4)::INTEGER AS year,
	 SUM(refuse_tons_collected)	AS total_refuse
FROM cleaned_sanitation_data
GROUP BY borough, year
)

SELECT
 	borough,
	 year,
 	total_refuse
 FROM yearly_refuse
 ORDER BY borough, year DESC;
