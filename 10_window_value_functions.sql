USE db1;

-- ============================================
-- TOPIC: WINDOW VALUE FUNCTIONS
-- ============================================


-- Q1. Previous marks.

SELECT *,
       LAG(Marks) OVER (
           ORDER BY Marks DESC
       ) AS l1
FROM students;

-- Output idea:
-- Highest marks row -> NULL
-- Next row -> previous row's marks
-- ...


-- Q2. Marks 3 rows before.

SELECT *,
       LAG(Marks, 3) OVER (
           ORDER BY Marks DESC
       ) AS l2
FROM students;


-- Q3. Next marks.

SELECT *,
       LEAD(Marks) OVER (
           ORDER BY Marks DESC
       ) AS le1
FROM students;


-- Q4. Marks 3 rows after.

SELECT *,
       LEAD(Marks, 3) OVER (
           ORDER BY Marks DESC
       ) AS le2
FROM students;


-- Q5. FIRST_VALUE without ORDER BY.

SELECT *,
       FIRST_VALUE(Marks) OVER () AS fv1
FROM students;


-- Q6. Highest marks using FIRST_VALUE.

SELECT *,
       FIRST_VALUE(Marks) OVER (
           ORDER BY Marks DESC
       ) AS fv2
FROM students;

-- Output:
-- Every row gets fv2 = 92.0


-- Q7. LAST_VALUE without ORDER BY.

SELECT *,
       LAST_VALUE(Marks) OVER () AS lv1
FROM students;


-- Q8. SECOND value.

SELECT *,
       NTH_VALUE(Marks, 2) OVER () AS n1
FROM students;