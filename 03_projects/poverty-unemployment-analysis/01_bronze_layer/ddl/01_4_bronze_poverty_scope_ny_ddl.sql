
/*==========================================================================
 Poverty Dataset - Bronze Layer
Project Scope Table Creation: New York Poverty Data
Extract all New York data from the bronze layer
--==========================================================================*/

CREATE TABLE bronze.bronze_source_poverty_ny 
SELECT *
FROM bronze.poverty_fact
WHERE stateabbrv = 'NY';

