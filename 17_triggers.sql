USE db1;

-- ============================================
-- TOPIC: TRIGGERS
-- ============================================

-- A trigger automatically executes when
-- a specified event occurs on a table.


-- Q1. Add a message column.

ALTER TABLE students
ADD COLUMN msg VARCHAR(20);


-- Q2. Create BEFORE INSERT trigger.

DELIMITER %%

CREATE TRIGGER t1
BEFORE INSERT ON students
FOR EACH ROW
BEGIN

    SET NEW.msg = 'Welcome';

END %%

DELIMITER ;


-- Q3. Insert a new student.

INSERT INTO students
(Student_ID, Student_Name, Branch, Marks, Location)
VALUES
(21, 'Tejas', 'Pharm', 87, 'Hyderabad');


-- Q4. Display students.

SELECT *
FROM students;

-- Output for new record:
-- Student_ID | Student_Name | Branch | Marks | Location  | msg
-- 21         | Tejas        | Pharm  | 87.0  | Hyderabad | Welcome


-- Q5. Remove trigger.

DROP TRIGGER t1;