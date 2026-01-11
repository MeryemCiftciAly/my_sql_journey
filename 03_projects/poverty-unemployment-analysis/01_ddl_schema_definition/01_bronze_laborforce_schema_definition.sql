--===========================================================================
--Attribut Values are stored as text. They have multiple values (percentages, count etc)
--Copying from CSV posed a challenge as a result therefore TEXT datatype used
--Silver layer will handşe standardization
--===============================================================================

CREATE TABLE bronze.poverty_fact(
	fips_code INTEGER NOT NULL,
	stateabbrv CHAR(2),
	county TEXT NOT NULL,
	attribute TEXT NOT NULL,
	attribute_value TEXT NOT NULL,
	loads_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE bronze.poverty_fact IS 'Raw source data untouched for Bronze Layer'