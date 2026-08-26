USE db1;

-- ============================================
-- TOPIC: ORDER BY, LIMIT AND OFFSET
-- ============================================


-- Q1. Display students by marks descending.

SELECT *
FROM students
ORDER BY Marks DESC;

-- Output starts:
-- Student_ID | Student_Name | Branch | Marks
-- 4          | Priya        | EEE    | 92.0
-- 8          | Pooja        | EEE    | 92.0
-- 12         | Divya        | EEE    | 92.0
-- 18         | Meena        | CSE    | 92.0
-- 10         | Anjali       | CSE    | 88.0
-- 15         | Manoj        | ECE    | 88.0
-- 20         | Swathi       | EEE    | 88.0
-- ...


-- Q2. Third highest DISTINCT marks.

SELECT DISTINCT Marks
FROM students
ORDER BY Marks DESC
LIMIT 3 OFFSET 1;

-- Output:
-- Marks
-- 88.0
-- 85.5
-- 78.0


-- Q3. Second highest student record.

SELECT *
FROM students
ORDER BY Marks DESC
LIMIT 1 OFFSET 1;

-- Important:
-- This returns the second row after sorting.
-- Because multiple students have 92,
-- the result can be another student with 92.
--
-- If you want the second HIGHEST DISTINCT mark,
-- use the next query.


-- Q4. Second highest DISTINCT marks.

SELECT DISTINCT Marks
FROM students
ORDER BY Marks DESC
LIMIT 1 OFFSET 1;

-- Output:
-- 88.0