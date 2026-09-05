USE db1;

-- Create table s4

create table s4 (
    Sid int,
    Sname varchar(20),
    branch varchar(20)
);


-- Create table s5

create table s5 (
    roll int,
    Sname varchar(20),
    marks int
);


-- Insert values into s4

insert into s4 values
(1,'A','CSE'),
(2,'B','IT'),
(3,'C','ECE'),
(4,'D','IT');


-- Insert values into s5

insert into s5 values
(15,'F',82),
(2,'H',96),
(18,'C',72),
(4,'D',79);


-- Display s4

select * from s4;

-- OUTPUT:
-- Sid   Sname   branch
-- 1     A       CSE
-- 2     B       IT
-- 3     C       ECE
-- 4     D       IT


-- Display s5

select * from s5;

-- OUTPUT:
-- roll  Sname   marks
-- 15    F       82
-- 2     H       96
-- 18    C       72
-- 4     D       79


--------------------------------------------------
-- UNION
-- Removes duplicate rows
--------------------------------------------------

select Sid, Sname from s4
union
select roll, Sname from s5;

-- OUTPUT:
-- Sid   Sname
-- 1     A
-- 2     B
-- 3     C
-- 4     D
-- 15    F
-- 2     H
-- 18    C


--------------------------------------------------
-- UNION ALL
-- Includes duplicate rows
--------------------------------------------------

select Sid, Sname from s4
union all
select roll, Sname from s5;

-- OUTPUT:
-- Sid   Sname
-- 1     A
-- 2     B
-- 3     C
-- 4     D
-- 15    F
-- 2     H
-- 18    C
-- 4     D


--------------------------------------------------
-- INTERSECT
-- Returns common rows from both queries
--------------------------------------------------

select Sid, Sname from s4
intersect
select roll, Sname from s5;

-- OUTPUT:
-- Sid   Sname
-- 4     D


--------------------------------------------------
-- EXCEPT
-- Returns rows from first query
-- which are not present in second query
--------------------------------------------------

select Sid, Sname from s4
except
select roll, Sname from s5;

-- OUTPUT:
-- Sid   Sname
-- 1     A
-- 2     B
-- 3     C