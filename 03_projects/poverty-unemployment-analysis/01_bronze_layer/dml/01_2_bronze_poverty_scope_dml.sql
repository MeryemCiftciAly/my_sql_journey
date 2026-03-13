SET search_path to silver;

CREATE TABLE bronze.source_poverty_ny AS
SELECT *
FROM bronze.poverty_fact
WHERE stateabbrv = 'NY';

