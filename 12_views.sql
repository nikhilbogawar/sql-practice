USE db1;

-- ============================================
-- TOPIC: VIEWS
-- ============================================


-- Q1. Create a simple view.

CREATE VIEW v1 AS
SELECT Student_ID, Student_Name, Branch
FROM students;


-- Q2. Display simple view.

SELECT * FROM v1;

-- Output:
-- Student_ID | Student_Name | Branch
-- 1          | Nikhil       | CSE
-- 2          | Neha         | ECE
-- 4          | Priya        | EEE
-- ...


-- Q3. Create a complex view.

CREATE VIEW v2 AS
SELECT Branch, COUNT(*) AS student_count
FROM students
GROUP BY Branch;


-- Q4. Display complex view.

SELECT * FROM v2;

-- Output:
-- Branch | student_count
-- CSE    | 5
-- ECE    | 5
-- EEE    | 3
-- MECH   | 4