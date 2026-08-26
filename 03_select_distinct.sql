USE db1;

-- ============================================
-- TOPIC: SELECT AND DISTINCT
-- ============================================


-- Q1. Display all students.

SELECT * FROM students;

-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 1          | Nikhil       | CSE    | 85.5  | Hyderabad
-- 2          | Neha         | ECE    | 78.0  | Hyderabad
-- 4          | Priya        | EEE    | 92.0  | Bangalore
-- 5          | Kiran        | MECH   | 67.5  | Hyderabad
-- 6          | Sneha        | CSE    | 78.0  | Chennai
-- 7          | Arjun        | ECE    | 85.5  | Delhi
-- 8          | Pooja        | EEE    | 92.0  | Bangalore
-- 9          | Vikas        | MECH   | 67.5  | Hyderabad
-- 10         | Anjali       | CSE    | 88.0  | Mumbai
-- 11         | Rohit        | ECE    | 78.0  | Chennai
-- 12         | Divya        | EEE    | 92.0  | Bangalore
-- 13         | Suresh       | MECH   | 67.5  | Hyderabad
-- 14         | Kavya        | CSE    | 85.5  | Delhi
-- 15         | Manoj        | ECE    | 88.0  | Mumbai
-- 16         | Nisha        | ECE    | 78.0  | Bangalore
-- 17         | Tarun        | MECH   | 67.5  | Hyderabad
-- 18         | Meena        | CSE    | 92.0  | Bangalore
-- 19         | Deepak       | ECE    | 85.5  | Delhi
-- 20         | Swathi       | EEE    | 88.0  | Mumbai


-- Q2. Display distinct marks.

SELECT DISTINCT Marks
FROM students;

-- Output:
-- Marks
-- 85.5
-- 78.0
-- 92.0
-- 67.5
-- 88.0


-- Q3. Display distinct CSE records.

SELECT DISTINCT *
FROM students
WHERE Branch = 'CSE';

-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 1          | Nikhil       | CSE    | 85.5  | Hyderabad
-- 6          | Sneha        | CSE    | 78.0  | Chennai
-- 10         | Anjali       | CSE    | 88.0  | Mumbai
-- 14         | Kavya        | CSE    | 85.5  | Delhi
-- 18         | Meena        | CSE    | 92.0  | Bangalore


-- Q4. Display selected columns.

SELECT Student_Name, Branch, Marks
FROM students;

-- Output:
-- Nikhil | CSE  | 85.5
-- Neha   | ECE  | 78.0
-- Priya  | EEE  | 92.0
-- ...