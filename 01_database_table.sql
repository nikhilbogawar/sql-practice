USE db1;

-- ============================================
-- TOPIC: DATABASE AND TABLE
-- ============================================


-- Q1. Create a database named db1.

CREATE DATABASE db1;


-- Q2. Select the database.

USE db1;


-- Q3. Create students table.

CREATE TABLE students (
    Student_ID INT,
    Student_Name VARCHAR(50),
    Branch VARCHAR(20),
    Marks FLOAT,
    Location VARCHAR(20)
);


-- Q4. Display all tables.

SHOW TABLES;

-- Output:
-- students


-- Q5. Display all databases.

SHOW DATABASES;

-- Output:
-- information_schema
-- db1
-- mysql
-- performance_schema
-- sys


-- Q6. Display all records from students.

SELECT * FROM students;

-- Output:
-- Empty Set
-- (because data has not been inserted yet)