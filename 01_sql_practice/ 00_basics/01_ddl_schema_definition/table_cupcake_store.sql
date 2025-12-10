/*
DDL Script: Creating the initial schema for the Cupcake Store.
Purpose: Defines the table structure for inventory management.
Future Goal: To be paired with DML scripts for data insertion and basic query performance.
*/

CREATE TABLE cupcake (
    id INTEGER PRIMARY KEY,
    sku TEXT,
    cupcake_name TEXT,
    flavor TEXT,
    quantity INTEGER,
    in_stock INTEGER,
    unit_price NUMERIC
);
