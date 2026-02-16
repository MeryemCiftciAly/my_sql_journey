SHOW search_path;
SET search_path to gold;
/*===============================
Poverty Dataset
County Dimension Table
==================================*/

CREATE TABLE gold.dim_county(
	county_id INTEGER NOT NULL,
	county_name TEXT NOT NULL,
	state_abbreviation TEXT NOT NULL,
	PRIMARY KEY(county_id)
);