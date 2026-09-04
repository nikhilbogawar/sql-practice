USE db1;

-- ============================================================
-- 21_JOINS.SQL
-- ============================================================
-- Tables:
--
-- Employee
-- Eid | Ename | branch | marks | DOJ | MGRid | sal | deptno
--
-- Department
-- Did | Dname | loc
--
-- Primary Key:
-- Employee.Eid
-- Department.Did
--
-- Foreign Key:
-- Employee.deptno -> Department.Did
-- Employee.MGRid  -> Employee.Eid
-- ============================================================



-- ============================================================
-- 1. CROSS JOIN
-- ============================================================
-- CROSS JOIN returns every possible combination.
-- 4 Departments x 10 Employees = 40 rows.

SELECT *
FROM Department
CROSS JOIN Employee;

-- OUTPUT:
-- Did | Dname        | loc      | Eid | Ename | branch | marks | DOJ        | MGRid | sal  | deptno
-- ----------------------------------------------------------------------------------------------------
-- 10  | Support role | Banglore | 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20
-- 10  | Support role | Banglore | 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30
-- 10  | Support role | Banglore | 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30
-- 10  | Support role | Banglore | 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20
-- 10  | Support role | Banglore | 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10
-- 10  | Support role | Banglore | 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20
-- 10  | Support role | Banglore | 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30
-- 10  | Support role | Banglore | 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20
-- 10  | Support role | Banglore | 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10
-- 10  | Support role | Banglore | 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL
--
-- 20  | Developer    | Hyderabad| 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20
-- 20  | Developer    | Hyderabad| 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30
-- 20  | Developer    | Hyderabad| 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30
-- 20  | Developer    | Hyderabad| 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20
-- 20  | Developer    | Hyderabad| 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10
-- 20  | Developer    | Hyderabad| 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20
-- 20  | Developer    | Hyderabad| 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30
-- 20  | Developer    | Hyderabad| 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20
-- 20  | Developer    | Hyderabad| 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10
-- 20  | Developer    | Hyderabad| 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL
--
-- 30  | Testing      | Mumbai   | 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20
-- 30  | Testing      | Mumbai   | 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30
-- 30  | Testing      | Mumbai   | 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30
-- 30  | Testing      | Mumbai   | 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20
-- 30  | Testing      | Mumbai   | 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10
-- 30  | Testing      | Mumbai   | 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20
-- 30  | Testing      | Mumbai   | 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30
-- 30  | Testing      | Mumbai   | 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20
-- 30  | Testing      | Mumbai   | 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10
-- 30  | Testing      | Mumbai   | 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL
--
-- 40  | Hr           | Delhi    | 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20
-- 40  | Hr           | Delhi    | 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30
-- 40  | Hr           | Delhi    | 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30
-- 40  | Hr           | Delhi    | 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20
-- 40  | Hr           | Delhi    | 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10
-- 40  | Hr           | Delhi    | 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20
-- 40  | Hr           | Delhi    | 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30
-- 40  | Hr           | Delhi    | 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20
-- 40  | Hr           | Delhi    | 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10
-- 40  | Hr           | Delhi    | 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL
--
-- TOTAL ROWS = 40



-- ============================================================
-- 2. NATURAL JOIN
-- ============================================================
-- NATURAL JOIN joins columns having the same name.
--
-- Here Department and Employee have NO column with the
-- same name:
--
-- Department: Did, Dname, loc
-- Employee:   Eid, Ename, branch, marks, DOJ, MGRid, sal, deptno
--
-- Therefore MySQL treats this like a CROSS JOIN.
-- Result = 40 rows.

SELECT *
FROM Department
NATURAL JOIN Employee;

-- OUTPUT:
-- Same 40 rows as Query 1.
--
-- TOTAL ROWS = 40



-- ============================================================
-- 3. INNER JOIN
-- ============================================================
-- Match:
-- Employee.deptno = Department.Did
--
-- Only matching departments are returned.
-- J has deptno = NULL, so J is NOT returned.

SELECT *
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno;

-- OUTPUT:
-- Eid | Ename | branch | marks | DOJ        | MGRid | sal  | deptno | Did | Dname        | loc
-- ---------------------------------------------------------------------------------------------
-- 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20     | 20  | Developer    | Hyderabad
-- 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30     | 30  | Testing      | Mumbai
-- 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30     | 30  | Testing      | Mumbai
-- 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20     | 20  | Developer    | Hyderabad
-- 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10     | 10  | Support role | Banglore
-- 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20     | 20  | Developer    | Hyderabad
-- 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30     | 30  | Testing      | Mumbai
-- 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20     | 20  | Developer    | Hyderabad
-- 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10     | 10  | Support role | Banglore
--
-- TOTAL ROWS = 9



