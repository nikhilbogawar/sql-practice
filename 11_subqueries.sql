USE db1;

-- ============================================
-- TOPIC: SUBQUERIES
-- ============================================


-- Q1. Find the third highest marks.

SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (
               ORDER BY Marks DESC
           ) AS dr1
    FROM students
) AS t
WHERE dr1 = 3;

-- Output:
-- Students having 85.5 marks
--
-- 1  | Nikhil | CSE | 85.5 | Hyderabad
-- 7  | Arjun  | ECE | 85.5 | Delhi
-- 14 | Kavya  | CSE | 85.5 | Delhi
-- 19 | Deepak | ECE | 85.5 | Delhi


-- Q2. First student from each location.

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Location
           ) AS rn2
    FROM students
) AS t2
WHERE rn2 = 1;

-- Output:
-- One student from each Location.
--
-- Note:
-- Because there is no ORDER BY inside ROW_NUMBER(),
-- which student is selected is not guaranteed.