--Question: What year had the highest overall waste collected in NYC?

--Viewing the data
SELECT * FROM cleaned_sanitation_data
LIMIT 5;

--Extracting the year, summing the total then grouping to get the result
SELECT
	 SUBSTRING(month FROM 1 FOR 4) AS year,
	 SUM(
	refuse_tons_collected+
	paper_tons_collected+
	mgp_tons_collected+
	res_organics_tons+
	school_organic_tons+
	leaves_organic_tons+
	xmas_tree_ton) AS "total_waste"	 
 FROM cleaned_sanitation_data
 GROUP BY year
 ORDER BY "total_waste" DESC;


 --USING CTE Method Although Not Necessary

 With year_total_waste AS 
 (
 SELECT
  SUBSTRING(month FROM 1 FOR 4) AS year,
  	 SUM(
	refuse_tons_collected+
	paper_tons_collected+
	mgp_tons_collected+
	res_organics_tons+
	school_organic_tons+
	leaves_organic_tons+
	xmas_tree_ton) AS "total_waste"	 
 FROM cleaned_sanitation_data
 GROUP BY year
 )
SELECT *
FROM year_total_waste
ORDER BY "total_waste" DESC;
