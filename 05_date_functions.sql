USE db1;

-- ============================================
-- TOPIC: DATE FUNCTIONS
-- ============================================


-- Add date column.

ALTER TABLE students
ADD Date_Of_Joining DATE;


-- Q1. Update dates using CASE.

UPDATE students
SET Date_Of_Joining = CASE Student_ID
    WHEN 1 THEN '2024-12-15'
    WHEN 2 THEN '2025-06-13'
    WHEN 3 THEN '2018-02-27'
    WHEN 4 THEN '2020-04-21'
    WHEN 5 THEN '2019-08-20'
    WHEN 6 THEN '2018-10-02'
END;


-- Additional dates from your practice.

UPDATE students
SET Date_Of_Joining = '2025-06-13'
WHERE Student_ID = 2;

UPDATE students
SET Date_Of_Joining = '2018-02-27'
WHERE Student_ID = 9;

UPDATE students
SET Date_Of_Joining = '2020-02-06'
WHERE Student_ID = 15;


-- Q2. Display students who joined from 2024.

SELECT *
FROM students
WHERE Date_Of_Joining >= '2024-01-01';

-- Output:
-- 1 | Nikhil | CSE | 85.5 | Hyderabad | 2024-12-15
-- 2 | Neha   | ECE | 78.0 | Hyderabad | 2025-06-13


-- Q3. Students who joined in 2024.

SELECT *
FROM students
WHERE YEAR(Date_Of_Joining) = 2024;

-- Output:
-- 1 | Nikhil | CSE | 85.5 | Hyderabad | 2024-12-15


-- Q4. Students who joined in April.

SELECT *
FROM students
WHERE MONTH(Date_Of_Joining) = 4;

-- Output:
-- 4 | Priya | EEE | 92.0 | Bangalore | 2020-04-21


-- Alternative:

-- SELECT *
-- FROM students
-- WHERE Date_Of_Joining BETWEEN '2024-01-01' AND '2024-12-31';

-- SELECT *
-- FROM students
-- WHERE Date_Of_Joining LIKE '2024%';