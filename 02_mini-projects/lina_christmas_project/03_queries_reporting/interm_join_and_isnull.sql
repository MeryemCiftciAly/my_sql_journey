--=============================================================================
--Identify all shipments that lack a definitive arrival date and are still currently in transit.
--==============================================================================

SELECT
	s.delivery_status, 
	s.country, g.gift_purchased, 
	g.relationship || ' ' || g.relative_name AS package_receiver     --SQL Lite syntax for joining columns
FROM 
	shipments s
JOIN gift_list g ON g.gift_id = s.gift_id
WHERE s.actual_delivery_date IS NULL
AND delivery_status = "In Transit";

--The MySQL syntax for joining would have been 
-- CONCAT(g.relationship, ' ', g.relative_name) AS package_reciever
