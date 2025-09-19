
import sqlite3
import pandas as pd

# -------------------------------
# Definition Functions (Modular)
# -------------------------------

# —---------- Creating table —-------------------
def creating_table():
    """Create table if it doesn't exist."""
    with sqlite3.connect("customer.db") as conn:
        cur = conn.cursor()
        cur.execute("""
            CREATE TABLE IF NOT EXISTS elitecustomers
            (first_name TEXT, last_name TEXT, email TEXT UNIQUE)
        """)
        conn.commit()
    print("Table created\n")

# —---------- Inserting Data  —-------------------

def insert_many_customers(many_elite):
    """Insert multiple customers at once."""
    with sqlite3.connect("customer.db") as conn:
        cur = conn.cursor()
        cur.executemany("INSERT INTO elitecustomers VALUES (?,?,?)", many_elite)
        conn.commit()
    print(f"Inserted {len(many_elite)} customers.\n")

# —---------- Filtering Data—-------------------

def filter_by_last_name(last_name):
    """Return filtered results as a list of tuples."""
    with sqlite3.connect("customer.db") as conn:
        cur = conn.cursor()
        cur.execute("SELECT DISTINCT * FROM elitecustomers WHERE last_name = ?", (last_name,))
        return cur.fetchall()

# —---------- Filtering with dataframes —-------------------

def filter_by_first_name_df(first_name):
    """Return filtered results as a pandas DataFrame."""
    with sqlite3.connect("customer.db") as conn:
        df = pd.read_sql(
            "SELECT DISTINCT* FROM elitecustomers WHERE first_name = ?",
            conn,
            params=(first_name,)
        )
        return df

def filter_by_full_name_df(first_name, last_name):
    """Return filtered results for full name as a pandas DataFrame."""
    with sqlite3.connect("customer.db") as conn:
        df = pd.read_sql(
            "SELECT DISTINCT * FROM elitecustomers WHERE first_name = ? AND last_name = ?",
            conn,
            params=(first_name, last_name)
        )
        return df

# —---------- Updating table —-------------------


def update_first_name(old_first_name, new_first_name):
    with sqlite3.connect("customer.db") as conn:
       cur = conn.cursor()
       cur.execute("UPDATE elitecustomers SET first_name = ? WHERE first_name = ?", (new_first_name, old_first_name))
       conn.commit()

# —---------- Checking Table Values —-------------------

def check_table():
    """Display full table as a pandas DataFrame."""
    with sqlite3.connect("customer.db") as conn:
        df = pd.read_sql("SELECT DISTINCT * FROM elitecustomers", conn)
    print("\nFull table:")
    print(df)
    print("\n")

# -------------------------------
# Main Execution Block
# -------------------------------

if __name__ == '__main__':
    print("💫" * 10)
    print("\nStarting modular SQL + Python workflow\n")

    # Step 1: Create table
    creating_table()

    # Step 2: Insert multiple records
    customers = [
        ("Moses", "Prophet", "mprophet@blessed.com"),
        ("Paul", "Thee", "paulth@thatguy.com"),
        ("Yo", "Yo", "yyo@player.com"),
        ("Meryem", "Ciftci", "meryemc@work.com")
    ]
    insert_many_customers(customers)

    # Step 3: Filter by last name (tuple output)
    results = filter_by_last_name("Yo")
    print("\nFiltered results for last_name='Yo':")
    for row in results:
        print(f"First Name: {row[0]}, Last Name: {row[1]}, Email: {row[2]}")

    # Step 4: Filter by first name (DataFrame output)
    df_first = filter_by_first_name_df("Meryem")
    print("\nFiltered results for first_name='Meryem':")
    print(df_first)

    # Step 5: Filter by full name (DataFrame output)
    df_full = filter_by_full_name_df("Moses", "Prophet")
    print("\nFiltered results for full name Moses Prophet:")
    print(df_full)

    # Step 6: Updating table
    update_first_name("Moses", "Peter")

    # Step 7: Show full table
    check_table()

