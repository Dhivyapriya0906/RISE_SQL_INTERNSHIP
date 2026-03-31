show databases;
create database ECOMMERCE;
use ECOMMERCE;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT,
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount INT,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO users VALUES (1, 'Dhivya', 'dhivya@gmail.com', '1234');
INSERT INTO users VALUES (2, 'Priya', 'priya@gmail.com', '4567');
INSERT INTO users VALUES (3, 'Prabha', 'prabha@gmail.com', '8695');
INSERT INTO users VALUES (4, 'Rashmi', 'rashmi@gmail.com', '9842');
INSERT INTO users VALUES (5, 'Siva', 'sivaa@gmail.com', '4321');
SELECT * FROM users;
INSERT INTO products VALUES (1, 'Lipstick', 250, 10);
INSERT INTO products VALUES (2, 'Kajal', 100, 15);
INSERT INTO products VALUES (3, 'moisturizer', 250, 10);
INSERT INTO products VALUES (4, 'Sunscreen', 300, 20);
INSERT INTO products VALUES (5, 'Serum', 100, 15);
SELECT * FROM products;
INSERT INTO orders VALUES (101, 1, 1, 2, '2026-03-19');
INSERT INTO orders VALUES(102, 2, 2, 1, '2026-03-19');
SELECT * FROM orders;
INSERT INTO payments VALUES (201, 101, 500, 'UPI');
INSERT INTO payments VALUES (202, 102, 300, 'Card');
INSERT INTO payments VALUES (203, 101, 500, 'Cash');
INSERT INTO payments VALUES (204, 102, 300, 'Net Banking');
INSERT INTO payments VALUES (205, 101, 500, 'UPI');
SELECT * FROM payments;
SELECT users.name, products.product_name, orders.quantity fROM orders  JOIN users ON users.user_id = orders.user_id JOIN products ON products.product_id = orders.product_id;
