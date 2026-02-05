SET search_path TO core;

/*===================================
Creating a view of the customers profile
====================================*/

CREATE OR REPLACE VIEW core.vw_user_risk_profile AS
SELECT
	user_id,
	first_name || ' ' || last_name AS customer_name,
	email,
	kyc_status,
	onboarding_date::DATE AS joined_date
FROM users;


SELECT * FROM vw_user_risk_profile LIMIT 5;