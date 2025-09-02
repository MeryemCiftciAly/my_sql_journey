-- ==============================
-- Gold Layer Customer
-- ==============================

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

-- ==============================
-- Gold Layer Product
-- ==============================
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

-- ==============================
-- Gold Sales Layer
-- ==============================
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
