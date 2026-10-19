--Initial inspection
SELECT current_catalog(), current_schema();

--Verify the project schema exists
SHOW SCHEMAS IN workspace;

--Inspect the tables in the schema
SHOW TABLES IN workspace.restaurant_db;
