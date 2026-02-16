SET search_path TO gold;

/*======================================
Poverty Dataset
Gold Layer
Fact Table
=======================================*/

CREATE TABLE gold.poverty_fact(
    poverty_fact_id       		INTEGER NOT NULL,
    county_id             		INTEGER NOT NULL,
    geography_id          		INTEGER NOT NULL,
    year_id              		INTEGER NOT NULL,
    age_group_id          		INTEGER NOT NULL,
    population_all        		INTEGER,       
    population_lower_estimate  	INTEGER, 
    population_higher_estimate 	INTEGER, 
    poverty_percentage         	NUMERIC(5,2),
    poverty_percentage_lower  	NUMERIC(5,2),
    poverty_percentage_upper   	NUMERIC(5,2),
    median_income              	NUMERIC(18,2),
    lower_income_estimate      	NUMERIC(18,2),
    upper_income_estimate      NUMERIC(18,2),
    PRIMARY KEY (poverty_fact_id)
);

CREATE INDEX idx_poverty_county_year_age
ON gold.poverty_fact (county_id, year_id, age_group_id);

COMMENT ON COLUMN gold.poverty_fact.population_all IS
'Point estimate of the overall poverty in the county for population and year';

COMMENT ON COLUMN gold.poverty_fact.population_lower_estimate IS
'Lower bound of 90% confidence interval for population estimate';
