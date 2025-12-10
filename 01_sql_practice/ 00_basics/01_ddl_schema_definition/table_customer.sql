-- Creating customer table

CREATE TABLE IF NOT EXISTS customers (
customernumber INTEGER PRIMARY KEY,
customername VARCHAR(50) NOT NULL,
contactlastname VARCHAR(50) NOT NULL,
contactfirstname VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressline1 VARCHAR(50) NOT NULL,
addressline2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalcode VARCHAR(50) NULL DEFAULT NULL,
country VARCHAR(50) NOT NULL,
salesrepemployeenumber INTEGER,
creditlimit NUMERIC(12,2),
customerlocation POINT NOT NULL,
CONSTRAINT fk_customers_employees
	FOREIGN KEY (salesrepemployeenumber)
	REFERENCES employees (employeenumber)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION

);

CREATE INDEX fk_customers_employees_idx 
	ON 	customers (salesrepemployeenumber);

-- checking the schema for all the tables

SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public';
