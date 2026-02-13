-- 1. Create Users Table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    lead_source VARCHAR(50),
    kyc_status VARCHAR(20), 
    created_at TIMESTAMP,
    country_code VARCHAR(3),
    onboarding_date TIMESTAMP,
    is_active BOOLEAN
);

-- 2. Create Accounts Table
CREATE TABLE accounts (
    account_id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    account_type VARCHAR(20),
    balance DECIMAL(18,2),
    currency VARCHAR(3),
    status VARCHAR(20),
    created_at TIMESTAMP,
    closed_at TIMESTAMP
);

-- 3. Create Merchants Table
CREATE TABLE merchants (
    merchant_id INT PRIMARY KEY,
    name VARCHAR(100),
    mcc_code INT,
    merchant_category VARCHAR(50)
);

-- 4. Create Transactions Table
CREATE TABLE transactions (
    transaction_id UUID PRIMARY KEY,
    sender_account_id UUID REFERENCES accounts(account_id),
    receiver_account_id UUID, -- Keeping flexible for external transfers
    merchant_id INT REFERENCES merchants(merchant_id),
    amount DECIMAL(18,2),
    category VARCHAR(50),
    transaction_date DATE,
    transaction_time TIME,
    transaction_status VARCHAR(20),
    created_at TIMESTAMP
);

-- 5. Create Credit Scores Table
CREATE TABLE credit_scores (
    score_id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    score_value INTEGER,
    refresh_date TIMESTAMP
);

-- 6. Create Marketing Spend Table
CREATE TABLE marketing_spend (
    campaign_id INT PRIMARY KEY,
    total_spend_usd NUMERIC(18,2),
    utm_source VARCHAR(50),
    campaign_month DATE
);

-- 7. Create Fraud Alerts Table
CREATE TABLE fraud_alerts (
    alert_id UUID PRIMARY KEY,
    transaction_id UUID REFERENCES transactions(transaction_id),
    user_id UUID REFERENCES users(user_id),
    risk_score INT,
    alert_status VARCHAR(20),
    triggered_at TIMESTAMP
);
