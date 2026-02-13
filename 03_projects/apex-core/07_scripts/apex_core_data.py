import os
import pandas as pd
import uuid
import random
from faker import Faker
from datetime import datetime, timedelta
from dotenv import load_dotenv
from sqlalchemy import create_engine

__loader__
DB_USER = os.getenv('DB_USER')
DB_PASS = os.getenv('DB_PASS')
DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')

engine =create_engine(f'f'postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}'p')


# 1. INITIALIZE & SETTINGS
fake = Faker()
Faker.seed(42)
num_users = 200

# --- DATABASE CONNECTION SETTINGS ---
# Replace 'your_password' and 'your_db_name' with your actual local Postgres info
DB_USER = 'postgres'
DB_PASS = '(Man3go_22.&0+-_,3' # <--- CHANGE THIS
DB_HOST = 'localhost'
DB_PORT = '5432'
DB_NAME = 'apex_core'  # <--- CHANGE THIS

engine = create_engine(f'postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

print("Starting data generation and load...")

# 2. GENERATE USERS
users = []
for _ in range(num_users):
    u_id = str(uuid.uuid4())
    created = fake.date_time_between(start_date='-2y', end_date='-1y')
    users.append({
        "user_id": u_id,
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "email": fake.email(),
        "lead_source": random.choice(['Facebook', 'Google', 'Referral', 'Organic', 'TikTok']),
        "kyc_status": random.choice(['verified', 'verified', 'verified', 'pending', 'failed']),
        "created_at": created,
        "country_code": random.choice(['USA', 'GBR', 'CAN', 'AUS']),
        "onboarding_date": created + timedelta(days=random.randint(0, 5)),
        "is_active": True
    })
df_users = pd.DataFrame(users)

# 3. GENERATE ACCOUNTS
accounts = []
account_statuses = ['open', 'open', 'open', 'closed', 'frozen', 'pending']
for _, user in df_users.iterrows():
    for _ in range(random.randint(1, 2)):
        status = random.choice(account_statuses)
        created_at = user['onboarding_date'] + timedelta(hours=random.randint(1, 24))
        closed_at = created_at + timedelta(days=random.randint(30, 300)) if status == 'closed' else None
        accounts.append({
            "account_id": str(uuid.uuid4()),
            "user_id": user['user_id'],
            "account_type": random.choice(['checking', 'savings', 'crypto']),
            "balance": 0 if status == 'pending' else round(random.uniform(50, 15000), 2),
            "currency": "USD",
            "status": status,
            "created_at": created_at,
            "closed_at": closed_at
        })
df_accounts = pd.DataFrame(accounts)

# 4. GENERATE MERCHANTS
merchants = []
mccs = {'Food': 5812, 'Entertainment': 7832, 'Groceries': 5411, 'Travel': 4112, 'Rent': 6513, 'Utilities': 4900}
for i in range(1, 31):
    cat = random.choice(list(mccs.keys()))
    merchants.append({"merchant_id": i, "name": fake.company(), "mcc_code": mccs[cat], "merchant_category": cat})
df_merchants = pd.DataFrame(merchants)

# 5. GENERATE TRANSACTIONS
transactions = []
active_acc_ids = df_accounts[df_accounts['status'] == 'open']['account_id'].tolist()
for _ in range(1000):
    sender = random.choice(active_acc_ids)
    t_date = fake.date_time_between(start_date='-1y', end_date='now')
    transactions.append({
        "transaction_id": str(uuid.uuid4()),
        "sender_account_id": sender,
        "receiver_account_id": str(uuid.uuid4()),
        "merchant_id": random.choice(merchants)['merchant_id'],
        "amount": round(random.uniform(1, 1200), 2),
        "category": random.choice(list(mccs.keys())),
        "transaction_date": t_date.date(),
        "transaction_time": t_date.time(),
        "transaction_status": random.choice(['completed', 'completed', 'reversed', 'declined']),
        "created_at": t_date
    })
df_transactions = pd.DataFrame(transactions)

# 6. GENERATE CREDIT SCORES
credit_scores = [{"score_id": str(uuid.uuid4()), "user_id": u['user_id'], "score_value": random.randint(300, 850), "refresh_date": datetime.now()} for _, u in df_users.iterrows()]
df_credit_scores = pd.DataFrame(credit_scores)

# 7. MARKETING SPEND
marketing = [{"campaign_id": i, "total_spend_usd": random.randint(5000, 20000), "utm_source": random.choice(['Facebook', 'Google', 'TikTok']), "campaign_month": datetime(2023, i, 1).date()} for i in range(1, 13)]
df_marketing_spend = pd.DataFrame(marketing)

# 8. FRAUD ALERTS
fraud = []
sampled_tx = df_transactions.sample(n=50)
for _, tx in sampled_tx.iterrows():
    u_id = df_accounts[df_accounts['account_id'] == tx['sender_account_id']]['user_id'].values[0]
    fraud.append({"alert_id": str(uuid.uuid4()), "transaction_id": tx['transaction_id'], "user_id": u_id, "risk_score": random.randint(1, 100), "alert_status": random.choice(['pending', 'confirmed_fraud', 'dismissed']), "triggered_at": tx['created_at']})
df_fraud_alerts = pd.DataFrame(fraud)

# --- THE AUTOMATED LOAD ---
try:
    df_users.to_sql('users', engine, if_exists='append', index=False)
    df_accounts.to_sql('accounts', engine, if_exists='append', index=False)
    df_merchants.to_sql('merchants', engine, if_exists='append', index=False)
    df_transactions.to_sql('transactions', engine, if_exists='append', index=False)
    df_credit_scores.to_sql('credit_scores', engine, if_exists='append', index=False)
    df_marketing_spend.to_sql('marketing_spend', engine, if_exists='append', index=False)
    df_fraud_alerts.to_sql('fraud_alerts', engine, if_exists='append', index=False)
    print("✅ Success: All 7 tables populated in Postgres.")
except Exception as e:
    print(f"❌ Error during load: {e}")

