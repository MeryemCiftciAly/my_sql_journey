--practice session 9-19-2025 --Customers dataset

SELECT current_database(),

--Checking tables in schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public';

SELECT * FROM customers;

-- Updating table ddl (see note)
ALTER TABLE customers DROP CONSTRAINT fk_customers_employees;

--- Inserting customer data into the customer table
INSERT INTO customers
(customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit, customerlocation)
VALUES
(100,'Atelier Graphique','Schmitt','Carine','40.32.2555','54 Rue Royale',NULL,'Nantes',NULL,'44000','France',1370,21000,POINT(47.2168424,-1.5567445)),
(101,'Signal Gift Stores','King','Jean','702-555-1838','8489 Strong St',NULL,'Las Vegas','NV','83030','USA',1166,71800,POINT(36.114646,-115.172816)),
(102,'Australian Collectors','Ferguson','Peter','03-5555-1234','636 St Kilda Road',NULL,'Melbourne','VIC','3004','Australia',1611,117300,POINT(-37.8675,144.9721)),
(103,'La Rochelle Gifts','Durand','Sophie','05.46.55.22.11','12 Place du Palais',NULL,'La Rochelle',NULL,'17000','France',1370,45000,POINT(46.1591,-1.1526)),
(104,'London Souvenirs','Smith','John','020-7946-0958','221B Baker St',NULL,'London',NULL,'NW1 6XE','UK',1504,52000,POINT(51.5237,-0.1585)),
(105,'Tokyo Crafts','Tanaka','Hiroshi','03-1234-5678','5-2-1 Ginza',NULL,'Tokyo',NULL,'104-0061','Japan',1601,34000,POINT(35.6719,139.7650)),
(106,'Berlin Art Supplies','Müller','Anna','030-123456','Friedrichstrasse 50',NULL,'Berlin',NULL,'10117','Germany',1499,62000,POINT(52.5200,13.4049)),
(107,'Madrid Decor','Gonzalez','Lucia','91-555-9876','Calle Mayor 23',NULL,'Madrid',NULL,'28013','Spain',1520,47000,POINT(40.4168,-3.7038)),
(108,'Rome Gifts','Rossi','Marco','06-555-1234','Via del Corso 10',NULL,'Rome',NULL,'00186','Italy',1515,58000,POINT(41.9028,12.4964)),
(109,'New York Crafts','Johnson','Emily','212-555-7890','123 Broadway',NULL,'New York','NY','10001','USA',1166,75000,POINT(40.7128,-74.0060)),
(110,'Paris Artisans','Dupont','Claire','01-2345-6789','45 Rue de Rivoli',NULL,'Paris',NULL,'75001','France',1370,68000,POINT(48.8566,2.3522)),
(149,'Toronto Gifts','Brown','Michael','416-555-3344','88 King St W',NULL,'Toronto','ON','M5H 1A1','Canada',1180,54000,POINT(43.6532,-79.3832));


--Viewing inserted dataset
SELECT * FROM customers
LIMIT 10;