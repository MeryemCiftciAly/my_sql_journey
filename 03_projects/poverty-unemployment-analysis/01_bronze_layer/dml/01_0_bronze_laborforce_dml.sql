--==================================================
--Loading data from CSV file into the bronze layer table
--===================================================

COPY bronze.laborforce_fact(
	fips_code,
	stateabbrv,
	county,
	attribute,
	attribute_value
)
FROM'C:/Program Files/PostgreSQL/18/data/meryem/poverty.csv'
DELIMITER ','
CSV HEADER;
