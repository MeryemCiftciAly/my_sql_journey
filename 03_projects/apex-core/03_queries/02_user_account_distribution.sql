/* =====================================================================
SCENARIO 2: Where  users holding their money?
=====================================================================
OBJECTIVE: 
Before targeting the savings account users, we need to see where the users are holding their money. 
Seeing a breakdown of how many users are holding what type of account can give a better idea of where to capture liquidity.

TABLE(S) INVOLVED: 
- accounts (user_id and account_type)
=====================================================================
*/


SELECT 
    has_checking,
    has_savings,
    has_crypto,
    COUNT(user_id) AS total_users,
    ROUND(AVG(total_balance), 2) AS avg_user_liquidity
FROM (
    SELECT 
        user_id,
        MAX(CASE WHEN account_type = 'checking' THEN 1 ELSE 0 END) as has_checking,
        MAX(CASE WHEN account_type = 'savings' THEN 1 ELSE 0 END) as has_savings,
        MAX(CASE WHEN account_type = 'crypto' THEN 1 ELSE 0 END) as has_crypto,
        SUM(balance) as total_balance
    FROM accounts
    GROUP BY user_id
) sub
GROUP BY has_checking, has_savings, has_crypto
ORDER BY total_users DESC;

