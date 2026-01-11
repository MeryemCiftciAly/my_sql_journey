INSERT INTO bookstore(book_id, title, author, published_date, price, genre, discount_price,isbn)
VALUES
(1, 'Adventure in the American Garden', 'Meryem Ciftci', '2025-03-07', 10.99, 'Coloring', NULL, '9798326755506'),
(2, 'Adam the Gardener Apple', 'Meryem Citcti', '2025-03-07', 6.99, 'Fiction', NULL, '9798327218253'),
(3, 'A Journey Through Poetry', 'Meryem Ciftci','2025-03-07', 14.99, 'Fiction', NULL, '9798332346569'),
(4, 'Python Basics', 'Jobe Amptu', '2025-01-15', 29.99, 'Programming', 23.44,'Unknown'),
(5, 'Sci-Fi Adventures South', 'KG. Smith', '2022-08-01', 22.50, 'Sci-Fi', NULL,'Unknown'),
(6, 'Life Lessons', 'Peter Pan', NULL, 27.99,'Autobiography', 15.65, 'Unkown'),
(7, 'Fantasy Realm', 'L. Pearce', '2017-03-22', 20.15, 'Fiction', 12.99, '423821474759'),
(8, 'Maple Pancakes Rocks', 'Beavy Crocker', NULL, 5.99, 'Cook Book', NULL, '3691244751036'),
(9, 'Laughing Makes Sense', 'Meryem Ciftci', '2025-09-22', 15.22, 'Non-Fiction', 2.15, 'Unkown'),
(10,'Broke the Rules','Turbi.P', NULL, 18.32, 'Non-Fiction', NULL, 'Unknown');

--Checking table data
SELECT * FROM bookstore;