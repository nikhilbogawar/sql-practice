USE db1;

-- ============================================================
-- TOPIC: FUNCTIONS
-- ============================================================


-- ============================================================
-- Q1. Create a function to check whether a number is prime.
-- ============================================================

DELIMITER ##

CREATE FUNCTION f1(a INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE b INT;

    IF a <= 1 THEN
        RETURN 'not a prime number';
    END IF;

    SET b = 2;

    WHILE b * b <= a
    DO
        IF a % b = 0 THEN
            RETURN 'not a prime number';
        END IF;

        SET b = b + 1;
    END WHILE;

    RETURN 'prime number';
END ##

DELIMITER ;


-- ============================================================
-- Q2. Check whether 13 is prime.
-- ============================================================

SELECT f1(13) AS Result;

-- Output:
-- Result
-- prime number


-- ============================================================
-- Q3. Check whether 15 is prime.
-- ============================================================

SELECT f1(15) AS Result;

-- Output:
-- Result
-- not a prime number


-- ============================================================
-- Q4. Check whether 1 is prime.
-- ============================================================

SELECT f1(1) AS Result;

-- Output:
-- Result
-- not a prime number


-- ============================================================
-- Q5. Check whether 2 is prime.
-- ============================================================

SELECT f1(2) AS Result;

-- Output:
-- Result
-- prime number


-- ============================================================
-- Q6. Drop the function.
-- ============================================================

DROP FUNCTION f1;