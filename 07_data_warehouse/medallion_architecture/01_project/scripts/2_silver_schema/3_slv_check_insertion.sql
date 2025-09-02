-- ===================================================================
-- Stored Procedure: Silver Layer Transformation & Logging
-- See the READ ME for more details on the stored procedure
-- ===================================================================

-- Procedure Log DDL 

USE datawarehouse;

CREATE TABLE datawarehouse.procedure_logs (
log_id INT AUTO_INCREMENT PRIMARY KEY,
procedure_name VARCHAR(100),
status_message VARCHAR(255),
rows_affected INT,
execution_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
duration_seconds INT
);

-- To execute the procedure use the call code below
CALL silver_load();

-- ============================================================================

DELIMITER $$
DROP PROCEDURE IF EXISTS silver_load;

CREATE PROCEDURE silver_load()
BEGIN
    -- Declare variables
    DECLARE start_time DATETIME;
    DECLARE end_time DATETIME;
    DECLARE duration_seconds INT;
    DECLARE rows_affected INT DEFAULT 0;

    -- Start time before operation
    SET start_time = NOW();
    
-- ==========================================================================================
	-- >> 'Truncate Table Silver Customer Info'
	TRUNCATE TABLE datawarehouse.silver_crm_cst_inf0;
  	-- >> Log the truncation
	INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
	VALUES ('silver_load', 'Truncate silver_crm_cst_inf0: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
-- ============================================================================================
	-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_crm_cst_inf0 (
		cust_id,
		cust_key,
		cust_firstname,
		cust_lastname,
		cst_marital_status,
		cst_gndr,
		cst_create_date)
	SELECT 
	cust_id,
	cust_key,
	TRIM(cust_firstname) AS cust_firstname,
	TRIM(cust_lastname) AS cust_lastname,
		CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
		WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN  'Married'
		ELSE 'n/a'
	END cst_marital_status,
			CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
		WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN  'Male'
		ELSE 'n/a'
	END cst_gndr,
	cst_create_date
	FROM (
		SELECT *,
		ROW_NUMBER() OVER (PARTITION BY cust_id ORDER BY cst_create_date DESC) AS ranked_id
		FROM (
		SELECT *,
		ROW_NUMBER() OVER (PARTITION BY cust_key ORDER BY cst_create_date DESC) AS ranked_key
	FROM datawarehouse.bronze_crm_cst_inf0
	) AS i
		WHERE ranked_key IS NOT NULL AND ranked_key = 1  
		) AS k
		WHERE ranked_id IS NOT NULL AND ranked_id = 1;  
        
-- >> Log the insertion
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_crm_cst_inf0: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));

 -- =========================================================================================================================
 -- >> 'Truncate Table Silver Customer Info'
	TRUNCATE TABLE datawarehouse.silver_crm_prd_info;
    
-- Log the truncation
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Truncate silver_crm_prd_info: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
-- ============================================================================================================================
 
-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_crm_prd_info (
	prd_id,
	cat_id,
	prd_key, 
	prd_nm, 
	prd_cost, 
	prd_line, 
	prd_start_dt, 
	prd_end_dt
	)
	SELECT
	prd_id,
	REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
	SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,
	prd_nm, 
	IFNULL(prd_cost, 0) AS prd_cost,
	CASE WHEN UPPER(TRIM(prd_line))= 'M' THEN 'Mountain'
		 WHEN UPPER(TRIM(prd_line))= 'R' THEN 'Road'
		 WHEN UPPER(TRIM(prd_line))= 'S' THEN 'Other Sales'
		 WHEN UPPER(TRIM(prd_line))= 'T' THEN 'Touring'
	ELSE 'Unkown'
	END AS prd_line,
	prd_start_dt, 
	LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)- INTERVAL 1 DAY AS prd_end_dt
	FROM datawarehouse.bronze_crm_prd_info;
    
-- >> Log the insertion
 INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_crm_prd_info: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
-- ==================================================================================================================
  
-- >> 'Truncate Table Silver Sales Info'
TRUNCATE TABLE datawarehouse.silver_crm_sales_details;

