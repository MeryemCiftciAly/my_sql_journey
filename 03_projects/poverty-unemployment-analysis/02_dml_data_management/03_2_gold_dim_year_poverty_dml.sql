SHOW search_path;
SET search_path to gold;
/*===============================
Poverty Dataset
Year Dimension Table
==================================*/

CREATE TABLE gold.dim_year_poverty(
	year_id INTEGER NOT NULL,
	year INTEGER NOT NULL,
	PRIMARY KEY (year_id)
);