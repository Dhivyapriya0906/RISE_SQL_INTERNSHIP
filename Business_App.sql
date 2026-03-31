-- Create Database
CREATE DATABASE BusinessDB;
USE BusinessDB;

------------------------------------------------
-- 1. CUSTOMER TABLE
------------------------------------------------
CREATE TABLE Customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50)
);

------------------------------------------------
-- 2. PRODUCT TABLE
------------------------------------------------
CREATE TABLE Product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

------------------------------------------------
-- 3. ORDERS TABLE
------------------------------------------------
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

------------------------------------------------
-- 4. ORDER DETAILS TABLE
------------------------------------------------
CREATE TABLE OrderDetails(
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(product_id) REFERENCES Product(product_id)
);

------------------------------------------------
-- INSERT DATA
------------------------------------------------

INSERT INTO Customer VALUES
(1,'Divya','divya@gmail.com','9876543210','Trichy'),
(2,'Arun','arun@gmail.com','9876543211','Chennai'),
(3,'Priya','priya@gmail.com','9876543212','Madurai');

INSERT INTO Product VALUES
(101,'Laptop',50000,10),
(102,'Mobile',20000,15),
(103,'Headphones',2000,30);

INSERT INTO Orders VALUES
(201,1,'2026-04-01'),
(202,2,'2026-04-02'),
(203,3,'2026-04-03');

INSERT INTO OrderDetails VALUES
(301,201,101,1),
(302,202,102,2),
(303,203,103,3);

------------------------------------------------
-- SELECT QUERIES
------------------------------------------------

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

------------------------------------------------
-- JOIN QUERY
------------------------------------------------

SELECT c.name, p.product_name, od.quantity
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Product p ON od.product_id = p.product_id;

------------------------------------------------
-- AGGREGATE QUERIES
------------------------------------------------

-- Total products
SELECT COUNT(*) FROM Product;

-- Total sales value
SELECT SUM(p.price * od.quantity) AS TotalSales
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id;

-- Average product price
SELECT AVG(price) FROM Product;

------------------------------------------------
-- UPDATE QUERY
------------------------------------------------

UPDATE Product
SET stock = stock - 1
WHERE product_id = 101;

------------------------------------------------
-- DELETE QUERY
------------------------------------------------

DELETE FROM Customer
WHERE customer_id = 3;

------------------------------------------------
-- VIEW
------------------------------------------------

CREATE VIEW OrderSummary AS
SELECT c.name, o.order_id, p.product_name, od.quantity
FROM OrderDetails od
JOIN Orders o ON od.order_id = o.order_id
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Product p ON od.product_id = p.product_id;

SELECT * FROM OrderSummary;