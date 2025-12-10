
CREATE TABLE IF NOT EXISTS offices
(
    officecode character varying(10) NOT NULL,
    city character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50),
    state character varying(50),
    country character varying(50) NOT NULL,
    postalcode character varying(15) NOT NULL,
    territory character varying(10) NOT NULL,
    officelocation point NOT NULL,
    CONSTRAINT offices_pkey PRIMARY KEY (officecode)
)
