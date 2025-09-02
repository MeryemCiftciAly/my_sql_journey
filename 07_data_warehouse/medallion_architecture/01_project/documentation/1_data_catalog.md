# Data Catalog – Data Warehouse Project

## **📌 Table of Contents**

### Project Overview

### Medallion Layer Definitions

### Source Layer Mapping

### Gold Layer Dimension Tables

### **gold_dim_customers**

- Overview
- Source Layer Mapping
- Schema Definition
- SQL View Definition

### **gold_dim_products**

- Overview
- Source Layer Mapping
- Schema Definition
- SQL View Definition

## Gold Layer Facts Table

### **gold_facts_sales**

- Overview
- Source Layer Mapping
- Schema Definition
- SQL View Definition

## Diagrams

- Data Flow Diagram
- Integration Model
- Star Schema Data Model

## Additional Notes & Diagrams

- Silver Layer Insertion Diagram
- Naming Convention Document

---

## **Data Catalog - Data Warehouse Project**

### **Project Overview**

This Data Catalog provides a structured overview of the Gold Layer tables in the Data Warehouse. It includes **dimension tables** and **fact tables**, detailing their schema, data transformations, and relationships. The Gold Layer consists of **business-ready, enriched, and consolidated data**, optimized for reporting and analytics.

## **Medallion Layer Definitions**

- **Bronze Layer**: Raw data ingested from source systems with minimal transformations.
- **Silver Layer**: Cleaned and standardized data, ready for business analysis.
- **Gold Layer**: Aggregated, modeled, and enriched data optimized for business reporting.

## **Source Layer Mapping**

### **Bronze Layer (Raw Data Sources)**

- `bronze_crm_customers`: Raw customer data from the CRM system.
- `bronze_erp_customers`: Raw customer information from the ERP system.
- `bronze_erp_locations`: Raw location data related to customers.

### **Silver Layer (Cleaned & Standardized Data)**

- `silver_crm_cst_inf0`: Cleaned and transformed customer data from CRM.
- `silver_erp_cust_az12`: Standardized customer details from ERP.
- `silver_erp_loc_a101`: Standardized location information.

### **Gold Layer (Final Business-Ready Data)**

- `gold_dim_customers`: Final enriched table containing a consolidated view of customer details.

## **Gold Layer Dimension Table: gold_dim_customers**

### **Overview**

The `gold_dim_customers` table is a **dimension table** in the Gold Layer. It consolidates customer data from multiple Silver Layer sources, ensuring high data integrity and usability for analytics and reporting.

## **Source Layer Mapping**

### **Bronze Layer (Raw Data Sources)**

- `bronze_crm_customers`: Raw customer data from the CRM system.
- `bronze_erp_customers`: Raw customer information from the ERP system.
- `bronze_erp_locations`: Raw location data related to customers.

### **Silver Layer (Cleaned & Standardized Data)**

- `silver_crm_cst_inf0`: Cleaned and transformed customer data from CRM.
- `silver_erp_cust_az12`: Standardized customer details from ERP.
- `silver_erp_loc_a101`: Standardized location information.

### **Gold Layer (Final Business-Ready Data)**

- `gold_dim_customers`: Final enriched table containing a consolidated view of customer details.

### **Schema Definition**

| **Column Name** | **Data Type** | **Description** | **Example Value** |
| --- | --- | --- | --- |
| `customer_key` | INT | A unique surrogate key for each customer. | 1 |
| `customer_id` | VARCHAR(50) | The original customer ID from the CRM system. | "CUST12345" |
| `customer_number` | VARCHAR(50) | A unique customer reference number from ERP. | "CN-987654" |
| `first_name` | VARCHAR(255) | Customer's first name. | "John" |
| `last_name` | VARCHAR(255) | Customer's last name. | "Doe" |
| `marital_status` | VARCHAR(50) | Marital status of the customer. | "Married" |
| `birth_date` | DATE | Customer's birth date. | "1985-07-15" |
| `gender` | VARCHAR(50) | Customer's gender (derived from CRM or ERP data). | "Male" |
| `country` | VARCHAR(100) | Country where the customer is located. | "USA" |
| `create_date` | TIMESTAMP | The date when the customer record was created. | "2023-01-05 14:30:00" |

## **SQL View Definition**

