USE db1;

-- ============================================================
-- TOPIC: JOINS
-- ============================================================


-- ============================================================
-- TABLE CREATION
-- ============================================================

-- Q1. Create table1.

CREATE TABLE table1 (
    sid INT,
    sname VARCHAR(20),
    branch VARCHAR(20)
);


-- Q2. Create table2.

CREATE TABLE table2 (
    rollno INT,
    sname VARCHAR(20),
    score INT
);


-- ============================================================
-- INSERT DATA
-- ============================================================

INSERT INTO table1 VALUES
(1, 'A', 'cse'),
(2, 'B', 'it'),
(3, 'C', 'ece');


INSERT INTO table2 VALUES
(14, 'A', 82),
(2, 'F', 66);


-- ============================================================
-- TABLE DATA
-- ============================================================

SELECT * FROM table1;

-- Output:
-- sid | sname | branch
-- 1   | A     | cse
-- 2   | B     | it
-- 3   | C     | ece


SELECT * FROM table2;

-- Output:
-- rollno | sname | score
-- 14     | A     | 82
-- 2      | F     | 66


-- ============================================================
-- 1. CROSS JOIN
-- ============================================================

-- Q3. Display every possible combination of rows
--     from table1 and table2.

SELECT *
FROM table1
CROSS JOIN table2;

-- Output:
-- sid | sname | branch | rollno | sname | score
-- 1   | A     | cse    | 14     | A     | 82
-- 1   | A     | cse    | 2      | F     | 66
-- 2   | B     | it     | 14     | A     | 82
-- 2   | B     | it     | 2      | F     | 66
-- 3   | C     | ece    | 14     | A     | 82
-- 3   | C     | ece    | 2      | F     | 66

-- Number of rows = 3 × 2 = 6


-- ============================================================
-- 2. NATURAL JOIN
-- ============================================================

-- Q4. Perform a NATURAL JOIN between table1 and table2.

SELECT *
FROM table1
NATURAL JOIN table2;

-- Important:
-- NATURAL JOIN automatically joins columns having
-- the same column name.
--
-- Common column:
-- sname
--
-- Therefore:
-- table1.sname = table2.sname
--
-- Only 'A' matches.

-- Output:
-- sname | sid | branch | rollno | score
-- A     | 1   | cse    | 14     | 82


-- ============================================================
-- 3. INNER JOIN
-- ============================================================

-- Q5. Display matching records using INNER JOIN.

SELECT *
FROM table1
INNER JOIN table2
ON table1.sid = table2.rollno;

-- Output:
-- sid | sname | branch | rollno | sname | score
-- 2   | B     | it     | 2      | F     | 66

-- Explanation:
-- table1.sid = 2
-- table2.rollno = 2
-- Therefore this row matches.


-- ============================================================
-- 4. EQUI JOIN
-- ============================================================

-- Q6. Perform an EQUI JOIN using WHERE condition.

SELECT *
FROM table1, table2
WHERE table1.sid = table2.rollno;

-- Output:
-- sid | sname | branch | rollno | sname | score
-- 2   | B     | it     | 2      | F     | 66

-- Note:
-- EQUI JOIN uses the equality (=) operator.


-- ============================================================
-- 5. LEFT JOIN
-- ============================================================

-- Q7. Display all records from table1 and
--     matching records from table2.

SELECT *
FROM table1
LEFT JOIN table2
ON table1.sid = table2.rollno;

-- Output:
-- sid | sname | branch | rollno | sname | score
-- 1   | A     | cse    | NULL   | NULL  | NULL
-- 2   | B     | it     | 2      | F     | 66
-- 3   | C     | ece    | NULL   | NULL  | NULL

-- Explanation:
-- LEFT JOIN returns ALL rows from table1.
-- Matching rows from table2 are included.
-- If there is no match, NULL is returned.


-- ============================================================
-- 6. RIGHT JOIN
-- ============================================================

-- Q8. Display all records from table2 and
--     matching records from table1.

SELECT *
FROM table1
RIGHT JOIN table2
ON table1.sid = table2.rollno;

-- Output:
-- sid  | sname | branch | rollno | sname | score
-- NULL | NULL  | NULL   | 14     | A     | 82
-- 2    | B     | it     | 2      | F     | 66

-- Explanation:
-- RIGHT JOIN returns ALL rows from table2.
-- Matching rows from table1 are included.


-- ============================================================
-- 7. FULL OUTER JOIN
-- ============================================================

-- MySQL does not directly support FULL OUTER JOIN.
--
-- We can achieve it using:
-- LEFT JOIN
-- UNION
-- RIGHT JOIN


-- Q9. Perform FULL OUTER JOIN.

SELECT *
FROM table1
LEFT JOIN table2
ON table1.sid = table2.rollno

UNION

SELECT *
FROM table1
RIGHT JOIN table2
ON table1.sid = table2.rollno;


