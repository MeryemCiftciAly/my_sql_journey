# Day 1: Getting to Know Your SQL Environment (GUI Workflow)

This guide outlines the steps for an analyst starting with a new SQL database environment using **GUI tools** like pgAdmin, SQL Server Management Studio (SSMS), MySQL Workbench, or DBeaver. Focus is on **need-to-know information** for day-one exploration.

---

## 1. Get Access
- Obtain **connection info**: host/server, database name, username, password.  
- Confirm **tools you’ll use**: pgAdmin, SSMS, MySQL Workbench, DBeaver.  
- Verify **access permissions**: read-only, read-write, or admin.

---

## 2. Connect to the Database
- Open your GUI and **create a new connection** using credentials.  
- Save the connection for easy reconnection.  

---

## 3. Explore Databases
- Expand **Databases** in the object explorer/tree view.  
- Identify which database(s) you’ll be working with (production, staging, test).  

---

## 4. Explore Schemas & Tables
- Expand **Schemas** inside the database (PostgreSQL: usually “public”).  
- Expand **Tables** to see available datasets.  
- Optionally, check **Views** or **Stored Procedures** if needed.

---

## 5. Inspect Table Structures
- Right-click a table → **View Columns / Properties**.  
- Take note of:
  - Column names  
  - Data types (int, varchar, date, etc.)  
  - Nullability  

---

## 6. Preview Data
- Right-click a table → **Select / View Top N Rows**.  
- Look at:
  - Column content and types  
  - Null or missing values  
  - Example rows to understand data format  

---

## 7. Check Relationships (Optional)
- Look for **foreign keys** or use GUI diagram tools to see table relationships.  
- Helps identify how tables link for joins and analyses.

---

## 8. Organize Notes
- Create a personal **data dictionary / README**:
  - Database name and environment (production vs test)  
  - Schema names  
  - Key tables and their purpose  
  - Known quirks (e.g., date column stored as string)  

---

## 9. Run Basic Queries
- Use the GUI query editor for small exploratory queries:  

**PostgreSQL / MySQL:**
```sql
SELECT * FROM table_name LIMIT 10;
SELECT COUNT(*) FROM table_name;
