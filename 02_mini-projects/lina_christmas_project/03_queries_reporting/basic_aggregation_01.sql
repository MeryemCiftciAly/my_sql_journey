--===============================================================================
--Which neighborhood generated the highest total Christmas savings (revenue)? 
--==============================================================================

SELECT
	neighborhood, SUM(revenue) AS highest_revenue
FROM
	candy_sales
GROUP BY
	neighborhood
ORDER BY 
	highest_revenue DESC 
LIMIT 1;
