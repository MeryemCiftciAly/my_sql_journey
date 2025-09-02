/*===============================================================================================================================
                                                        Create Database and Schema
Data Import Notice
-- The data was imported into the table using the MySQL import wizard due to permission restriction (PRIV error). 
-- For more details see the README.MD file

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. 
Proceed with caution and ensure you have proper backups before running this script.
==================================================================================================================================*/

-- //////////////////////////////
-- Creating and using the database
-- ///////////////////////////////

CREATE database DataWarehouse;
USE DataWarehouse;

-- /////////////////////////////////////////
-- Creating Bronze CRM Source Table structure - bronze_crm_cst_inf0
-- /////////////////////////////////////////

CREATE TABLE IF NOT EXISTS datawarehouse.bronze_crm_cst_inf0 (
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
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////


-- /////////////////////////////////////////
-- Creating Bronze CRM Source Table structure - bronze_crm_sales_details
-- /////////////////////////////////////////
CREATE TABLE datawarehouse.bronze_crm_sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id VARCHAR(50),
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT,
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT 
);

-- /////////////////////////////////////////
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////

-- /////////////////////////////////////////
-- Creating Bronze CRM Source Table structure - bronze_crm_prd_info
-- /////////////////////////////////////////

CREATE TABLE IF NOT EXISTS datawarehouse.bronze_crm_prd_info (
prd_id INT,
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

-- /////////////////////////////////////////
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////

-- **************************************************
-- Creating Bronze ERP Source Table structure - bronze_erp_cust_az12
-- **************************************************

CREATE TABLE IF NOT EXISTS datawarehouse.bronze_erp_cust_az12 (
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

-- /////////////////////////////////////////
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////

-- **************************************************
-- Creating Bronze ERP Source Table structure - bronze_erp_LOC_A101
-- **************************************************

CREATE TABLE datawarehouse.bronze_erp_loc_a101 (
cid VARCHAR (50),
cntry VARCHAR (50),
meta_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
meta_end_date TIMESTAMP DEFAULT NULL, 
meta_load_start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
meta_load_end_time TIMESTAMP DEFAULT NULL,
meta_load_status VARCHAR(20), 
meta_error_message TEXT
);

-- /////////////////////////////////////////
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////

-- **************************************************
-- Creating Bronze ERP Source Table structure - bronze_erp_px_cat_g1v2
-- **************************************************
CREATE TABLE datawarehouse.bronze_erp_px_cat_g1v2 (
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

-- /////////////////////////////////////////
-- The data was imported using the import wizard see the README.MD
-- /////////////////////////////////////////
