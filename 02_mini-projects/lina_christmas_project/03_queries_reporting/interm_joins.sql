--===============================================================================
--List all the gifts that were shipped to an international destination (like Jamaica or Canada).
--================================================================================

SELECT g.gift_purchased, s.country
FROM
	gift_list g
LEFT JOIN shipments s ON g.gift_id = s.gift_id
WHERE s.country NOT IN ("US");
