### Date: 8-28-2025

## Project Overview
This exercise is based on a fictional bookstore owned by Jason (not a real person). The scenario was created to practice SQL basics, including:

- The **bookstore dataset** was created manually to represent a real inventory (book ID, title, author, published date, price, genre, discount, ISBN).  
- The **orders dataset** was adapted from a beginner SQL tutorial provided by **DataWithBaraa** taught by Baraa Khatib Salkini [datawithbaraa](https://www.youtube.com/watch?v=SSKVgrwhzus&t=7684s) 

The exercise demonstrates working with **DDL, DML, table updates, and basic data wrangling** in SQL.  
It showcases how to structure data, update incomplete records, calculate derived values like total revenue, and maintain consistency across related tables.

## File Structure

All scripts are stored under the `basics` folder in sequential order:

| Step | Description | File |
|------|-------------|------|
| 1a   | Create the bookstore table |  [1a_DDL_bookstore.sql](https://github.com/MeryemCiftciAly/my_sql_journey/blob/34917784f0dec8fe7d3fc86f114102659d0973ad/01_sql_practice/%2000_basics/01_ddl_schema_definition/table_bookstore.sql) |
| 2a   | Insert sample bookstore data | [2a_inserting_bookstore.sql] (https://github.com/MeryemCiftciAly/my_sql_journey/blob/1eb0f3d33ce5520e70051ac95475da812ff999d0/01_sql_practice/%2000_basics/02_dml_data_management/data_insert_bookstore.sql)|
---

## Project Story

## Jason’s Bookstore Story  

Jason runs a small neighborhood bookstore. Every week, he updates his notebook with new titles, old classics, prices, and customer orders.  

But as his business grows, he starts running into problems:  

- Discounts aren’t always recorded consistently  
- Orders are tracked in a messy spreadsheet  
- Calculating revenue by hand takes too long  

To solve this, I imagine Jason moving his records into a structured **SQL database**.  

### The Workflow  

In this exercise, I walk through that process step by step:  

1. **Create a bookstore table** that captures his full inventory.  
2. **Insert customer orders** from his old spreadsheet.  
3. **Update the orders table** to include book IDs, discounts, unit prices, and total revenue.  
4. **End up with a clean dataset** that Jason could use for reporting, analysis, or exporting into Excel.  

---  

This exercise is more than just SQL practice, t’s about showing how structured data can make life easier for small business owners like Jason.  

---

## Run the Code Live

You can see all SQL scripts running in a live Kaggle notebook:

[View Kaggle Notebook]([https://www.kaggle.com/meryemciftci])(https://www.kaggle.com/code/meryemciftci/sql-basics-mini-project-ddl-dml)

---

## Notes

- This repository is organized for **learning and demonstration purposes**.  
- SQL exercises focus on **creating tables, inserting data, updating tables, and calculating derived columns** like total revenue.  
- The workflow mimics a real business scenario to show the practical application of SQL.
