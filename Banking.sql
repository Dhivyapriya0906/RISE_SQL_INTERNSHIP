-- Create Database
CREATE DATABASE BankingSystem;
USE BankingSystem;

------------------------------------------------
-- 1. CUSTOMER TABLE
------------------------------------------------
CREATE TABLE Customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100)
);

------------------------------------------------
-- 2. ACCOUNT TABLE
------------------------------------------------
CREATE TABLE Account(
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

------------------------------------------------
-- 3. TRANSACTION TABLE
------------------------------------------------
CREATE TABLE Transactions(
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

------------------------------------------------
-- INSERT DATA
------------------------------------------------

INSERT INTO Customer VALUES
(1,'Divya','divya@gmail.com','9876543210','Trichy'),
(2,'Arun','arun@gmail.com','9876543211','Chennai'),
(3,'Priya','priya@gmail.com','9876543212','Madurai');

INSERT INTO Account VALUES
(101,1,'Savings',5000),
(102,2,'Current',8000),
(103,3,'Savings',12000);

INSERT INTO Transactions VALUES
(1001,101,'Deposit',2000,'2026-03-30'),
(1002,102,'Withdraw',1000,'2026-03-29'),
(1003,103,'Deposit',5000,'2026-03-28');

------------------------------------------------
-- SELECT QUERIES
------------------------------------------------

-- View all customers
SELECT * FROM Customer;

-- View all accounts
SELECT * FROM Account;

-- View all transactions
SELECT * FROM Transactions;

------------------------------------------------
-- JOIN QUERY
------------------------------------------------

SELECT c.name, a.account_id, a.balance
FROM Customer c
JOIN Account a
ON c.customer_id = a.customer_id;

------------------------------------------------
-- AGGREGATE QUERIES
------------------------------------------------

-- Total balance
SELECT SUM(balance) FROM Account;

-- Average balance
SELECT AVG(balance) FROM Account;

-- Maximum balance
SELECT MAX(balance) FROM Account;

------------------------------------------------
-- UPDATE QUERY
------------------------------------------------

UPDATE Account
SET balance = balance + 2000
WHERE account_id = 101;

------------------------------------------------
-- DELETE QUERY
------------------------------------------------

DELETE FROM Transactions
WHERE transaction_id = 1002;

------------------------------------------------
-- TRANSACTION CONTROL
------------------------------------------------

START TRANSACTION;

UPDATE Account
SET balance = balance - 500
WHERE account_id = 101;

UPDATE Account
SET balance = balance + 500
WHERE account_id = 102;

COMMIT;

------------------------------------------------
-- VIEW
------------------------------------------------

CREATE VIEW CustomerAccountView AS
SELECT c.name, a.account_id, a.balance
FROM Customer c
JOIN Account a
ON c.customer_id = a.customer_id;

SELECT * FROM CustomerAccountView;