-- Creating the table for offices
CREATE TABLE IF NOT EXISTS offices (
    officecode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressline1 VARCHAR(50) NOT NULL,
    addressline2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    poatalcode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL,
    officelocation POINT NOT NULL
),

--Inserting data into the table
INSERT INTO offices (
    officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory, officelocation
)
VALUES
('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA', POINT(37.77493, -122.419416)),
('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA', POINT(42.358431, -71.059773)),
('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA', POINT(40.714353, -74.005973)),
('4','Paris','+33 14 723 4404','43 Rue Jouffroy D''abbans',NULL,NULL,'France','75017','EMEA', POINT(48.856667, 2.350987)),
('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan', POINT(35.689488, 139.691706)),
('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2','NSW','Australia','2010','APAC', POINT(-33.859972, 151.211111)),
('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA', POINT(51.500152, -0.126236));
