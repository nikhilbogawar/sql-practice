USE db1;

-- ============================================
-- TOPIC: LIKE AND PATTERN MATCHING
-- ============================================


-- Q1. Names ending with 'a' with one character after a.

SELECT *
FROM students
WHERE Student_Name LIKE '%a_';

-- Output:
-- Depends on case sensitivity/collation.
-- Examples matching this pattern include:
-- Kavya
-- Meena
-- Divya
-- Swathi


-- Q2. Names containing 'a' at least twice.

SELECT *
FROM students
WHERE Student_Name LIKE '%a%a%';

-- Output:
-- Anjali
-- Kavya
-- Swathi


-- Q3. Names containing exactly two 'a's.

SELECT *
FROM students
WHERE Student_Name LIKE '%a%a%'
AND Student_Name NOT LIKE '%a%a%a%';

-- Output:
-- Anjali
-- Kavya
-- Swathi


-- Q4. Branch containing underscore.

SELECT *
FROM students
WHERE Branch LIKE '%\_%';

-- Output:
-- Empty Set
--
-- None of your current Branch values contain '_'.
--
-- This query is useful when a Branch contains values such as:
-- CSE_A
-- ECE_A