USE db1;

-- ============================================
-- TOPIC: INDEXES
-- ============================================

-- Index:
-- An index is used to make searching/querying
-- data faster.


-- ============================================
-- PRIMARY INDEX
-- ============================================

-- A PRIMARY KEY automatically creates an index.
-- Example:
-- Employee_ID INT PRIMARY KEY


-- ============================================
-- SECONDARY INDEX
-- ============================================

-- Q1. Create a secondary index on Branch.

CREATE INDEX i1
ON students(Branch);


-- Q2. Display students.

SELECT *
FROM students;


-- Q3. Remove the index.

ALTER TABLE students
DROP INDEX i1;

-- Output:
-- Query OK