```sql
VIEW datawarehouse.gold_dim_customers AS
SELECT
ROW_NUMBER() OVER (ORDER BY ci.cust_id) AS customer_key,
ci.cust_id AS customer_id,
ci.cust_key AS customer_number,
ci.cust_firstname AS first_name,
ci.cust_lastname AS last_name,
ci.cst_marital_status AS marital_status,
ca.bdate AS birth_date,
(CASE
WHEN (ci.cst_gndr <> 'n/a') THEN ci.cst_gndr
ELSE COALESCE(ca.gen, 'n/a')
END) AS gender,
la.cntry AS country,
ci.cst_create_date AS create_date
FROM
((datawarehouse.silver_crm_cst_inf0 ci
LEFT JOIN datawarehouse.silver_erp_cust_az12 ca
ON (ci.cust_key = ca.cid))
LEFT JOIN datawarehouse.silver_erp_loc_a101 la
ON (ci.cust_key = la.cid));
```

## **Gold Layer Dimension Table: gold_dim_products**

### **Overview**

The `gold_dim_products` table is a **dimension table** in the Gold Layer. It provides an enriched and consolidated view of product data, sourced from multiple Silver Layer tables, ensuring high-quality data for reporting and analytics.

## **Source Layer Mapping**

### **Bronze Layer (Raw Data Sources)**

- `bronze_crm_products:` Raw customer data from the CRM system.
- `bronze_erp_products:` Raw customer information from the ERP system.

### **Silver Layer (Cleaned & Standardized Data)**

- `silver_crm_prd_info:` Cleaned and transformed customer data from CRM.
- `silver_erp_px_cat_g1v2:` Standardized customer details from ERP.

### **Gold Layer (Final Business-Ready Data)**

- `gold_dim_products:` Final enriched table containing a consolidated view of customer details.

### Schema Definition

| **Column Name** | **Data Type** | **Description** | **Example Value** |
| --- | --- | --- | --- |
| `product_key` | INT | A unique surrogate key assigned using row numbering. | 1 |
| `product_id` | VARCHAR(50) | The original product identifier from the CRM system. | "PRD56789" |
| `product_number` | VARCHAR(50) | A unique product reference number from the ERP system. | "PN-123456" |
| `category_id` | VARCHAR(50) | The category identifier linked to the product. | "CAT002" |
| `product` | VARCHAR(255) | The name of the product. | "Gaming Keyboard" |
| `cost` | DECIMAL(10,2) | The cost of the product. | 49.99 |
| `product_line` | VARCHAR(255) | The product line to which it belongs. | "Computer Accessories" |
| `category` | VARCHAR(255) | The main category name from the ERP system. | "Electronics" |
| `sub_category` | VARCHAR(255) | The sub-category under the main category. | "Keyboards" |
| `maintenance` | VARCHAR(255) | Maintenance details (if applicable). | "1-Year Warranty" |
| `start_date` | DATE | The date the product was introduced. | "2023-05-10" |
| `end_date` | DATE | The date the product was discontinued (NULL if active). | NULL |

### **SQL View Definition**

```sql
CREATE VIEW datawarehouse.gold_dim_products AS  
SELECT  
    ROW_NUMBER() OVER (ORDER BY pt.prd_start_dt, pt.prd_key) AS product_key,  
    pt.prd_id AS product_id,  
    pt.prd_key AS product_number,  
    pt.cat_id AS category_id,  
    pt.prd_nm AS product,  
    pt.prd_cost AS cost,  
    pt.prd_line AS product_line,  
    pc.cat AS category,  
    pc.subcat AS sub_category,  
    pc.maintenance AS maintenance,  
    pt.prd_start_dt AS start_date,  
    pt.prd_end_dt AS end_date  
FROM  
    datawarehouse.silver_crm_prd_info pt  
LEFT JOIN  
    datawarehouse.silver_erp_px_cat_g1v2 pc  
ON  
    pt.cat_id = pc.id  
WHERE  
    pt.prd_end_dt IS NULL;
```

## **Gold Layer Fact Table: gold_fact_sales**

### **Overview**

The `gold_fact_sales` table is a **fact table** in the Gold Layer. It contains transactional sales data, linking products and customers for analytical insights.

## **Source Layer Mapping**

### **Bronze Layer (Raw Data Sources)**

- `bronze_crm_sales`: Raw customer data from the CRM system.

- **Silver Layer (Cleaned & Standardized Data)**
- `silver_crm_sales_details`: Cleaned and transformed customer data from CRM.

### **Gold Layer (Final Business-Ready Data)**

- `gold_facts_saless`: Final enriched table containing a consolidated view of customer details.

## Schema Definition

| **Column Name** | **Data Type** | **Description** | **Example** |
| --- | --- | --- | --- |
| `order_number` | `VARCHAR` | Unique identifier for the sales order. | `SO123456` |
| `product_key` | `INT` | Surrogate key referencing `gold_dim_products`. | `1001` |
| `customer_id` | `VARCHAR` | Unique identifier for the customer. | `CUST7890` |
| `order_date` | `DATE` | Date when the order was placed. | `2024-03-15` |
| `ship_date` | `DATE` | Date when the order was shipped. | `2024-03-18` |
| `due_date` | `DATE` | Date by which the order was due. | `2024-03-20` |
| `sales_amount` | `DECIMAL(10,2)` | Total sales amount for the order. | `150.75` |
| `quantity` | `INT` | Number of units sold. | `3` |
| `price` | `DECIMAL(10,2)` | Price per unit of the product. | `50.25` |

