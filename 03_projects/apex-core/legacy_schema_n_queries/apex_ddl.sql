--Creating the schema if it doesn't already exist
CREATE SCHEMA IF NOT EXISTS core;

ALTER DATABASE apex_core SET search_path TO core;

CREATE TYPE kyc_status_enum AS ENUM ('Pending', 'Verified', 'Rejected');
CREATE TYPE account_type_enum AS ENUM('Checking', 'Savings','Crypto');
CREATE TYPE transaction_status_enum AS ENUM('Completed','Pending','Flagged');

-- Create Users Table
CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    kyc_status kyc_status_enum NOT NULL,
    onboarding_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Accounts Table
CREATE TABLE accounts (
    account_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    account_type account_type_enum NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Transactions Table
CREATE TABLE transactions (
    transaction_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id) ON DELETE CASCADE,
    amount DECIMAL(15, 2) NOT NULL,
    merchant_category VARCHAR(50),
    transaction_status transaction_status_enum NOT NULL,
    transaction_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Credit Scores Table
CREATE TABLE credit_scores (
    score_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    score_value INT CHECK (score_value BETWEEN 300 AND 850) NOT NULL,
    refresh_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_account_user_id ON accounts(user_id);
CREATE INDEX idx_transactions_account_id ON transActions(account_id);
CREATE INDEX idx_credit_scores_user_id ON credit_scores(user_id);