-- ============================================================
-- 4. INNER JOIN - SELECTED COLUMNS
-- ============================================================

SELECT
    Ename,
    deptno,
    Dname
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno;

-- OUTPUT:
-- Ename | deptno | Dname
-- -------------------------
-- A     | 20     | Developer
-- B     | 30     | Testing
-- C     | 30     | Testing
-- D     | 20     | Developer
-- E     | 10     | Support role
-- F     | 20     | Developer
-- G     | 30     | Testing
-- H     | 20     | Developer
-- I     | 10     | Support role



-- ============================================================
-- 5. INNER JOIN - SALARY + DEPARTMENT + LOCATION
-- ============================================================

SELECT
    Ename,
    sal,
    Dname,
    loc
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno;

-- OUTPUT:
-- Ename | sal  | Dname        | loc
-- -----------------------------------
-- A     | 800  | Developer    | Hyderabad
-- B     | 1600 | Testing      | Mumbai
-- C     | 1250 | Testing      | Mumbai
-- D     | 2950 | Developer    | Hyderabad
-- E     | 2850 | Support role | Banglore
-- F     | 1300 | Developer    | Hyderabad
-- G     | 950  | Testing      | Mumbai
-- H     | 500  | Developer    | Hyderabad
-- I     | 1100 | Support role | Banglore



-- ============================================================
-- 6. INNER JOIN + WHERE
-- Employees earning more than 1000
-- ============================================================

SELECT
    Ename,
    Dname
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno
WHERE sal > 1000;

-- OUTPUT:
-- Ename | Dname
-- ----------------
-- B     | Testing
-- C     | Testing
-- D     | Developer
-- E     | Support role
-- F     | Developer
-- I     | Support role
--
-- TOTAL ROWS = 6



-- ============================================================
-- 7. INNER JOIN + YEAR() + IN
-- Employees who joined in 2018, 2019 or 2020
-- ============================================================
-- NOTE:
-- Your original query had 208.
-- That should be 2018.

SELECT
    Ename,
    DOJ,
    sal,
    Dname
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno
WHERE YEAR(DOJ) IN (2018, 2019, 2020);

-- OUTPUT:
-- Ename | DOJ        | sal  | Dname
-- -----------------------------------
-- A     | 2018-12-07 | 800  | Developer
-- B     | 2018-02-18 | 1600 | Testing
-- G     | 2020-09-05 | 950  | Testing
-- I     | 2019-06-10 | 1100 | Support role
--
-- TOTAL ROWS = 4



-- ============================================================
-- 8. INNER JOIN + AND + IN + ORDER BY
-- Marks > 50
-- Branch must be ECE, CIVIL, CSE or ME
-- Sorted by marks descending
-- ============================================================

SELECT
    Ename,
    branch,
    marks,
    Dname
FROM Employee
INNER JOIN Department
    ON Department.Did = Employee.deptno
WHERE marks > 50
  AND branch IN ('ECE', 'CIVIL', 'CSE', 'ME')
ORDER BY marks DESC;

-- OUTPUT:
-- Ename | branch | marks | Dname
-- -------------------------------
-- F     | CSE    | 95    | Developer
-- D     | ECE    | 80    | Developer
-- B     | CIVIL  | 75    | Testing
-- E     | ME     | 75    | Support role
-- G     | CIVIL  | 67    | Testing
-- A     | ECE    | 60    | Developer
--
-- NOTE:
-- C has marks = 50, so C is NOT included.
--
-- TOTAL ROWS = 6



-- ============================================================
-- 9. INNER JOIN + GROUP BY + HAVING
-- Departments having at least 2 employees
-- whose salary is greater than 1000
-- ============================================================

SELECT
    Dname,
    COUNT(*) AS No_of_emp
FROM Employee
INNER JOIN Department
    ON Employee.deptno = Department.Did
WHERE sal > 1000
GROUP BY Dname
HAVING COUNT(*) >= 2;

-- OUTPUT:
-- Dname        | No_of_emp
-- -------------------------
-- Developer    | 2
-- Support role | 2
-- Testing      | 2



-- ============================================================
-- 10. LEFT JOIN
-- ============================================================
-- LEFT JOIN returns ALL employees.
-- If no matching department exists, Department columns = NULL.
--
-- J has deptno = NULL, so J is still returned.

SELECT *
FROM Employee
LEFT JOIN Department
    ON Employee.deptno = Department.Did;

