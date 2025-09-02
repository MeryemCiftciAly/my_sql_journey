-- Script for loading the raw data into the bronze layer
-- Please see the Read Me file for more details

USE datawarehouse;
LOAD DATA INFILE 'C:/Users/Admin/Documents/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE datawarehouse.bronze_crm_cst_inf0
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS; -- Skips the header row

-- Checking the table 
SELECT * FROM datawarehouse.bronze_crm_cst_inf0;

-- ====================================================================================================
-- Checking for the correct file path
SHOW VARIABLES LIKE 'secure_file_priv';
-- 'secure_file_priv', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\'
-- Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
-- ====================================================================================================

-- ====================================================================================================
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cust_info.csv'
INTO TABLE datawarehouse.bronze_crm_cst_inf0
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS; -- Skips the header row

-- Error Code: 1292. Incorrect date value: '20251006 ' for column 'cst_create_date' at row 1
-- ====================================================================================================
