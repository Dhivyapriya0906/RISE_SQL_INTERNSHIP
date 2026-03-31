-- Create Database
CREATE DATABASE HealthcareDB;
USE HealthcareDB;

------------------------------------------------
-- 1. PATIENT TABLE
------------------------------------------------
CREATE TABLE Patient(
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(100)
);

------------------------------------------------
-- 2. DOCTOR TABLE
------------------------------------------------
CREATE TABLE Doctor(
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

------------------------------------------------
-- 3. APPOINTMENT TABLE
------------------------------------------------
CREATE TABLE Appointment(
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY(patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES Doctor(doctor_id)
);

------------------------------------------------
-- 4. BILLING TABLE
------------------------------------------------
CREATE TABLE Billing(
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    bill_date DATE,
    FOREIGN KEY(patient_id) REFERENCES Patient(patient_id)
);

------------------------------------------------
-- INSERT DATA
------------------------------------------------

INSERT INTO Patient VALUES
(1,'Divya',21,'Female','9876543210','Trichy'),
(2,'Arun',22,'Male','9876543211','Chennai'),
(3,'Priya',20,'Female','9876543212','Madurai');

INSERT INTO Doctor VALUES
(101,'Dr.Ravi','Cardiologist','9999991111'),
(102,'Dr.Meena','Dermatologist','9999992222');

INSERT INTO Appointment VALUES
(201,1,101,'2026-04-01','Completed'),
(202,2,102,'2026-04-02','Pending'),
(203,3,101,'2026-04-03','Completed');

INSERT INTO Billing VALUES
(301,1,1500,'Paid','2026-04-01'),
(302,2,2000,'Unpaid','2026-04-02'),
(303,3,1000,'Paid','2026-04-03');

------------------------------------------------
-- SELECT QUERIES
------------------------------------------------

SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Billing;

------------------------------------------------
-- JOIN QUERY
------------------------------------------------

SELECT p.name AS PatientName,
       d.name AS DoctorName,
       a.appointment_date
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id;

------------------------------------------------
-- AGGREGATE QUERIES
------------------------------------------------

SELECT SUM(amount) AS TotalRevenue FROM Billing;

SELECT AVG(amount) AS AverageBill FROM Billing;

SELECT COUNT(*) AS TotalPatients FROM Patient;

------------------------------------------------
-- UPDATE QUERY
------------------------------------------------

UPDATE Billing
SET payment_status = 'Paid'
WHERE bill_id = 302;

------------------------------------------------
-- DELETE QUERY
------------------------------------------------

DELETE FROM Appointment
WHERE appointment_id = 203;

------------------------------------------------
-- VIEW
------------------------------------------------

CREATE VIEW PatientDoctorView AS
SELECT p.name, d.name AS doctor, a.appointment_date
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id;

SELECT * FROM PatientDoctorView;