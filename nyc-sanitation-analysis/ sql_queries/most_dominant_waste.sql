--Question: Across all years, which type of waste (refuse, paper, organics etc) is most dominant?

--Quering data. This will give the same results as below but in a wide spreadsheet-type view.

SELECT
	SUM(refuse_tons_collected) AS Refuse_SUM,
	SUM(paper_tons_collected) AS Paper_SUM,
	SUM(mgp_tons_collected) AS MGP_SUM,
	SUM(res_organics_tons) AS Organics_SUM,
	SUM(school_organic_tons) AS School_Organic_SUM,
	SUM(leaves_organic_tons) AS Leaves_Organic_SUM,
	SUM(xmas_tree_ton) AS xmas_Tree_SUM	
FROM cleaned_sanitation_data;

--Quering data. This will give the same results as above but in a narrow sorted view.

WITH waste_total AS (
SELECT 'Refuse' AS waste_type, SUM(refuse_tons_collected) AS total_collected FROM cleaned_sanitation_data
UNION ALL
SELECT 'Paper', SUM(paper_tons_collected) FROM cleaned_sanitation_data
UNION ALL
SELECT 'MGP', SUM(mgp_tons_collected) FROM cleaned_sanitation_data
UNION ALL
SELECT 'RES_Organics',SUM(res_organics_tons) FROM cleaned_sanitation_data
UNION ALL
SELECT 'School_Organics', SUM(school_organic_tons) FROM cleaned_sanitation_data
UNION ALL
SELECT 'Leaves_Organics', SUM(leaves_organic_tons) FROM cleaned_sanitation_data
UNION ALL
SELECT 'Xmas_Organics', SUM(xmas_tree_ton) FROM cleaned_sanitation_data
)
SELECT *
FROM waste_total
ORDER BY total_collected DESC
LIMIT 3;
