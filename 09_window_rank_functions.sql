USE db1;

-- ============================================
-- TOPIC: WINDOW RANK FUNCTIONS
-- ============================================


-- Q1. RANK overall.

SELECT *,
       RANK() OVER (ORDER BY Marks DESC) AS r1
FROM students;

-- Important output idea:
-- Marks 92.0 -> Rank 1
-- Marks 92.0 -> Rank 1
-- Marks 92.0 -> Rank 1
-- Marks 92.0 -> Rank 1
-- Marks 88.0 -> Rank 5
-- Marks 88.0 -> Rank 5
-- ...


-- Q2. RANK within each branch.

SELECT *,
       RANK() OVER (
           PARTITION BY Branch
           ORDER BY Marks DESC
       ) AS r2
FROM students;


-- Q3. DENSE_RANK overall.

SELECT *,
       DENSE_RANK() OVER (
           ORDER BY Marks DESC
       ) AS dr1
FROM students;

-- Output rank values:
-- 92.0 -> 1
-- 88.0 -> 2
-- 85.5 -> 3
-- 78.0 -> 4
-- 67.5 -> 5


-- Q4. DENSE_RANK within each branch.

SELECT *,
       DENSE_RANK() OVER (
           PARTITION BY Branch
           ORDER BY Marks DESC
       ) AS dr2
FROM students;


-- Q5. ROW_NUMBER overall.

SELECT *,
       ROW_NUMBER() OVER (
           ORDER BY Marks DESC
       ) AS rn1
FROM students;


-- Q6. ROW_NUMBER within each branch.

SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY Branch
           ORDER BY Marks DESC
       ) AS rn2
FROM students;


-- Q7. PERCENT_RANK.

SELECT *,
       PERCENT_RANK() OVER (
           ORDER BY Marks
       ) AS pr
FROM students;

-- Formula:
-- (RANK - 1) / (Total Rows - 1)


-- Q8. Divide students into 3 groups.

SELECT *,
       NTILE(3) OVER (
           ORDER BY Marks
       ) AS n1
FROM students;


-- Q9. Divide students into 4 groups.

SELECT *,
       NTILE(4) OVER (
           ORDER BY Marks
       ) AS n1
FROM students;