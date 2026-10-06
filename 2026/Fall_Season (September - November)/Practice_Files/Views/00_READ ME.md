## About

This folder contains my work for **CS50's Introduction to Databases with SQL**, Problem Set 0: **Views**.

The exercise uses a database of Japanese woodblock prints by **Hokusai and Hiroshige**. The goal is to practice writing SQL queries to retrieve, filter, sort, count, and summarize data.

## Source

**Course:** CS50's Introduction to Databases with SQL  
**Problem Set:** 0 — Views  
**Database:** `views.db`

Course exercise:  
https://cs50.harvard.edu/sql/psets/0/views/

## SQL Skills Practiced

- `SELECT` — choosing columns to return
- `WHERE` — filtering rows
- `LIKE` — searching for text patterns
- `COUNT()` — counting records
- `AVG()` — calculating an average
- `MAX()` — finding the highest value
- `ROUND()` — rounding calculated results
- `AS` — renaming columns
- `ORDER BY` — sorting results
- `ASC` / `DESC` — controlling sort direction
- `LIMIT` — restricting the number of returned rows

## Questions

The exercise includes queries involving:

1. Listing Japanese and English titles.
2. Finding Hokusai prints with "river" in the English title.
3. Counting Hokusai prints with "Fuji" in the English title.
4. Counting Hiroshige prints referring to "Eastern Capital."
5. Finding the maximum contrast among Hokusai prints.
6. Finding the average entropy of Hiroshige prints.
7. Finding the 5 brightest Hiroshige prints.
8. Finding the 5 least-contrast Hokusai prints.
9. Finding the print with the highest brightness.
10. Creating a custom question using `AS`, `WHERE`, and `ORDER BY`.

## What I Practiced

This exercise helped me practice translating a question written in plain language into SQL.

A major focus was understanding the difference between:

- calculating a single value with functions such as `MAX()` or `AVG()`
- sorting individual rows with `ORDER BY`
- limiting the returned rows with `LIMIT`

For example, finding the **highest brightness value** and finding the **print with the highest brightness** require different approaches.

## Learning Notes

I am using these exercises to build SQL skills through practice rather than only following tutorials. I am focusing on reading the question carefully, identifying the required columns and conditions, and then building the query step by step.

