– Question: What is the highest waste collected by year for each waste type?

	SELECT
	SUBSTRING(month FROM 1 FOR 4) AS Year,
	SUM(refuse_tons_collected) AS Refuse_SUM,
	SUM(paper_tons_collected) AS Paper_SUM,
	SUM(mgp_tons_collected) AS MGP_SUM,
	SUM(res_organics_tons) AS Organics_SUM,
	SUM(school_organic_tons) AS School_Organic_SUM,
	SUM(leaves_organic_tons) AS Leaves_Organic_SUM,
	SUM(xmas_tree_ton) AS xmas_Tree_SUM
FROM cleaned_sanitation_data
GROUP BY Year
ORDER BY Year DESC;