-- Output:
-- sid  | sname | branch | rollno | sname | score
-- 1    | A     | cse    | NULL   | NULL  | NULL
-- 2    | B     | it     | 2      | F     | 66
-- 3    | C     | ece    | NULL   | NULL  | NULL
-- NULL | NULL  | NULL   | 14     | A     | 82

-- Explanation:
-- FULL OUTER JOIN returns:
-- 1. All matching rows
-- 2. Unmatched rows from table1
-- 3. Unmatched rows from table2


-- ============================================================
-- 8. SELF JOIN
-- ============================================================

-- Q10. Perform SELF JOIN on the same table
--      based on branch.

SELECT
    a.sname AS stu_a,
    b.sname AS stu_b,
    a.branch
FROM table1 a
JOIN table1 b
ON a.branch = b.branch;


-- Output:
-- stu_a | stu_b | branch
-- A     | A     | cse
-- B     | B     | it
-- C     | C     | ece

-- Explanation:
-- SELF JOIN means joining a table with itself.
--
-- Here:
-- table1 a = first copy of table1
-- table1 b = second copy of table1
--
-- Since every branch currently occurs only once,
-- each student matches with itself.


-- ============================================================
-- SELF JOIN WITHOUT SAME ROW
-- ============================================================

-- Q11. Find students who belong to the same branch,
--      but don't compare a student with themselves.

SELECT
    a.sname AS stu_a,
    b.sname AS stu_b,
    a.branch
FROM table1 a
JOIN table1 b
ON a.branch = b.branch
AND a.sid <> b.sid;

-- Output:
-- Empty Set
--
-- Reason:
-- Every branch occurs only once in table1.


-- ============================================================
-- SELF JOIN PRACTICE DATA
-- ============================================================

-- To understand SELF JOIN better, add another student
-- to an existing branch.

INSERT INTO table1 VALUES
(4, 'D', 'cse');


-- Q12. Find students belonging to the same branch.

SELECT
    a.sname AS stu_a,
    b.sname AS stu_b,
    a.branch
FROM table1 a
JOIN table1 b
ON a.branch = b.branch
AND a.sid <> b.sid;

-- Output:
-- stu_a | stu_b | branch
-- A     | D     | cse
-- D     | A     | cse

-- Note:
-- A-D and D-A are both returned because this is
-- a normal self join.


-- ============================================================
-- SELF JOIN - UNIQUE PAIRS
-- ============================================================

-- Q13. Display each same-branch pair only once.

SELECT
    a.sname AS stu_a,
    b.sname AS stu_b,
    a.branch
FROM table1 a
JOIN table1 b
ON a.branch = b.branch
AND a.sid < b.sid;

-- Output:
-- stu_a | stu_b | branch
-- A     | D     | cse

-- Explanation:
-- Using a.sid < b.sid prevents:
-- A-D
-- D-A
--
-- Only one pair is displayed.


-- ============================================================
-- 9. JOIN WITH SELECTED COLUMNS
-- ============================================================

-- Q14. Display only student name, branch and score
--      for matching records.

SELECT
    table1.sname,
    table1.branch,
    table2.score
FROM table1
INNER JOIN table2
ON table1.sid = table2.rollno;

-- Output:
-- sname | branch | score
-- B     | it     | 66


-- ============================================================
-- 10. JOIN USING ALIASES
-- ============================================================

-- Q15. Use aliases instead of full table names.

SELECT
    t1.sid,
    t1.sname,
    t1.branch,
    t2.rollno,
    t2.score
FROM table1 t1
INNER JOIN table2 t2
ON t1.sid = t2.rollno;

-- Output:
-- sid | sname | branch | rollno | score
-- 2   | B     | it     | 2      | 66


-- ============================================================
-- 11. LEFT JOIN - FIND NON-MATCHING RECORDS
-- ============================================================

-- Q16. Find students from table1 who don't have
--      a matching record in table2.

SELECT *
FROM table1
LEFT JOIN table2
ON table1.sid = table2.rollno
WHERE table2.rollno IS NULL;

-- Output:
-- sid | sname | branch | rollno | sname | score
-- 1   | A     | cse    | NULL   | NULL  | NULL
-- 3   | C     | ece    | NULL   | NULL  | NULL
-- 4   | D     | cse    | NULL   | NULL  | NULL


-- ============================================================
-- 12. RIGHT JOIN - FIND NON-MATCHING RECORDS
-- ============================================================

-- Q17. Find records from table2 that don't have
--      a matching record in table1.

SELECT *
FROM table1
RIGHT JOIN table2
ON table1.sid = table2.rollno
WHERE table1.sid IS NULL;

-- Output:
-- sid  | sname | branch | rollno | sname | score
-- NULL | NULL  | NULL   | 14     | A     | 82


-- ============================================================
-- END OF JOINS
-- ============================================================