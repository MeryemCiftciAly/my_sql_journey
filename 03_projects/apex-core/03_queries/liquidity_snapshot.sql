/*================================================
SCENARIO: Risk & Compliance - Liquidity Snapshot
==================================================
OBJECTIVE:
The CFO needs to identify the total available liquidity across
all 'open' accounts, but only for 'verified' users with a 
low-risk profile (Credit Score >= 600)

Tables Involved:
-- accounts (Balances and status)
--users (KYC verification status)
--credit_scores (Risk assessment)
--======================================================= */

SELECT
	a.account_type,
	SUM(a.balance) AS total_liquidity,
	COUNT(a.account_type) AS total_accounts
FROM accounts a
JOIN users u ON a.user_id = u.user_id
JOIN credit_scores cs ON u.user_id = cs.user_id
WHERE a.status = 'open'
	AND u.kyc_status = 'verified'
	AND cs.score_value >= 600
GROUP BY a.account_type
ORDER BY total_liquidity DESC;