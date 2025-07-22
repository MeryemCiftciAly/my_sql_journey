--Question: Is there a borough that recycles more (paper+ MGP) then it generates refuse?

SELECT * FROM  cleaned_sanitation_data;

SELECT
	borough,
	SUM(paper_tons_collected) AS paper_total,
	SUM(mgp_tons_collected) AS mgp_total,
	SUM(paper_tons_collected + mgp_tons_collected) As paper_mgp_total,
	SUM(refuse_tons_collected) AS refuse_total,
	CASE
		WHEN SUM(paper_tons_collected + mgp_tons_collected) > SUM(refuse_tons_collected)
		THEN 'Less Refuse Collected'
		ELSE 'More Refuse Collected'
 END AS recycles_more_than_refuse
 FROM cleaned_sanitation_data
 GROUP BY borough
 ORDER BY borough;

