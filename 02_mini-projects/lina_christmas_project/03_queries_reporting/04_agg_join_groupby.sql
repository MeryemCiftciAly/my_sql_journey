--========================================================================================
--What was the highest combined cost (purchase price + shipping cost) for any single gift? 
--========================================================================================

SELECT 
	g.gift_purchased,
	g.relative_name,
	g.relationship,
	s.country,
 SUM(s.shipping_cost + g.purchase_price) "combined cost"
FROM
	 gift_list g
JOIN shipments s ON g.gift_id = s.gift_id
GROUP BY 
	g.gift_purchased,
	g.relative_name,
	g.relationship,
	s.country
ORDER BY "combined cost" DESC 
LIMIT 1;
