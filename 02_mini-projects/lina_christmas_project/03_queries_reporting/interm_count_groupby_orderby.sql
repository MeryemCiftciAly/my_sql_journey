--=========================================================================================================
--Which destination country received the highest total volume of Lina's gifts? 
--========================================================================================================

SELECT country, COUNT(*) highest_volume
FROM shipments
GROUP BY
	country
ORDER BY COUNT(*) DESC;
