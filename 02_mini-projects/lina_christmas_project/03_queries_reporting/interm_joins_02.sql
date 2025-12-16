--=====================================================================================
--Which shipments were officially marked as 'Delayed' and missed the December 24 deadline? 
--====================================================================================

/* Here "which shipments." presentes some ambiguity. It is uncertain 
 --The specific item (gift_purchased)?
 --The recipient (relative_name)?
 --The destination (country)?
After further thought and feedback the question was clarified.
"Which shipments" should be interpreted as returning the details of the gift and the recipient.*/

SELECT DISTINCT
	 g.relative_name,
	 g.gift_purchased, 
 	 s.delivery_status  
FROM 
	 shipments s
JOIN gift_list g ON s.gift_id = g.gift_id 
WHERE delivery_status= "Delayed"
