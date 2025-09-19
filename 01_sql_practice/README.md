# 01_sql_practice

This repository contains SQL practice exercises using a variety of datasets from sources such as [freeCodeCamp](https://www.freecodecamp.org/) and [Data with Baraa](https://datawithbaraa.com/).  

## Purpose

- This repository is for **personal practice** and skill-building in SQL and PostgreSQL.  
- Exercises focus on real-world scenarios such as creating tables, inserting data, handling constraints, and performing joins and aggregations.  
- The work shown here demonstrates **problem-solving, adaptation, and troubleshooting skills**, especially when migrating datasets from MySQL to PostgreSQL.

## Customers Dataset

- **Source:** freeCodeCamp tutorial dataset.  
- **Original Setup:** Designed for MySQL, including syntax and data types not directly compatible with PostgreSQL.  
- **Current Setup:** Using PostgreSQL, which caused issues due to differences in syntax, data types, and foreign key constraints.  
- **Issue Encountered:** Foreign key constraints on `salesrepemployeenumber` prevented inserts because the referenced `employees` table did not contain matching keys.  
- **Action Taken:**  
  - Dropped the foreign key constraint temporarily.  
  - Created a **custom dataset** for the `customers` table with valid or `NULL` `salesrepemployeenumber` values to allow continued practice.  
- **Reasoning:** Enables ongoing practice with joins, queries, and other SQL operations without being blocked by dataset inconsistencies.  

## Notes

- This work is **not production-ready**; it is intended purely for learning and practice.  
- Highlights skills in **data cleaning, dataset adaptation, troubleshooting SQL errors**, and working with relational databases.  
- Future updates may include additional datasets, more complex queries, and integration with other tables for advanced practice.

