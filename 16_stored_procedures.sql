USE db1;

-- ============================================
-- TOPIC: STORED PROCEDURES
-- ============================================


-- ============================================
-- PROCEDURE WITHOUT PARAMETERS
-- ============================================

-- Q1. Create a procedure that updates
-- student marks and displays the table.

DELIMITER ##

CREATE PROCEDURE p1()
BEGIN

    UPDATE students
    SET Marks = 95
    WHERE Student_ID = 1;

    SELECT *
    FROM students;

END ##

DELIMITER ;


-- Q2. Execute procedure.

CALL p1();

-- Output:
-- Student_ID 1 will have Marks = 95.0


-- Q3. Delete procedure.

DROP PROCEDURE p1;


-- ============================================
-- PROCEDURE WITH PARAMETERS
-- ============================================

-- IN  = input parameter
-- OUT = output parameter


-- Q4. Create procedure to count students
-- belonging to a particular branch.

DELIMITER $$

CREATE PROCEDURE p2(
    IN a VARCHAR(60),
    OUT b INT
)
BEGIN

    SELECT COUNT(*)
    INTO b
    FROM students
    WHERE Branch = a;

END $$

DELIMITER ;


-- Q5. Execute procedure.

CALL p2('CSE', @v);


-- Q6. Display OUT parameter.

SELECT @v;

-- Output:
-- @v
-- 5
--
-- If your current students table has 5 CSE students.


-- Q7. Delete procedure.

DROP PROCEDURE p2;