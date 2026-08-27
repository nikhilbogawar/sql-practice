USE db1;

-- ============================================
-- TOPIC: AUTO_INCREMENT
-- ============================================

-- AUTO_INCREMENT automatically generates
-- the next numeric ID.


-- Q1. Create table using AUTO_INCREMENT.

CREATE TABLE stu (
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50),
    branch VARCHAR(20)
);


-- Q2. Insert records.

INSERT INTO stu
VALUES
(1, 'Nikhil', 'CSE'),
(NULL, 'Arjun', 'Cyber');


-- Q3. Display records.

SELECT *
FROM stu;

-- Output:
-- sid | sname  | branch
-- 1   | Nikhil | CSE
-- 2   | Arjun  | Cyber
--
-- NULL automatically becomes 2.


-- Another way:
-- We can completely omit sid.

INSERT INTO stu (sname, branch)
VALUES ('Rahul', 'ECE');


SELECT *
FROM stu;

-- Output:
-- sid | sname  | branch
-- 1   | Nikhil | CSE
-- 2   | Arjun  | Cyber
-- 3   | Rahul  | ECE