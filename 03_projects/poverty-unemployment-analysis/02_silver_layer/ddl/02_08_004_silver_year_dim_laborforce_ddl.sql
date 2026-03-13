/*================================================
Laborforce Dataset - Silver Layer
Year Table
==========================================*/

CREATE TABLE silver.year_dim_laborforce(
    year INTEGER NOT NULL,
    PRIMARY KEY (year)
);

COMMENT ON TABLE silver.year_dim_laborforce
IS 'Extracted from bronze layer as lookup table for multi-table queries';
