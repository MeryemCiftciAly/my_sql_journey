import psycopg2
from faker import Faker
import random

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
    conn = psycopg2.connect(**db_config)
    cur = conn.cursor()
    
    # 1. Create 100 Users
    for _ in range(100):
        first = fake.first_name()
        last = fake.last_name()
        email = f"{first.lower()}.{last.lower()}@{fake.free_email_domain()}"
        kyc = random.choice(['Pending', 'Verified', 'Rejected'])
        
        cur.execute(
            "INSERT INTO users (first_name, last_name, email, kyc_status) VALUES (%s, %s, %s, %s) RETURNING user_id",
            (first, last, email, kyc)
        )
        user_id = cur.fetchone()[0]
        
        # 2. Create 1-2 Accounts per User
        for _ in range(random.randint(1, 2)):
            acc_type = random.choice(['Checking', 'Savings', 'Crypto'])
            balance = round(random.uniform(100, 50000), 2)
            cur.execute(
                "INSERT INTO accounts (user_id, account_type, balance) VALUES (%s, %s, %s) RETURNING account_id",
                (user_id, acc_type, balance)
            )
            account_id = cur.fetchone()[0]
            
            # 3. Create 10-50 Transactions per Account
            for _ in range(random.randint(10, 50)):
                amt = round(random.uniform(5, 2000), 2)
                cat = random.choice(['Entertainment', 'Groceries', 'Utilities', 'Transfer', 'Travel'])
                stat = random.choice(['Completed', 'Pending', 'Flagged'])
                cur.execute(
                    "INSERT INTO transactions (account_id, amount, merchant_category, transaction_status) VALUES (%s, %s, %s, %s)",
                    (account_id, amt, cat, stat)
                )
        
        # 4. Create a Credit Score for the User
        score = random.randint(300, 850)
        cur.execute("INSERT INTO credit_scores (user_id, score_value) VALUES (%s, %s)", (user_id, score))

    conn.commit()
    cur.close()
    conn.close()
    print("Database populated successfully!")

if __name__ == "__main__":
    populate_fintech()

