
/*========================================================================
The Compliance Department needs a clean view of every user,
how long they've been with the company , and where they stand in the KYC process 
==========================================================================*/
--Confirming the right schema
SET search_path TO core;

--User Identity and verification
SELECT
	user_id,
	first_name || ' ' || last_name AS customer_name,
	email,
	kyc_status,
	onboarding_date::DATE AS joined_date
FROM users
ORDER BY kyc_status DESC, onboarding_date ASC;


