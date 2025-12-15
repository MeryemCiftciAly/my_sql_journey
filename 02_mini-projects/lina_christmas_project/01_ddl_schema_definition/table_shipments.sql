-- Tracks the delivery status and logistics of the gifts.

CREATE TABLE shipments (
    shipment_id INTEGER PRIMARY KEY,
    gift_id INTEGER NOT NULL,
    country TEXT NOT NULL,              
    shipping_cost DECIMAL(10, 2) NOT NULL,
    delivery_status TEXT NOT NULL,    
    expected_delivery_date TEXT NOT NULL,
    actual_delivery_date TEXT, 
    FOREIGN KEY (gift_id) REFERENCES gift_list (gift_id)
);
