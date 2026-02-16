SHOW search_path;
SET search_path to gold;
/*===============================
Poverty Dataset
Year Dimension Table
==================================*/

CREATE TABLE IF NOT EXISTS gold.dim_year_poverty
(
    year_id integer NOT NULL,
    year integer NOT NULL,
    PRIMARY KEY (year_id)
)