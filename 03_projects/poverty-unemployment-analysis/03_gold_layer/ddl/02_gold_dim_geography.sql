/*===================================
Gold Geography Dimension Table
=================================*/
CREATE TABLE gold.dim_geography (
	geo_id SERIAL PRIMARY KEY,
	fips_code 	INTEGER NOT NULL,
	year_id 	INTEGER NOT NULL,
	mixed_area_label VARCHAR(100),
	urban_area_label VARCHAR(100),
	metro_area_label VARCHAR(100),
	CONSTRAINT unique_fips_year UNIQUE (fips_code, year_id)
);
