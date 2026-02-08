
/*==========================================================================
Laborforce Dataset - Bronze Layer
Project Scope Table Creation: New York laborforce Data
Purpose: Extract all New York data from the bronze layer
--==========================================================================*/

SET search_path TO bronze;

CREATE TABLE bronze.source_laborforce_ny AS
SELECT *
FROM bronze.laborforce_fact
WHERE stateabbrv = 'NY';

