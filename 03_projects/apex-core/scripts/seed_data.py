import psycopg2
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

# UPDATE THESE TO MATCH YOUR DBEAVER CONNECTION
db_config = {
    "dbname": "apex_core",
    "user": "postgres",
    "password": "(Man3go_22.&0+-_,3",
    "host": "localhost",
    "port": "5432"
}

def populate_fintech():
    try:
        conn = psycopg2.connect(**db_config)
        cur = conn.cursor()
        print("Connected! Syncing with Production Schema...")

        for _ in range(100):
            # --- USERS ---
            first, last = fake.first_name(), fake.last_name()
            email = f"{first.lower()}.{last.lower()}@{fake.free_email_domain()}"
            kyc = random.choice(['Pending', 'Verified', 'Rejected'])
            onboard_date = datetime.now() - timedelta(days=random.randint(10, 90))
            
            # Using your specific column: onboarding_date
            cur.execute(
                "INSERT INTO users (first_name, last_name, email, kyc_status, onboarding_date) VALUES (%s, %s, %s, %s, %s) RETURNING user_id",
                (first, last, email, kyc, onboard_date)
            )
            user_id = cur.fetchone()[0]

            # --- CREDIT SCORES ---
            score = random.randint(300, 850)
            cur.execute("INSERT INTO credit_scores (user_id, score_value) VALUES (%s, %s)", (user_id, score))

            # --- ACCOUNTS ---
            if random.random() < 0.15: continue 

            for _ in range(random.randint(1, 2)):
                acc_type = random.choice(['Checking', 'Savings', 'Crypto'])
                is_closed = random.random() < 0.10
                status = 'Closed' if is_closed else 'Active'
                closed_date = onboard_date + timedelta(days=random.randint(5, 30)) if is_closed else None
                
                # Logic for Marketing: High score/Zero balance
                balance = 0.0 if (is_closed or (score > 700 and random.random() < 0.25)) else round(random.uniform(100, 50000), 2)
                create_date = onboard_date + timedelta(hours=random.randint(1, 48))

                cur.execute(
                    "INSERT INTO accounts (user_id, account_type, balance, status, created_at, closed_at) VALUES (%s, %s, %s, %s, %s, %s) RETURNING account_id",
                    (user_id, acc_type, balance, status, create_date, closed_date)
                )
                account_id = cur.fetchone()[0]
                
                # --- TRANSACTIONS ---
                for _ in range(random.randint(5, 15)):
                    amt = round(random.uniform(5, 500), 2)
                    cat = random.choice(['Entertainment', 'Groceries', 'Utilities', 'Travel'])
                    
                    # Matches your transaction_status_enum (plus 'Failed' we added)
                    stat = random.choices(['Completed', 'Pending', 'Failed', 'Flagged'], weights=[80, 10, 5, 5])[0]
                    tx_date = create_date + timedelta(days=random.randint(1, 30))
                    
                    if closed_date and tx_date > closed_date: continue

                    # Using your specific column: transaction_time
                    cur.execute(
                        "INSERT INTO transactions (account_id, amount, merchant_category, transaction_status, transaction_time) VALUES (%s, %s, %s, %s, %s)",
                        (account_id, amt, cat, stat, tx_date)
                    )
        
        conn.commit()
        print("Success! Data is now perfectly aligned with your Production DDL.")

    except Exception as e:
        print(f"Error: {e}")
    finally:
        if conn:
            cur.close()
            conn.close()

if __name__ == "__main__":
    populate_fintech()
