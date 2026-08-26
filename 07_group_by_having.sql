USE db1;

-- ============================================
-- TOPIC: GROUP BY AND HAVING
-- ============================================


-- Q1. Highest marks in each branch.

SELECT Branch, MAX(Marks) AS highest
FROM students
GROUP BY Branch
HAVING MAX(Marks);

-- Output:
-- Branch | highest
-- CSE    | 92.0
-- ECE    | 88.0
-- EEE    | 92.0
-- MECH   | 67.5


-- Q2. Number of students in each branch.

SELECT Branch, COUNT(Branch) AS no_of_students
FROM students
GROUP BY Branch;

-- Output:
-- Branch | no_of_students
-- CSE    | 5
-- ECE    | 5
-- EEE    | 3
-- MECH   | 4


-- Q3. Locations having more than 2 students.

SELECT Location, COUNT(Location) AS no_of_loc
FROM students
GROUP BY Location
HAVING COUNT(Location) > 2;

-- Output:
-- Location  | no_of_loc
-- Hyderabad | 6
-- Chennai   | 3
-- Bangalore | 5
-- Delhi     | 3
-- Mumbai    | 3


-- Q4. Count different branches.

SELECT COUNT(DISTINCT Branch) AS Total_Different_Branches
FROM students;

-- Output:
-- Total_Different_Branches
-- 4


-- Q5. Branch-wise students joined in 2025.

SELECT Branch, COUNT(*) AS Students_Joined
FROM students
WHERE YEAR(Date_Of_Joining) = 2025
GROUP BY Branch;

-- Output:
-- Branch | Students_Joined
-- ECE    | 1


-- Q6. Average marks by branch.

SELECT Branch, AVG(Marks) AS average_marks
FROM students
WHERE Marks >= 35
GROUP BY Branch
HAVING AVG(Marks) >= 60
ORDER BY average_marks DESC;

-- Output:
-- Branch | average_marks
-- EEE    | 90.6667
-- CSE    | 85.8
-- ECE    | 82.9
-- MECH   | 67.5


-- Q7. Students joining in May, June or July.

SELECT Branch, YEAR(Date_Of_Joining), COUNT(*) AS student_count
FROM students
WHERE MONTH(Date_Of_Joining) IN (5,6,7)
GROUP BY Branch, YEAR(Date_Of_Joining)
ORDER BY student_count DESC;

-- Output:
-- Branch | YEAR | student_count
-- ECE    | 2025 | 1


-- Q8. CSE percentage.

SELECT AVG(
    CASE
        WHEN Branch = 'CSE' THEN 1
        ELSE 0
    END
) * 100 AS CSE_Percentage
FROM students;

-- Output:
-- CSE_Percentage
-- 26.3158
--
-- There are 5 CSE students out of 19.