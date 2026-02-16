SHOW search_path;
SET search_path to gold;
/*===============================
Poverty Dataset
Geography Dimension Table
==================================*/

CREATE TABLE IF NOT EXISTS gold.dim_geography_poverty
(
    geography_id integer NOT NULL,
    geography_name text  NOT NULL,
    PRIMARY KEY (geography_id)
)