### **SQL View Definition**

```sql
VIEW datawarehouse.gold_fact_sales AS
SELECT
ld.sls_ord_num AS order_number,
datawarehouse.pd.product_key AS product_key,
datawarehouse.ct.customer_id AS customer_id,
ld.sls_order_dt AS order_date,
ld.sls_ship_dt AS ship_date,
ld.sls_due_dt AS due_date,
ld.sls_sales AS sales_amount,
ld.sls_quantity AS quantity,
ld.sls_price AS price
FROM
((datawarehouse.silver_crm_sales_details ld
LEFT JOIN datawarehouse.gold_dim_products pd
ON ld.sls_prd_key = datawarehouse.pd.product_number)
LEFT JOIN datawarehouse.gold_dim_customers ct
ON ld.sls_cust_id = datawarehouse.ct.customer_id));
```

## Diagrams

---

**Data Lineage Diagram** – Shows the data's journey from source systems (CRM, ERP) through different layers (Bronze, Silver, Gold), including transformation.

![Data Flow Diagram](https://github.com/MeryemCiftciAly/data-warehouse-project-sql/blob/main/Documentation/2_1Data%20_Flow_Diagramupd.png)

**Data Integration Diagram** – Focuses on how different datasets (Customers, Products, Sales) are combined and related across layers.

![Data Flow Diagram](https://github.com/MeryemCiftciAly/data-warehouse-project-sql/blob/main/Documentation/3_1Integration_File_Diagram.png)

## **Star Schema Data Model**

![Data Flow Diagram](https://github.com/MeryemCiftciAly/data-warehouse-project-sql/blob/main/Documentation/6_1Star_Schema_Data_Modelupd.png)

The **Star Schema Data Model** represents the structured organization of data in a **data warehouse**. It is designed to optimize analytical queries and improve reporting performance. The model consists of a **central fact table** connected to multiple **dimension tables**, forming a star-like shape.

## Star Schema Diagram Structure

The diagram illustrates:

- **Fact Table**: Stores transactional data with foreign keys linking to dimension tables.
- **Dimension Tables**: Contain descriptive attributes related to facts.
- **Relationships**: One-to-Many relationships from dimensions to the fact table.
- **Primary & Foreign Keys**: Establish referential integrity between tables.

## Tables in the Star Schema Model

### Fact Table

**gold_fact_sales**

- Stores sales transactions.
- Contains foreign keys linking to dimension tables.
- Includes measurable data such as revenue, quantity sold, and total sales amount.

### Dimension Tables

1. **gold_dim_customers**
    - Stores customer details such as customer ID, name, location, and demographic information.
    - Linked to the fact table via `customer_id`.
2. **gold_dim_products**
    - Contains product information including product ID, name, category, and brand.
    - Linked to the fact table via `product_id`.

## Relationships

- **One-to-Many**: Each customer, product, and date has multiple associated sales transactions in the fact table.
- **Primary & Foreign Keys**:
    - `customer_id` in `gold_fact_sales` → `customer_id` in `gold_dim_customers`
    - `product_id` in `gold_fact_sales` → `product_id` in `gold_dim_products`
    - `date_id` in `gold_fact_sales` → `date_id` in `gold_dim_time`

## Purpose & Benefits

- **Optimized for Analytics**: Reduces complexity and speeds up query performance.
- **Simplified Queries**: Allows efficient aggregation and reporting.
- **Scalability**: New dimensions can be added without major restructuring.

## Additional Notes & Diagrams

![Insertion_Prep_Disgram.png](https://github.com/MeryemCiftciAly/data-warehouse-project-sql/blob/main/Documentation/4_1Silver_and_Gold_Layer_Insertion_Diagram.png)

The **Silver Layer** serves as the **refined and structured** version of the raw data from the **Bronze Layer**. In this layer, data undergoes **transformation and cleaning** to improve its quality, consistency, and usability for further analysis. The goal is to prepare the data for **business logic and aggregation**, which are typically performed in the **Gold Layer**.

**Naming Convention Document** [**[Link]**](https://github.com/MeryemCiftciAly/data-warehouse-project-sql/blob/main/Documentation/naming_convention.md)

For consistency and clarity, all datasets follow the established naming conventions outlined in the Naming Convention Document. This ensures standardized table and column names across layers, improving data governance and usability.