-- >> Log the truncation
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Truncate silver_crm_sales_details: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));

-- =================================================================================================================
-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_crm_sales_details (
	sls_ord_num, 
	sls_prd_key, 
	sls_cust_id, 
	sls_order_dt, 
	sls_ship_dt, 
	sls_due_dt, 
	sls_sales,
	sls_quantity,
	sls_price
	)
	SELECT
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	sls_order_dt,
	sls_ship_dt, 
	sls_due_dt, 
	CASE WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != ABS(sls_quantity) * ABS(sls_price)
		THEN ABS(sls_quantity) * ABS(sls_price)
		 ELSE sls_sales
	END AS sls_sales,
	CASE WHEN sls_quantity <= 0 
		THEN ABS(sls_quantity)
		ELSE sls_quantity END AS sls_quantity,
	CASE WHEN sls_price IS NULL OR sls_price <= 0
    THEN NULLIF(ABS(sls_quantity), 0)     
        
	ELSE sls_price
	END AS sls_price
	FROM datawarehouse.bronze_crm_sales_details;

 	-- >> Log the insertion
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_crm_sales_details: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
 
 -- ==================================================================================================================
-- >> 'Truncate Table Silver erp_cust_az12'
	TRUNCATE TABLE datawarehouse.silver_erp_cust_az12;
    
 -- Log the truncation
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Truncate silver_erp_cust_az12: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));

-- ==================================================================================================================
-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_erp_cust_az12 (
	cid,
	bdate,
	gen
	)
	SELECT
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LENGTH(cid))
		 ELSE cid
	END cid, 
	CASE WHEN bdate > NOW() THEN NULL
		ELSE bdate
		END bdate,
	CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN ('Female')
		 WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN ('Male')
	ELSE 'n/a'
	END gen
	FROM datawarehouse.bronze_erp_cust_az12;
    
  -- Log the insertion
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_erp_cust_az12: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
  -- ======================================================================================================================

-- >> 'Truncate Table Silver erp_loc_a101'
	TRUNCATE TABLE datawarehouse.silver_erp_loc_a101;
    
-- >> Log the truncation

  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Truncate silver_erp_loc_a101: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
  
  -- =========================================================================================================================
	-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_erp_loc_a101(
	cid,
	cntry
	)
	SELECT
	REPLACE(cid, '-', '') cid,
	CASE WHEN TRIM(cntry) = 'DE' THEN 'GERMANY'
		 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	ELSE TRIM(cntry)
	END AS cntry
	FROM datawarehouse.bronze_erp_loc_a101;

 -- Log the insertion
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_erp_loc_a101: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
  
  -- =========================================================================================================================
  
-- >> 'Truncate Table Silver erp_px_cat_g1v2'
	TRUNCATE TABLE datawarehouse.silver_erp_px_cat_g1v2;
    
 -- Log the truncation
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Truncate silver_erp_px_cat_g1v2: successful', 0, NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
-- ========================================================================================================================
  
	-- >> Inserting the date into the Silver layer
	INSERT INTO datawarehouse.silver_erp_px_cat_g1v2(
	id, 
	cat, 
	subcat, 
	maintenance
	)
	SELECT
	id, 
	cat, 
	subcat, 
	maintenance
	FROM datawarehouse.bronze_erp_px_cat_g1v2;
    
 -- Log the insertion
  INSERT INTO procedure_logs (procedure_name, status_message, rows_affected, execution_time, duration_seconds) 
  VALUES ('silver_load', 'Insert into silver_erp_px_cat_g1v2: successful', ROW_COUNT(), NOW(), TIMESTAMPDIFF(SECOND, start_time, NOW()));
   -- ================================================================================================== 
    
		-- Insert log entry into procedure_logs
		INSERT INTO procedure_logs (
			procedure_name, status_message, rows_affected, execution_time, duration_seconds
		) VALUES (
			'silver_load', 
			'Batch loaded successfully', 
			rows_affected, 
			end_time, 
			duration_seconds
		);

END$$
DELIMITER ;
