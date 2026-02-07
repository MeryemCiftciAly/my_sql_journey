SET search_path TO core;

/*===============================================================================
Part 1: Due to significant number of rejected accounts shown as recently onboarded.
The objective is to identify rejected users who still have an account on record.

Findings: High Credit Scores (>800) status is rejected with high active account balance.
		  Low Credit Scores (<400) status is rejected with high active account balance.
===================================================================================*/

SELECT
	v.customer_name,
	v.kyc_status,
	a.balance,
	a.created_at::DATE AS opened_date,
	cs.score_value AS credit_score,
	/*There is an account create date but no account closed date. Therefore balanced
	wıll be used to flag risk accounts.*/
	CASE
		WHEN a.balance > 0 THEN 'Active account'
		ELSE 'Flag: Need attention or deletion'
	END AS account_risk_status
	FROM core.vw_user_risk_profile v
	JOIN core.accounts a ON v.user_id = a.user_id
	JOIN core.credit_scores cs ON v.user_id = cs.user_id
	WHERE v.kyc_status = 'Rejected'
		AND a.balance > 0
	ORDER BY a.balance DESC;
	