/*==============================================================
Poverty Dataset - Silver layer
Year Dimension Table
Purpose: Serves as a reference table across fact and dimension tables
--===============================================================*/

CREATE TABLE silver.year_dim_poverty(
    year INTEGER NOT NULL,    
    PRIMARY KEY (year)
);

COMMENT ON TABLE silver.year_dim_poverty
IS 'Extracted from bronze layer as reference table across fact and dimension tables';