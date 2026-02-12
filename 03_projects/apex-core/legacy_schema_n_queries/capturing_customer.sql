/*============================================================================================
Request: We need a list of customers who have High Credit Scores (>700) but have Zero balance
in their accounts. These are people who are qualified for our products but haven't started using us yet.

Strategy: This needs the credit score from the credit_scores table. The check the balance we need the accounts tabele.
This is a left join balance on the View table for both account and credit scores. We will need to filter for 
 score values >700 and balance zero or null.

 Output: View the results of this query in the Reports folder: high_dormant_leads.csv For review
 =====================================================================================================*/

 SELECT
	v.customer_name,
	v.email,
	COALESCE(CAST(a.balance AS VARCHAR), '-') AS current_balance,
	cs.score_value AS credit_score,
	CASE
		WHEN a.balance IS NULL THEN 'Pending Onboarding or Deposit'
		WHEN a.balance = 0 THEN 'Waiting for deposit'
		ELSE 'Active'
	END AS credit_tier
FROM core.vw_user_risk_profile v
LEFT JOIN core.accounts a ON v.user_id = a.user_id
LEFT JOIN core.credit_scores cs ON v.user_id = cs.user_id
WHERE cs.score_value >700
	AND (a.balance = 0 OR a.balance IS NULL) -- catches if account is funded or in a pending unopened status
ORDER BY cs.score_value DESC;--Need to see the highest credit scores first
