-- Details about the gifts purchased and their costs.

CREATE TABLE gift_list (
    gift_id INTEGER PRIMARY KEY,
    relative_name TEXT NOT NULL,
    relationship TEXT NOT NULL,
    gift_purchased TEXT NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL
);