-- OUTPUT:
-- Eid | Ename | branch | marks | DOJ        | MGRid | sal  | deptno | Did  | Dname        | loc
-- -----------------------------------------------------------------------------------------------
-- 101 | A     | ECE    | 60    | 2018-12-07 | 109   | 800  | 20     | 20   | Developer    | Hyderabad
-- 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30     | 30   | Testing      | Mumbai
-- 103 | C     | CSE    | 50    | 2017-04-17 | 105   | 1250 | 30     | 30   | Testing      | Mumbai
-- 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20     | 20   | Developer    | Hyderabad
-- 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10     | 10   | Support role | Banglore
-- 106 | F     | CSE    | 95    | 2023-12-13 | NULL  | 1300 | 20     | 20   | Developer    | Hyderabad
-- 107 | G     | CIVIL  | 67    | 2020-09-05 | 102   | 950  | 30     | 30   | Testing      | Mumbai
-- 108 | H     | CSE    | 25    | 2021-11-01 | 104   | 500  | 20     | 20   | Developer    | Hyderabad
-- 109 | I     | ECE    | 38    | 2019-06-10 | 105   | 1100 | 10     | 10   | Support role | Banglore
-- 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL   | NULL | NULL         | NULL
--
-- TOTAL ROWS = 10



-- ============================================================
-- 11. LEFT JOIN + WHERE + ORDER BY
-- Employees earning more than 1500
-- ============================================================

SELECT *
FROM Employee
LEFT JOIN Department
    ON Employee.deptno = Department.Did
WHERE sal > 1500
ORDER BY sal DESC;

-- OUTPUT:
-- Eid | Ename | branch | marks | DOJ        | MGRid | sal  | deptno | Did  | Dname        | loc
-- -----------------------------------------------------------------------------------------------
-- 104 | D     | ECE    | 80    | 2022-07-13 | 109   | 2950 | 20     | 20   | Developer    | Hyderabad
-- 105 | E     | ME     | 75    | 2024-01-01 | 107   | 2850 | 10     | 10   | Support role | Banglore
-- 110 | J     | EEE    | 46    | 2017-07-26 | 102   | 2400 | NULL   | NULL | NULL         | NULL
-- 102 | B     | CIVIL  | 75    | 2018-02-18 | 104   | 1600 | 30     | 30   | Testing      | Mumbai
--
-- TOTAL ROWS = 4



-- ============================================================
-- 12. SELF JOIN
-- Employee + Manager
-- ============================================================
-- e = Employee
-- m = Manager
--
-- e.MGRid = m.Eid

SELECT
    e.*,
    m.*
FROM Employee e, Employee m
WHERE e.MGRid = m.Eid;

-- OUTPUT:
-- Employee | Manager
-- -------------------
-- A        | I
-- B        | D
-- C        | E
-- D        | I
-- E        | G
-- G        | B
-- H        | D
-- I        | E
-- J        | B
--
-- F is NOT included because F.MGRid = NULL.
--
-- TOTAL ROWS = 9



-- ============================================================
-- 13. SELF JOIN
-- Employee Name + Manager Name
-- ============================================================

SELECT
    e.Ename AS Emp,
    m.Ename AS Manager
FROM Employee e, Employee m
WHERE e.MGRid = m.Eid;

-- OUTPUT:
-- Emp | Manager
-- --------------
-- A   | I
-- B   | D
-- C   | E
-- D   | I
-- E   | G
-- G   | B
-- H   | D
-- I   | E
-- J   | B



-- ============================================================
-- 14. SELF JOIN + ORDER BY MANAGER SALARY
-- ============================================================

SELECT
    e.*,
    m.*
FROM Employee e, Employee m
WHERE e.MGRid = m.Eid
ORDER BY m.sal DESC;

-- OUTPUT:
-- Employee | Manager | Manager Salary
-- -------------------------------------
-- B        | D       | 2950
-- H        | D       | 2950
-- C        | E       | 2850
-- I        | E       | 2850
-- G        | B       | 1600
-- J        | B       | 1600
-- A        | I       | 1100
-- D        | I       | 1100
-- E        | G       | 950
--
-- TOTAL ROWS = 9



-- ============================================================
-- IMPORTANT JOIN SUMMARY
-- ============================================================
--
-- CROSS JOIN:
-- Every row of Table 1 × every row of Table 2
-- 4 × 10 = 40 rows
--
-- NATURAL JOIN:
-- Joins using columns having the same name.
-- Here there are no common column names,
-- so result = 40 rows.
--
-- INNER JOIN:
-- Only matching rows.
-- Result = 9 employees.
--
-- LEFT JOIN:
-- Every employee is retained.
-- Result = 10 employees.
--
-- SELF JOIN:
-- Employee table is joined with itself
-- to find employee-manager relationships.
-- Result = 9 employees because F has MGRid = NULL.
--
-- ============================================================
-- FOREIGN KEY RELATIONSHIPS
-- ============================================================
--
-- Employee.deptno
--       |
--       v
-- Department.Did
--
-- Employee.MGRid
--       |
--       v
-- Employee.Eid
--
-- ============================================================