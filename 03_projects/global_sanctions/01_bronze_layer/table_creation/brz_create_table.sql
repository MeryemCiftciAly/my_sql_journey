--Creating table in bronze schema

CREATE TABLE bronze.staging_sanction_raw (
case_id INT,
sanctioned_state TEXT,
sanctioning_state TEXT,
begin_date DATE,
end_date DATE,
trade INT,
descr_trade TEXT,
arms INT,
military INT,
financial INT,
travel INT,
other INT,
target_mult INT,
sender_mult INT,
objective TEXT,
success TEXT
);

-- Inserting data into bronze schema table
COPY bronze.staging_sanction_raw FROM 'C:/Users/Admin/Documents/PostgreData/meryem/sanctions/GSDB_V4_Update.csv' CSV HEADER;

--checking the data in the table
SELECT * FROM bronze.staging_sanction_raw
LIMIT 5;