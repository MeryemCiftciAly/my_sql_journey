-- =======================================================================================
-- Gold Layer Data Quality & Integrity Checks
-- 1. Validate referential integrity by checking for missing customer/product keys.  
-- 2. Identify duplicate customer IDs that may cause data inconsistencies.  
-- 3. Ensure proper data integration by prioritizing CRM gender data when available.  
-- 4. Verify that tables can be correctly joined for accurate reporting.  
-- =======================================================================================

-- Checking for null customer and product keys from different tables
SELECT *
FROM datawarehouse.gold_facts_sales AS f
LEFT JOIN datawarehouse.gold_dim_customers AS c
ON c.customer_key = f.product_key
LEFT JOIN datawarehouse.gold_dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL

  
-- identify duplicate cust_id values
SELECT cust_id, COUNT(*) 
	FROM (Select 
		ci.cust_id, 
		ci.cust_key, 
		ci.cust_firstname, 
		ci.cust_lastname, 
		ci.cst_marital_status, 
		ci.cst_gndr, 
		ci.cst_create_date,
		ca.bdate,
		ca.gen,
		la.cntry
	From datawarehouse.silver_crm_cst_inf0 as ci
	LEFT JOIN datawarehouse.silver_erp_cust_az12 as ca
	ON ci.cust_key = ca.cid
	LEFT JOIN datawarehouse.silver_erp_loc_a101 as la
	ON ci.cust_key =la.cid)t
    GROUP BY cust_id
    HAVING COUNT(*) > 1;
    
     
     -- =======================================================================================
    -- Data integration
    -- The CASE statement ensures that ci.cst_gndr (CRM data) is prioritized if it's not 'n/a'
	-- If ci.cst_gndr is 'n/a', it falls back to ca.gen, or 'n/a' if both are null
    -- ==========================================================================================
Select DISTINCT
		ci.cst_gndr, 
		ca.gen,
        CASE WHEN  ci.cst_gndr != 'n/a' THEN  ci.cst_gndr -- CRM is the Master for the gender data
	ELSE COALESCE(ca.gen, 'n/a')
end as new_gen
	From datawarehouse.silver_crm_cst_inf0 as ci
	LEFT JOIN datawarehouse.silver_erp_cust_az12 as ca
	ON ci.cust_key = ca.cid
	LEFT JOIN datawarehouse.silver_erp_loc_a101 as la
	ON ci.cust_key =la.cid
    GROUP BY ci.cst_gndr, ca.gen;
