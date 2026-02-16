
/*===============================
Poverty Dataset
Age Dimension Table
==================================*/

CREATE TABLE gold.dim_age_group(
	age_group_id SERIAL PRIMARY KEY,
	age_group_code VARCHAR(10) NOT NULL,
	age_group_description VARCHAR(50) NOT NULL
);