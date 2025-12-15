CREATE TABLE candy_sales (
	sale_id INTEGER PRIMARY KEY,
	flavor TEXT NOT NULL,
	neighborhood TEXT NOT NULL,
	quantity_sold INTEGER NOT NULL,
	price_per_unit DECIMAL (10, 2) NOT NULL,
	revenue DECIMAL(10, 2) GENERATED ALWAYS AS (quanity_sold * price_per_unit) STORED
 );
