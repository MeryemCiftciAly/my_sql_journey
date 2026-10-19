# Restaurant Order Analysis

## Project Overview

This project uses SQL to explore restaurant menu items and order records, identify patterns in customer ordering behavior, and demonstrate how structured data can support business decisions.

The project is inspired by the Restaurant Operations Analysis guided project from Maven Analytics. It uses the supplied restaurant dataset as a foundation while introducing an additional analytical stage and a structured workflow.

## Project Objectives

- Create and organize relational tables for restaurant menu items and order details.
- Load and validate source data using SQL.
- Explore ordering patterns and menu performance.
- Answer business questions using filtering, aggregation, joins, and other SQL techniques.
- Translate query results into insights that could support restaurant operations and decision-making.

## Tools and Environment

- **Databricks Free Edition:** SQL development and data analysis environment.
- **Databricks SQL:** Database setup, data loading, validation, exploratory analysis, and business queries.
- **GitHub:** Version-controlled SQL scripts, project documentation, and a record of analytical decisions.

The original setup script was written for MySQL. It was adapted for Databricks SQL, including adjustments to the supported syntax and data types. The original source file is preserved separately from the adapted implementation.

## Project Approach

The work is organized into separate stages so that each step can be inspected, tested, and repeated independently.

1. **Environment checks:** Confirm the active catalog and schema and inspect existing database objects.
2. **Schema creation:** Establish the project schema in Databricks.
3. **Table creation:** Define the `menu_items` and `order_details` tables.
4. **Data loading:** Load menu and order records into their respective tables.
5. **Data validation:** Check row counts, missing values, identifier uniqueness, and relationships between the tables.
6. **Intermediate analysis:** Introduce an additional exploratory business question before proceeding to the basic analysis.
7. **Basic Analysis:** Use SQL queries to investigate restaurant ordering and menu performance.
8. **Business interpretation:** Explain what the results may mean for restaurant operations and what further investigation could be useful.

## What Makes This Project Different?

This project retains the core objectives of the Maven Analytics exercise while adding three elements.

**1. A different SQL environment**

The database setup and queries are implemented in Databricks rather than MySQL. This includes adapting the source SQL and working with catalogs, schemas, tables, and SQL Editor workflows.

**2. An additional analytical stage**

Before completing the basic analysis, the project introduces an intermediate analysis of the dataset. This step investigates an independently selected business question and distinguishes exploratory analysis from answering predefined questions.

The intermediate question, methodology, and findings will be documented separately after the analysis is completed.

**3. A structured and reproducible workflow**

Rather than keeping all SQL in one large script, the project separates environment checks, schema setup, table creation, data loading, validation, and analysis. This makes the work easier to review, troubleshoot, maintain, and reproduce.

## Potential Business Value

Restaurant owners and food-service managers operate with limited time, inventory, staffing, and resources. Order and menu data can help them investigate questions such as:

- Which menu items and categories receive the most and fewest orders?
- When does ordering activity increase or decrease?
- Which products may warrant closer attention when planning inventory?
- Are there menu items that could benefit from promotion, review, or further investigation?
- What additional data would be needed to make stronger decisions about purchasing, staffing, or profitability?

For businesses that prepare or supply food to the public, understanding ordering patterns can help inform demand planning, purchasing, production scheduling, and conversations with restaurant customers.

These are potential applications, not conclusions assumed in advance. Recommendations will depend on the actual query results and the limitations of the available dataset.

## Data and Limitations

The project uses the restaurant dataset supplied with the Maven Analytics guided exercise. The analysis is limited to the fields and records provided.

The available menu and order data can support analysis of recorded orders and menu characteristics. However, stronger conclusions about profitability, waste, inventory availability, customer preferences, or staffing would require additional data where those factors are not captured.

## Repository Structure

- `sql/` — SQL scripts organized by project stage.
- `data/` — Source-data notes and data-access documentation.
- `documentation/` — Data dictionary, implementation decisions, and analytical notes.

## Conclusion

This project demonstrates the application of SQL to a practical restaurant operations scenario, combining database setup, data validation, exploratory investigation, and business-focused analysis. Its emphasis is on producing traceable analytical work and interpreting findings in a way that can support informed operational decisions.
