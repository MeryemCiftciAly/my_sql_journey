-- Creating a table
CREATE TABLE bookstore (
book_id INT NOT NULL,
title VARCHAR(100) NOT NULL,
author VARCHAR (100),
published_date DATE NOT NULL,
price DECIMAL(5,2),
genre VARCHAR(50),
CONSTRAINT pk_bookstore PRIMARY KEY(book_id)
)

ALTER TABLE bookstore
ALTER COLUMN author SET DEFAULT 'Unknown';

ALTER TABLE bookstore
ALTER COLUMN published_date DROP NOT NULL;

ALTER TABLE bookstore
ADD COLUMN isbn VARCHAR (20);

ALTER TABLE bookstore
ALTER COLUMN isbn SET DEFAULT 'Unknown';

ALTER TABLE bookstore
ADD discount_price DECIMAL(5,2);

/* Note: To DROP columns use the DROP COLUMN column name
   you do not have to add the constraints and data type
   example: DROP COLUMN price;
   This is places after the ALTER TABLE table name */
