SHOW data_directory;

-- checking all silver schema table data
SELECT
	table_schema,
	table_name,
	column_name,
	data_type,
	ordinal_position
FROM information_schema.columns
WHERE table_schema = 'silver'
ORDER BY table_name, ordinal_position;

--checking all tables in silver schema for data
SELECT *
FROM information_schema.tables
WHERE table_schema = 'silver';


SELECT *
FROM silver.objective_dim;



SELECT *
FROM silver.sanctioned_state_dim;

SELECT *
FROM silver.sanctioning_state_dim;

SELECT *
FROM silver.success_dim;

SELECT *
FROM silver.trade_dim;
	
	
--renaming trade dimension table

ALTER TABLE silver.trade_dim
RENAME COLUMN trade_description TO trade_description_id;

