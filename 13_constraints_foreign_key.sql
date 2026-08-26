USE db1;

-- ============================================
-- TOPIC: CONSTRAINTS AND FOREIGN KEY
-- ============================================


-- ============================================
-- DEPARTMENT TABLE
-- ============================================

CREATE TABLE department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(30)
);


-- Insert department records.

INSERT INTO department VALUES
(10, 'Support role', 'Banglore'),
(20, 'Developer', 'Hyderabad'),
(30, 'Testing', 'Mumbai'),
(40, 'Hr', 'Delhi');


-- Display departments.

SELECT * FROM department;

-- Output:
-- Department_ID | Department_Name | Location
-- 10            | Support role     | Banglore
-- 20            | Developer        | Hyderabad
-- 30            | Testing          | Mumbai
-- 40            | Hr               | Delhi


-- ============================================
-- EMPLOYEE TABLE
-- ============================================

CREATE TABLE Employee (
    Employee_ID INT,
    Employee_Name VARCHAR(50),
    Branch VARCHAR(20),
    Marks INT,
    Date_Of_Joining DATE,
    MGRid INT,
    Salary INT,
    Dept_No INT,

    CONSTRAINT fk2
    FOREIGN KEY (Dept_No)
    REFERENCES department(Department_ID)
);


-- Insert employees.

INSERT INTO Employee VALUES
(101, 'A', 'ECE', 60, '2018-12-07', 109, 800, 20),
(102, 'B', 'CIVIL', 75, '2018-02-18', 104, 1600, 30),
(103, 'C', 'CSE', 50, '2017-04-17', 105, 1250, 30),
(104, 'D', 'ECE', 80, '2022-07-13', 109, 2950, 20),
(105, 'E', 'ME', 75, '2024-01-01', 107, 2850, 10),
(106, 'F', 'CSE', 95, '2023-12-13', NULL, 1300, 20),
(107, 'G', 'CIVIL', 67, '2020-09-05', 102, 950, 30),
(108, 'h', 'CSE', 25, '2021-11-01', 104, 500, 20),
(109, 'I', 'ECE', 38, '2019-06-10', 105, 1100, 10),
(110, 'J', 'EEE', 48, '2017-07-26', 102, 2400, NULL);


-- Add primary key.

ALTER TABLE Employee
ADD PRIMARY KEY (Employee_ID);


-- Display employees.

SELECT * FROM Employee;

-- Output:
-- Employee_ID | Employee_Name | Branch | Marks | Date_Of_Joining | MGRid | Salary | Dept_No
-- 101         | A             | ECE    | 60    | 2018-12-07      | 109   | 800    | 20
-- 102         | B             | CIVIL  | 75    | 2018-02-18      | 104   | 1600   | 30
-- 103         | C             | CSE    | 50    | 2017-04-17      | 105   | 1250   | 30
-- 104         | D             | ECE    | 80    | 2022-07-13      | 109   | 2950   | 20
-- 105         | E             | ME     | 75    | 2024-01-01      | 107   | 2850   | 10
-- 106         | F             | CSE    | 95    | 2023-12-13      | NULL  | 1300   | 20
-- 107         | G             | CIVIL  | 67    | 2020-09-05      | 102   | 950    | 30
-- 108         | h             | CSE    | 25    | 2021-11-01      | 104   | 500    | 20
-- 109         | I             | ECE    | 38    | 2019-06-10      | 105   | 1100   | 10
-- 110         | J             | EEE    | 48    | 2017-07-26      | 102   | 2400   | NULL


-- ============================================
-- PRODUCTS TABLE
-- ============================================

CREATE TABLE products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(20),
    Price FLOAT
);


INSERT INTO products VALUES
(1, 'Tv', 35000),
(2, 'Watch', 1400),
(3, 'Ac', 27000);


SELECT * FROM products;

-- Output:
-- Product_ID | Product_Name | Price
-- 1          | Tv           | 35000
-- 2          | Watch        | 1400
-- 3          | Ac           | 27000


-- ============================================
-- CUSTOMERS TABLE
-- ============================================

CREATE TABLE customers (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Pro_ID INT,
    Rating FLOAT,

    CONSTRAINT fk1
    FOREIGN KEY (Pro_ID)
    REFERENCES products(Product_ID)
);


INSERT INTO customers VALUES
(15, 'A', 2, 4.2),
(16, 'B', 3, 3.9),
(17, 'C', 2, 4.1),
(18, 'D', 3, 4.1),
(19, 'E', 3, 4.0);


SELECT * FROM customers;

-- Output:
-- Customer_ID | Customer_Name | Pro_ID | Rating
-- 15          | A             | 2      | 4.2
-- 16          | B             | 3      | 3.9
-- 17          | C             | 2      | 4.1
-- 18          | D             | 3      | 4.1
-- 19          | E             | 3      | 4.0