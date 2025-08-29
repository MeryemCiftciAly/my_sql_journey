## Project Overview
This repository contains SQL exercises and a mini project simulating a small bookstore's inventory and orders.  

- The **bookstore dataset** was created manually to represent a real inventory (book ID, title, author, published date, price, genre, discount, ISBN).  
- The **orders dataset** was adapted from a beginner SQL tutorial provided by **DataWithBaraa** taught by Baraa Khatib Salkink [datawithbaraa](https://www.youtube.com/watch?v=SSKVgrwhzus&t=7684s) 

The exercise demonstrates working with **DDL, DML, table updates, and basic data wrangling** in SQL.  
It showcases how to structure data, update incomplete records, calculate derived values like total revenue, and maintain consistency across related tables.

## File Structure

All scripts are stored under the `basics` folder in sequential order:

| Step | Description | File |
|------|-------------|------|
| 1a   | Create the bookstore table | [1a_DDL_bookstore.sql](https://github.com/MeryemCiftciAly/my_sql_journey/blob/main/sql_practice/%2000_basics/1a_ddl_bookstore.sql) |
| 2a   | Insert sample bookstore data | [2a_inserting_bookstore.sql](basics/2a_inserting_bookstore.sql) |
| 3a   | Update the orders table with unit price, total revenue, and book IDs | [3a_updating_bookstore_orders.sql](basics/3a_updating_bookstore_orders.sql) |

---

## Project Story

Jason, the bookstore owner, kept a careful log of his inventory, including book IDs, titles, authors, published dates, prices, genres, discounts, and ISBN numbers. 
He also had a **partial orders record** tracking customer purchases in a spreadsheet.

The SQL workflow here achieves the following:

1. Transform his inventory log into a structured **bookstore table** in SQL.  
2. Insert sample orders data and reconcile it with the bookstore inventory.  
3. Calculate **unit price and total revenue**, taking discounts into account.  
4. Build a **complete orders table** that can be used for reporting, analysis, or exporting to Excel.

---

## Run the Code Live

You can see all SQL scripts running in a live Kaggle notebook:

[View Kaggle Notebook](https://www.kaggle.com/meryemciftci)

---

## Notes

- This repository is organized for **learning and demonstration purposes**.  
- SQL exercises focus on **creating tables, inserting data, updating tables, and calculating derived columns** like total revenue.  
- The workflow mimics a real business scenario to show the practical application of SQL.
