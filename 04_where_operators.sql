USE db1;

-- ============================================
-- TOPIC: WHERE CLAUSE AND OPERATORS
-- ============================================


-- Q1. Display even Student_ID records.

SELECT *
FROM students
WHERE Student_ID % 2 = 0;

-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 2          | Neha         | ECE    | 78.0  | Hyderabad
-- 4          | Priya        | EEE    | 92.0  | Bangalore
-- 6          | Sneha        | CSE    | 78.0  | Chennai
-- 8          | Pooja        | EEE    | 92.0  | Bangalore
-- 10         | Anjali       | CSE    | 88.0  | Mumbai
-- 12         | Divya        | EEE    | 92.0  | Bangalore
-- 14         | Kavya        | CSE    | 85.5  | Delhi
-- 16         | Nisha        | ECE    | 78.0  | Bangalore
-- 18         | Meena        | CSE    | 92.0  | Bangalore
-- 20         | Swathi       | EEE    | 88.0  | Mumbai


-- Q2. Display double marks.

SELECT Student_Name, Branch, Marks * 2 AS double_marks
FROM students;

-- Output:
-- Nikhil | CSE  | 171.0
-- Neha   | ECE  | 156.0
-- Priya  | EEE  | 184.0
-- ...


-- Q3. Students with marks less than 70.

SELECT *
FROM students
WHERE Marks < 70;

-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 5          | Kiran        | MECH   | 67.5  | Hyderabad
-- 9          | Vikas        | MECH   | 67.5  | Hyderabad
-- 13         | Suresh       | MECH   | 67.5  | Hyderabad
-- 17         | Tarun        | MECH   | 67.5  | Hyderabad


-- Q4. Marks not equal to 88.

SELECT *
FROM students
WHERE Marks != 88.0;

-- Output:
-- All records except Student_ID 10, 15 and 20


-- Q5. Marks greater than 60 and CSE branch.

SELECT *
FROM students
WHERE Marks > 60
AND Branch = 'CSE';

-- Output:
-- 1  | Nikhil | CSE | 85.5 | Hyderabad
-- 6  | Sneha  | CSE | 78.0 | Chennai
-- 10 | Anjali | CSE | 88.0 | Mumbai
-- 14 | Kavya  | CSE | 85.5 | Delhi
-- 18 | Meena  | CSE | 92.0 | Bangalore


-- Q6. Student_ID 1 or 2 AND ECE.

SELECT Student_Name, Branch, Marks
FROM students
WHERE Student_ID IN (1,2)
AND Branch = 'ECE';

-- Output:
-- Empty Set
--
-- Student 1 = CSE
-- Student 2 = ECE
-- Therefore no row satisfies both conditions.


-- Q7. Marks between 40 and 70.

SELECT *
FROM students
WHERE Marks BETWEEN 40 AND 70;

-- Output:
-- 5  | Kiran  | MECH | 67.5 | Hyderabad
-- 9  | Vikas  | MECH | 67.5 | Hyderabad
-- 13 | Suresh | MECH | 67.5 | Hyderabad
-- 17 | Tarun  | MECH | 67.5 | Hyderabad


-- Q8. Branch in CSE/ECE/EEE and Location NULL.

SELECT *
FROM students
WHERE Branch IN ('CSE', 'ECE', 'EEE')
AND Location IS NULL;

-- Output:
-- Empty Set
--
-- All current records have a Location.


-- Q9. Branch NOT IN CSE/ECE.

SELECT *
FROM students
WHERE Branch NOT IN ('CSE','ECE');

-- Output:
-- 4  | Priya  | EEE  | 92.0 | Bangalore
-- 5  | Kiran  | MECH | 67.5 | Hyderabad
-- 8  | Pooja  | EEE  | 92.0 | Bangalore
-- 9  | Vikas  | MECH | 67.5 | Hyderabad
-- 12 | Divya  | EEE  | 92.0 | Bangalore
-- 13 | Suresh | MECH | 67.5 | Hyderabad
-- 17 | Tarun  | MECH | 67.5 | Hyderabad
-- 20 | Swathi | EEE  | 88.0 | Mumbai