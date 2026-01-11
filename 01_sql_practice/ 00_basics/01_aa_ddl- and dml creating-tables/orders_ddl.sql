CREATE TABLE IF NOT EXISTS 
(
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    order_date date,
    quantity integer,
    unit_price numeric(10,2),
    total_revenue numeric(10,2),
    book_id integer NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (order_id)

