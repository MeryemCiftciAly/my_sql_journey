

USE datawarehouse;

-- Checking if silver layer has product number with space
SELECT prd_nm
FROM datawarehouse.silver_crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Checking for duplicate data if there are duplicate customer IDs
SELECT cust_id,
COUNT(*)
FROM datawarehouse.silver_crm_cst_inf0
GROUP BY cust_id
HAVING COUNT(*) > 1;

-- Checking for null or negative numbers
SELECT prd_cost
FROM datawarehouse.silver_crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- ======================================================================================
-- Checks for invalid start date structure
-- The date checks id the start date is greater than the end date
-- The date checks if the sales order date is greater than the ship or delivery date
-- The date checks if the order date is in the future or in the past
-- =======================================================================================

SELECT * FROM datawarehouse.silver_crm_prd_info
WHERE prd_start_dt > prd_end_dt;

SELECT * FROM datawarehouse.silver_crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt;

SELECT
NULLIF(sls_order_dt, 0) sls_order_dt
FROM datawarehouse.silver_crm_sales_details
WHERE sls_order_dt <= 0
OR LENGTH(sls_order_dt)!= 8
OR sls_order_dt > 20500101
OR sls_order_dt > 19000101;

-- Checking monetary value structure
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM datawarehouse.silver_crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- Handling low cardinality data
SELECT DISTINCT
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN ('Female')
     WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN ('Male')
ELSE 'n/a'
END gen
FROM datawarehouse.bronze_erp_cust_az12;

SELECT 
CASE WHEN TRIM(cntry) = 'DE' THEN 'GERMANY'
     WHEN TRIM(cntry) IN ('US', 'USA') THEN  'United States'
     WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
ELSE TRIM(cntry)
END AS cntry
FROM datawarehouse.bronze_erp_cust_az212;

-- Separating product ID
SELECT
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LENGTH(cid))
     ELSE cid
END cid,
bdate,
gen
FROM datawarehouse.bronze_erp_cust_az12
WHERE bdate < '1920-01-01' OR bdate > NOW();

-- Checking the prouct key length
SELECT prd_key, LENGTH(prd_key)
FROM datawarehouse.silver_crm_prd_info
ORDER BY LENGTH(prd_key) DESC
LIMIT 10;

-- Checking the ID between the silver and bronze layer
SELECT
id, 
cat, 
subcat, 
maintenance
FROM datawarehouse.bronze_erp_px_cat_g1v2 WHERE id NOT IN 
(SELECT cat_id FROM datawarehouse.silver_crm_prd_info);
-- returns one ID that is not in the silver layer

-- Fixing overlapping date in the dataset
SELECT
prd_id,
prd_key,
prd_nm,
prd_start_dt,
prd_end_dt,
LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) - INTERVAL 1 DAY AS prd_end_dt
FROM datawarehouse.bronze_crm_prd_info
WHERE prd_key IN ('AC-HE-HL-U509-R', 'AC-HE-HL-U509');
