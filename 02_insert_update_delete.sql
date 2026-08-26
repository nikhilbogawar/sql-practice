USE db1;

-- ============================================
-- TOPIC: INSERT, UPDATE AND DELETE
-- ============================================


-- Q1. Insert student records.

INSERT INTO students VALUES
(1, 'Amit', 'CSE', 85.5, 'Hyderabad'),
(2, 'Neha', 'ECE', 78, 'Chennai'),
(3, 'Rahul', 'CSE', 85.5, 'Hyderabad'),
(4, 'Priya', 'EEE', 92, 'Bangalore'),
(5, 'Kiran', 'MECH', 67.5, 'Hyderabad'),
(6, 'Sneha', 'CSE', 78, 'Chennai'),
(7, 'Arjun', 'ECE', 85.5, 'Delhi'),
(8, 'Pooja', 'EEE', 92, 'Bangalore'),
(9, 'Vikas', 'MECH', 67.5, 'Hyderabad'),
(10, 'Anjali', 'CSE', 88, 'Mumbai'),
(11, 'Rohit', 'ECE', 78, 'Chennai'),
(12, 'Divya', 'EEE', 92, 'Bangalore'),
(13, 'Suresh', 'MECH', 67.5, 'Hyderabad'),
(14, 'Kavya', 'CSE', 85.5, 'Delhi'),
(15, 'Manoj', 'ECE', 88, 'Mumbai'),
(16, 'Nisha', 'EEE', 78, 'Chennai'),
(17, 'Tarun', 'MECH', 67.5, 'Hyderabad'),
(18, 'Meena', 'CSE', 92, 'Bangalore'),
(19, 'Deepak', 'ECE', 85.5, 'Delhi'),
(20, 'Swathi', 'EEE', 88, 'Mumbai');


-- Q2. Modify Marks datatype.

ALTER TABLE students
MODIFY Marks DECIMAL(5,1);


-- Q3. Update student name.

UPDATE students
SET Student_Name = 'Nikhil'
WHERE Student_ID = 1;

-- Output:
-- 1 row affected


-- Q4. Update location of student 2.

UPDATE students
SET Location = 'Hyderabad'
WHERE Student_ID = 2;

-- Output:
-- 1 row affected


-- Q5. Insert a new student.

INSERT INTO students VALUES
(21, 'Tejas', 'Pharm', 87, 'Hyderabad');


-- Q6. Delete student 21.

DELETE FROM students
WHERE Student_ID = 21;

-- Output:
-- 1 row affected


-- Q7. Delete student 3.

DELETE FROM students
WHERE Student_ID = 3;

-- Output:
-- 1 row affected


-- Q8. Change branch of student 16.

UPDATE students
SET Branch = 'ECE'
WHERE Student_ID = 16;


-- Q9. Change location of student 16.

UPDATE students
SET Location = 'Bangalore'
WHERE Student_ID = 16;


-- IMPORTANT:
-- Do NOT execute this while preparing the other topics.
--
-- DELETE FROM students
-- LIMIT 20;
--
-- This deletes all 20 remaining students.
-- Keep it commented for practice.