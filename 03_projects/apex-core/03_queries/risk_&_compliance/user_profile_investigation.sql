SET search_path TO core;
/*========================================================================
We notice recently joined customers are under the rejection status.
Let's investigate to understand the cause of the rejections.

Objective: Determine if KYC-rejected users share a specific credit risk profile

Strategy: Categorize the credit scores before joining tables for audit
================================================================================*/
WITH category_creditscore AS (
	SELECT
		user_id,
		score_value,
		CASE
			WHEN score_value >= 750 THEN 'Excellent'
			WHEN score_value >= 650 THEN 'Good'
			WHEN score_value >= 550 THEN 'Fair'
			ELSE 'Poor'
		END AS derived_risk_level
	FROM core.credit_scores
)
SELECT
	v.customer_name,
	v.kyc_status,
	v.joined_date,
	cs.score_value,
	cs.derived_risk_level
FROM core.vw_user_risk_profile v
JOIN category_creditscore cs ON v.user_id = cs.user_id
WHERE v.kyc_status = 'Rejected'
	AND cs.derived_risk_level = 'Poor'
ORDER BY v.joined_date ASC;

--Identifying account that are high risk

SELECT
	v.user_id,
	v.customer_name,
	v.kyc_status,
	cs.score_value,
	cs.risk_level,
	CASE
		WHEN v.kyc_status = 'Rejected' AND cs.score_value < 500 THEN 'CRITICAL: HIGI RISK Segment'
		WHEN v.kyc_status = 'Rejcted' THEN 'Investigate: Identity Issue'
		ELSE 'Standard Review'
	END AS compliance_priority
FROM core.vw_user_risk_profile v
JOIN core.credit_scores cs ON v.user_id = cs.user_id
WHERE v.kyc_status = 'Rejected'
ORDER BY cs.score_value ASC;


