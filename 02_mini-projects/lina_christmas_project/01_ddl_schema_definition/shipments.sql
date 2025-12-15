-- Tracks the delivery status and logistics of the gifts.

CREATE TABLE shipments (
    shipment_id INTEGER PRIMARY KEY,
    gift_id INTEGER NOT NULL,
    country TEXT NOT NULL,               -- US, Canada, Jamaica, Brazil
    shipping_cost DECIMAL(10, 2) NOT NULL,
    delivery_status TEXT NOT NULL,       -- On Time, Delayed, In Transit
    expected_delivery_date TEXT NOT NULL, -- Target date: 2024-12-24
    actual_delivery_date TEXT,           -- YYYY-MM-DD format (NULL if In Transit/Delayed)
    FOREIGN KEY (gift_id) REFERENCES GiftList(gift_id)
);
