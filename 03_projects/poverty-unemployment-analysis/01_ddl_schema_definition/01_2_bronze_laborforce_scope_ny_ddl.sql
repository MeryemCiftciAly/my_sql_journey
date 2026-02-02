SET search_path to silver;

CREATE TABLE bronze.source_laborforce_ny AS
SELECT *
FROM bronze.laborforce_fact
WHERE stateabbrv = 'NY';

