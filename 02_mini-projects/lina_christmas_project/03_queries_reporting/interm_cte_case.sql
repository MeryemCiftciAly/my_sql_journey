--====================================================================
--Did Lina's total summer candy earnings fully cover the total cost of all gifts plus shipping?
--=============================================================================
--Calculate total revenue from sales
WITH sales_revenue AS (
	SELECT SUM(revenue) AS total_revenue FROM candy_sales 
),
--Calculate total costs for gifts
gift_total AS (
	SELECT 	SUM(purchase_price) AS total_gift_cost FROM gift_list 
),
--Calculate total shipping costs
shipping_total AS (
	SELECT SUM(shipping_cost) AS total_shipping FROM shipments  
)
			
SELECT 
	s.total_revenue AS "Total Revenue",
	(g.total_gift_cost + t.total_shipping) AS "Total Expense (shipping & Gifts)",
	(s.total_revenue - (g.total_gift_cost + t.total_shipping)) AS "Profit/Loss",
	 CASE WHEN 
		 	s.total_revenue >= (g.total_gift_cost + t.total_shipping) 
		 	THEN "Yes Cost Cover"
			ELSE "No Not Cover"
			END AS "Budget Status"
FROM sales_revenue AS s, gift_total AS g, shipping_total AS t;
