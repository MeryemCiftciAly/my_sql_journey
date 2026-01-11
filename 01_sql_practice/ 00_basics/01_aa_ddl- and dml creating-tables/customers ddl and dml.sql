-- Creating the customers table
CREATE TABLE IF NOT EXISTS "Customers" (
  "customerNumber" INT PRIMARY KEY,
  "customerName" VARCHAR(50) NOT NULL,
  "contactLastName" VARCHAR(50) NOT NULL,
  "contactFirstName" VARCHAR(50) NOT NULL,
  "phone" VARCHAR(50) NOT NULL,
  "addressLine1" VARCHAR(50) NOT NULL,
  "addressLine2" VARCHAR(50) NULL,
  "city" VARCHAR(50) NOT NULL,
  "state" VARCHAR(50) NULL,
  "postalCode" VARCHAR(15) NULL,
  "country" VARCHAR(50) NOT NULL,
  "salesRepEmployeeNumber" INT NULL,
  "creditLimit" DOUBLE PRECISION NULL,
  -- NOTE: The 'POINT' type typically requires the PostGIS extension in PostgreSQL.
  "customerLocation" POINT NOT NULL,
  CONSTRAINT "fk_Customers_Employees"
    FOREIGN KEY ("salesRepEmployeeNumber")
    REFERENCES "Employees" ("employeeNumber")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX "fk_Customers_Employees_idx" ON "Customers" ("salesRepEmployeeNumber");

