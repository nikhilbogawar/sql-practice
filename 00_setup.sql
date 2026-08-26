-- ============================================
-- 00_setup.sql
-- RESET / SETUP DATABASE
-- ============================================

DROP DATABASE IF EXISTS db1;

CREATE DATABASE db1;

USE db1;

CREATE TABLE students (
    Student_ID INT,
    Student_Name VARCHAR(50),
    Branch VARCHAR(20),
    Marks DECIMAL(5,1),
    Location VARCHAR(20)
);

INSERT INTO students VALUES
(1, 'Amit', 'CSE', 85.5, 'Hyderabad'),
(2, 'Neha', 'ECE', 78, 'Chennai'),
(3, 'Rahul', 'CSE', 85.5, 'Hyderabad'),
(4, 'Priya', 'EEE', 92, 'Bangalore'),
(5, 'Kiran', 'MECH', 67.5, 'Hyderabad'),
(6, 'Sneha', 'CSE', 78, 'Chennai'),
(7, 'Arjun', 'ECE', 85.5, 'Delhi'),
(8, 'Pooja', 'EEE', 92, 'Bangalore'),
(9, 'Vikas', 'MECH', 67.5, 'Hyderabad'),
(10, 'Anjali', 'CSE', 88, 'Mumbai'),
(11, 'Rohit', 'ECE', 78, 'Chennai'),
(12, 'Divya', 'EEE', 92, 'Bangalore'),
(13, 'Suresh', 'MECH', 67.5, 'Hyderabad'),
(14, 'Kavya', 'CSE', 85.5, 'Delhi'),
(15, 'Manoj', 'ECE', 88, 'Mumbai'),
(16, 'Nisha', 'EEE', 78, 'Chennai'),
(17, 'Tarun', 'MECH', 67.5, 'Hyderabad'),
(18, 'Meena', 'CSE', 92, 'Bangalore'),
(19, 'Deepak', 'ECE', 85.5, 'Delhi'),
(20, 'Swathi', 'EEE', 88, 'Mumbai');

SELECT * FROM students;