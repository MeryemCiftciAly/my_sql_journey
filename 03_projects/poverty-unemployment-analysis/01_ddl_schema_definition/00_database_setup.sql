--======================================================
--Database: labor_poverty
--Purpose: Madallion architecture for poverty and labor datasets
--========================================================

CREATE DATABASE labor_poverty;

--The database above created to house schemas and tables

CREATE SCHEMA bronze;
COMMENT ON SCHEMA bronze IS 'Raw untouched data from source CSV';

CREATE SCHEMA silver;
COMMENT ON SCHEMA silver IS 'Standardize and transformed dataset from bronze layer';

CREATE SCHEMA gold;
COMMENT ON SCHEMA gold IS 'Analytics-ready fact and dimension tables for PBI vsualization';