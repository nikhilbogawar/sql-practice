USE db1;

-- ============================================================
-- TOPIC: SUBQUERIES - ADVANCED PRACTICE
-- ============================================================


-- ============================================================
-- STUDENTS TABLE
-- ============================================================


-- ============================================================
-- Q1. Display all students who belong to the same branch
--     as Student_ID = 1.
--
-- Type: Single-row subquery
-- ============================================================

SELECT *
FROM students
WHERE Branch = (
    SELECT Branch
    FROM students
    WHERE Student_ID = 1
);

-- Student_ID 1 belongs to CSE.
--
-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 1          | Nikhil       | CSE    | 85.5  | Hyderabad
-- 6          | Sneha        | CSE    | 78.0  | Chennai
-- 10         | Anjali       | CSE    | 88.0  | Mumbai
-- 14         | Kavya        | CSE    | 85.5  | Delhi
-- 18         | Meena        | CSE    | 92.0  | Bangalore


-- ============================================================
-- Q2. Display students whose branch matches Student_ID 1
--     or Student_ID 2.
--
-- Type: Multi-row subquery
-- ============================================================

SELECT *
FROM students
WHERE Branch IN (
    SELECT Branch
    FROM students
    WHERE Student_ID = 1
       OR Student_ID = 2
);

-- Student 1 = CSE
-- Student 2 = ECE
--
-- Output:
-- All CSE and ECE students


-- ============================================================
-- Q3. Display students having the same Branch and Location
--     as Student_ID = 1.
--
-- Type: Multi-column subquery
-- ============================================================

SELECT *
FROM students
WHERE (Branch, Location) IN (
    SELECT Branch, Location
    FROM students
    WHERE Student_ID = 1
);

-- Student 1:
-- Branch = CSE
-- Location = Hyderabad
--
-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 1          | Nikhil       | CSE    | 85.5  | Hyderabad


-- ============================================================
-- Q4. Find the second highest distinct marks.
--
-- Type: Nested subquery
-- ============================================================

SELECT *
FROM students
WHERE Marks = (
    SELECT MAX(Marks)
    FROM students
    WHERE Marks < (
        SELECT MAX(Marks)
        FROM students
    )
);

-- Highest marks = 92
-- Second highest marks = 88
--
-- Output:
-- Student_ID | Student_Name | Branch | Marks | Location
-- 10         | Anjali       | CSE    | 88.0  | Mumbai
-- 15         | Manoj        | ECE    | 88.0  | Mumbai
-- 20         | Swathi       | EEE    | 88.0  | Mumbai


-- ============================================================
-- Q5. Example of correlated subquery using EXISTS.
-- ============================================================

-- Example:
--
-- SELECT *
-- FROM students
-- WHERE EXISTS (
--     SELECT Student_ID
--     FROM student2
--     WHERE student2.Student_ID = students.Student_ID
-- );
--
-- student2 must exist before running this query.


-- ============================================================
-- EMPLOYEE / DEPARTMENT SUBQUERIES
-- ============================================================


SELECT *
FROM Employee;

SELECT *
FROM Department;


-- ============================================================
-- Q6. Find employees whose salary is less than employee B.
-- ============================================================

SELECT Employee_Name
FROM Employee
WHERE Salary < (
    SELECT Salary
    FROM Employee
    WHERE Employee_Name = 'B'
);

-- B salary = 1600
--
-- Output:
-- Employee_Name
-- A
-- C
-- F
-- G
-- h
-- I


-- ============================================================
-- Q7. Find employees working in the same department as C.
-- ============================================================

SELECT Employee_Name, Dept_No
FROM Employee
WHERE Dept_No = (
    SELECT Dept_No
    FROM Employee
    WHERE Employee_Name = 'C'
);

-- C department = 30
--
-- Output:
-- Employee_Name | Dept_No
-- B             | 30
-- C             | 30
-- G             | 30


-- ============================================================
-- Q8. Find employees who joined after employee J.
-- ============================================================

SELECT Employee_Name, Date_Of_Joining
FROM Employee
WHERE Date_Of_Joining > (
    SELECT Date_Of_Joining
    FROM Employee
    WHERE Employee_Name = 'J'
);

-- J joined on 2017-07-26.
--
-- Output:
-- Employee_Name | Date_Of_Joining
-- A             | 2018-12-07
-- B             | 2018-02-18
-- D             | 2022-07-13
-- E             | 2024-01-01
-- F             | 2023-12-13
-- G             | 2020-09-05
-- h             | 2021-11-01
-- I             | 2019-06-10


-- ============================================================
-- Q9. Find all employees working in the same department as E.
-- ============================================================

SELECT *
FROM Employee
WHERE Dept_No = (
    SELECT Dept_No
    FROM Employee
    WHERE Employee_Name = 'E'
);

-- E department = 10
--
-- Output:
-- Employee_ID | Employee_Name | Branch | Marks | Dept_No
-- 105         | E             | ME     | 75    | 10
-- 109         | I             | ECE    | 38    | 10


-- ============================================================
-- Q10. Find employees having the same branch as I
--      and salary greater than 1500.
-- ============================================================

SELECT Employee_Name, Salary, Dept_No
FROM Employee
WHERE Branch = (
    SELECT Branch
    FROM Employee
    WHERE Employee_Name = 'I'
)
AND Salary > 1500;

-- I branch = ECE
--
-- Output:
-- Employee_Name | Salary | Dept_No
-- D             | 2950   | 20


-- ============================================================
-- Q11. Find employees whose salary is greater than B
--      but less than E.
-- ============================================================

SELECT *
FROM Employee
WHERE Salary > (
    SELECT Salary
    FROM Employee
    WHERE Employee_Name = 'B'
)
AND Salary < (
    SELECT Salary
    FROM Employee
    WHERE Employee_Name = 'E'
);

-- B = 1600
-- E = 2850
--
-- Output:
-- Employee_ID | Employee_Name | Salary
-- 110         | J             | 2400


-- ============================================================
-- Q12. Find employees whose annual salary is greater
--      than employee A.
-- ============================================================

SELECT Employee_ID,
       Employee_Name,
       Salary * 12 AS Annual_Salary
FROM Employee
WHERE Salary * 12 > (
    SELECT Salary * 12
    FROM Employee
    WHERE Employee_Name = 'A'
);

-- A salary = 800
-- A annual salary = 9600
--
-- Output:
-- Employee_ID | Employee_Name | Annual_Salary
-- 102         | B             | 19200
-- 103         | C             | 15000
-- 104         | D             | 35400
-- 105         | E             | 34200
-- 106         | F             | 15600
-- 107         | G             | 11400
-- 109         | I             | 13200
-- 110         | J             | 28800
-- 108         | h             | 6000
--
-- IMPORTANT:
-- Employee h has salary 500, so h is NOT included.