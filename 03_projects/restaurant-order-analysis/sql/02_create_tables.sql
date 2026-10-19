--Creating order details table
CREATE TABLE workspace.restaurant_db.order_details (
	order_details_id SMALLINT,
	order_id SMALLINT,
	order_date DATE,
	order_time STRING,
	item_id SMALLINT
);

--Creating menu table
CREATE TABLE workspace.restaurant_db.menu_items (
	menu_item_id SMALLINT,
	item_name STRING,
	category STRING,
	price DECIMAL(5,2)
);


--Checking if both tables have items
SELECT 'menu_items' AS table_name,
    COUNT(*) AS row_count
FROM workspace.restaurant_db.menu_items

UNION ALL

SELECT 'order_details' AS table_name,
    COUNT(*) AS row_count
FROM workspace.restaurant_db.order_details;
