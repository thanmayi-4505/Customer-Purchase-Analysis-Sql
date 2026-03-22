-- Customer Purchase Analysis Project

-- Create database
CREATE DATABASE customer_purchase_analysis;
USE customer_purchase_analysis;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

-- Insert data
INSERT INTO customers VALUES
(1, 'Ravi', 'Hyderabad'),
(2, 'Priya', 'Chennai'),
(3, 'Amit', 'Mumbai'),
(4, 'Sara', 'Bangalore');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 'Electronics', 50000, '2024-01-10'),
(102, 2, 'Shoes', 'Fashion', 3000, '2024-01-15'),
(103, 1, 'Phone', 'Electronics', 20000, '2024-02-01'),
(104, 3, 'Watch', 'Fashion', 7000, '2024-02-05'),
(105, 4, 'Tablet', 'Electronics', 25000, '2024-03-10');

-- Total Revenue
SELECT SUM(amount) AS total_revenue FROM orders;

-- Top Customer
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Revenue by Category
SELECT category, SUM(amount) AS revenue
FROM orders
GROUP BY category;

-- Customer Purchase Details
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

-- Monthly Revenue
SELECT MONTH(order_date) AS month,
SUM(amount) AS revenue
FROM orders
GROUP BY month;