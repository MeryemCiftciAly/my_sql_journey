SELECT 
borough,
-- Summing all waste to give one single value
	SUM(refuse_tons_collected) +
	SUM(paper_tons_collected) +
	SUM(mgp_tons_collected) +
	SUM(res_organics_tons) +
	SUM(school_organic_tons) +
	SUM(leaves_organic_tons) +
	SUM(xmas_tree_ton) AS "Total Waste",
	
-- Showing total waste breaksown by borough	
	SUM(refuse_tons_collected) AS "Refuse Total",
	SUM(paper_tons_collected) AS "Paper Total",
	SUM(mgp_tons_collected) AS "MGP Total",
	SUM(res_organics_tons) AS "Res Organics Total",
	SUM(school_organic_tons) AS "School Organics Total",
	SUM(leaves_organic_tons) AS "Leaves Total",
	SUM(xmas_tree_ton) AS "Xmas Total"
FROM cleaned_sanitation_data
GROUP BY
   borough
 ORDER BY
   "Total Waste";