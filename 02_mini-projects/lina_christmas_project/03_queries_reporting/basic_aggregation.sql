-- =======================================================
-- Q1: Which candy flavor was the overall best-seller by volume across all five neighborhoods?
-- =======================================================

SELECT 
	flavor, SUM(quantity_sold) AS best_seller
FROM 
	candy_sales 
GROUP BY 
	flavor
Order BY 
	best_seller DESC
	
Limit 1;
