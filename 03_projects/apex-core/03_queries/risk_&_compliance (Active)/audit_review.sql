SET search_path TO core;

/*==========================================================
Classifying risks into categories for targeted action.
Without a closed date the balance is a proxy to determine if the account is closed. 
A closed account should have a zero balance.
============================================================*/

WITH audit_base AS (
	SELECT
		v.customer_name,
		v.kyc_status,
		cs.score_value,
		a.balance,
		a.created_at::DATE AS account_opened
	FROM core.vw_user_risk_profile v
	JOIN core.accounts a ON v.user_id = a.user_id
	JOIN core.credit_scores cs ON v.user_id = cs.user_id
	WHERE v.kyc_status = 'Rejected'
)
SELECT *,
	CASE
		WHEN score_value < 550 AND balance > 1000 THEN 'High Risk Needs Immediate Action'
		WHEN score_value > 700 THEN 'Possible error needs investigation'
		ELSE 'Standard compliance review'
	END AS investigation_needed
FROM audit_base
ORDER BY investigation_needed ASC, balance DESC;