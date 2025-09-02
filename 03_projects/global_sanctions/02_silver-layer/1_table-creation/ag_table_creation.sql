--Creating silver schema dimension and fact tables

--Sanctioned table
CREATE TABLE silver.sanctioned_state_dim(
sanctioned_state_id Primary Key,
sanctioned_state TEXT
);

--Sanctioning table
CREATE TABLE silver.sanctioning_state_dim(
sanctioning_state_id Primary Key,
sanctioning_state TEXT
);

--Objective table
CREATE TABLE silver.objective_dim(
objective_id Primary Key,
objective TEXT
);

--Success table
CREATE TABLE silver.success_dim(
success_id Primary Key,
success TEXT
);

--Trade description
CREATE TABLE silver.trade_dim(
trade_description_id Primary Key,
descr_trade TEXT
);