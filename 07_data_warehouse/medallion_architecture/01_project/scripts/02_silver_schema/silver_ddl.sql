-- //////////////////////////////
-- Silver Layer DDL

-- This script defines the table structures for the Silver Layer of the data warehouse.
-- The Silver Layer represents the cleaned, transformed, and enriched data, serving as an
-- intermediate stage between raw ingestion (Bronze Layer) and the final analytical tables (Gold Layer).
-- The tables created here are structured to improve query performance and data integrity
-- before moving to the Gold Layer.

- - Note:
-- This script is designed for MySQL, which does not support individual schemas.
-- The `USE data_warehouse;` statement specifies the database where the Silver Layer tables reside.

-- For more details on the overall data warehouse structure, refer to the README file.
-- ///////////////////////////////

USE datawarehouse; 

-- /////////////////////////////////////////
-- Creating Silver CRM Source Table structure - silver_crm_cst_inf0
-- /////////////////////////////////////////

CREATE TABLE IF NOT EXISTS datawarehouse.silver_crm_cst_inf0 (
cust_id INT,
cust_key VARCHAR(50),
cust_firstname VARCHAR(50),
cust_lastname VARCHAR(50),
cst_marital_status VARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE,
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT
   );
   
-- /////////////////////////////////////////
-- Creating silver CRM Source Table structure - silver_crm_sales_details
-- /////////////////////////////////////////
CREATE TABLE datawarehouse.silver_crm_sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id VARCHAR(50),
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_quantity INT,
sls_sales INT,
sls_price INT,
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT 
);


-- /////////////////////////////////////////
-- Creating silver CRM Source Table structure - silver_crm_prd_info
-- /////////////////////////////////////////

CREATE TABLE IF NOT EXISTS datawarehouse.silver_crm_prd_info (
prd_id INT,
cat_id VARCHAR(50),
prd_key VARCHAR(50),
prd_nm VARCHAR(50),
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE,
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT 
);


SELECT * FROM datawarehouse.silver_crm_prd_info;

-- **************************************************
-- Creating silver ERP Source Table structure - silver_erp_cust_az12
-- **************************************************

CREATE TABLE IF NOT EXISTS datawarehouse.silver_erp_cust_az12 (
cid VARCHAR (50),
bdate DATE,
gen VARCHAR(50),
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT
);

-- **************************************************
-- Creating silver ERP Source Table structure - silver_erp_LOC_A101
-- **************************************************

CREATE TABLE datawarehouse.silver_erp_loc_a101 (
cid VARCHAR (50),
cntry VARCHAR (50),
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT
);

-- **************************************************
-- Creating silver ERP Source Table structure - silver_erp_px_cat_g1v2
-- **************************************************
CREATE TABLE datawarehouse.silver_erp_px_cat_g1v2 (
id VARCHAR (50),
cat VARCHAR (50),
subcat VARCHAR (50),
maintenance VARCHAR (3),
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT
);
