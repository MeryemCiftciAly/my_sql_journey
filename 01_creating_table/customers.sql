--This was a practice dataset I created to practice using SELECT in SQL

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    age INT,
    income INT,
    signup_date DATE
);

INSERT INTO customers (customer_id, first_name, last_name, email, country, age, income, signup_date)
VALUES
(1, 'Sara', 'Lee', 'sara.lee@gmail.com', 'United States', 28, 58000, '2023-01-15'),
(2, 'Omar', 'Khan', 'omar.khan@hotmail.com', 'Canada', 35, 72000, '2023-02-10'),
(3, 'Priya', 'Patel', 'priya.patel@yahoo.com', 'India', 31, 51000, '2023-03-05'),
(4, 'John', 'Smith', 'john.smith@gmail.com', 'United States', 42, 86000, '2023-03-22'),
(5, 'Amina', 'Yusuf', 'amina.yusuf@gmail.com', 'Kenya', 26, 48000, '2023-04-12'),
(6, 'Lucas', 'Brown', 'lucas.brown@gmail.com', 'Australia', 30, 64000, '2023-05-01'),
(7, 'Fatima', 'Zahra', 'fatima.zahra@outlook.com', 'Morocco', 37, 75000, '2023-06-08'),
(8, 'Daniel', 'Cho', 'daniel.cho@protonmail.com', 'South Korea', 29, 60000, '2023-06-19'),
(9, 'Maria', 'Garcia', 'maria.garcia@gmail.com', 'Mexico', 33, 69000, '2023-07-04'),
(10, 'Kwame', 'Mensah', 'kwame.mensah@gmail.com', 'Ghana', 40, 82000, '2023-07-14');
