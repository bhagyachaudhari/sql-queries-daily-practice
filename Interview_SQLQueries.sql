
use practice


-- Find Duplicate Records

select * from test;

select * from
(
select *, row_number() over(partition by srno,name order by srno,name) rnum 
from test) t
where t.rnum >1


SELECT name, COUNT(*) AS total
FROM test
GROUP BY name
HAVING COUNT(*) > 1;


DELETE FROM test
WHERE name NOT IN (
    SELECT name
    FROM (
        SELECT MIN(name) AS name
        FROM test
        GROUP BY name
    ) t
);

-------------------------------------------------------------------------------------

create table test1(
    empId int,
    empName varchar(10),
    empSalary numeric(20,4),
    dept varchar(50),
    mgrId int,
)

insert into test1 values(1, 'AAA', 20000,'JVTC',1);
insert into test1 values(2, 'BBB', 50000,'MSTC',101);
insert into test1 values(3, 'CCC', 10000,'RPA',102);
insert into test1 values(4, 'DDD', 5000,'RTRMS',103);
insert into test1 values(5, 'Bhagyac', 24000,'JVTC',104);
insert into test1 values(6, 'Hezil', 29000,'JVTC',105);
insert into test1 values(7, 'kajal', 11000,'RPA',7);

select * from test1	

update test1 
set mgrId = 5
where empId = 7;

-- 2nd highest salary emp details

select top 1* from test1 where empSalary
NOT IN(
select max(empSalary) from test1)
order by empSalary desc

-- 2nd highest salary

select max(empSalary) from test1 where empSalary
NOT IN(
select max(empSalary) from test1)

SELECT empSalary
FROM (
    SELECT empSalary,
           DENSE_RANK() OVER (ORDER BY empSalary DESC) AS rnk
    FROM test1
) t
WHERE rnk = 2;

-- 3rd highest salary

select top 1* from test1 where empSalary 
not in (select top 2 empSalary from test1 order by empSalary desc)
order by empSalary desc

-- Find the Nth highest salary

SELECT salary
FROM (
    SELECT DISTINCT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk = 5;

-- Find employees earning more than their manager

SELECT e.empId,
       e.empName,
       e.empSalary,
       m.empName AS manager_name,
       m.empSalary AS manager_salary
FROM test1 e
JOIN test1 m
  ON e.mgrId = m.empId
WHERE e.empSalary > m.empSalary;

-- Dept wise max salaried employee

select max(empSalary), dept from test1 group by dept
order by dept;

-- Department having more than 1 employees

select dept, deptCount = count(1) from test1 
group by dept
having count(1) > 1

-- Find the Employee who is also manager

SELECT DISTINCT
       m.empId,
       m.empName
FROM test1 e
JOIN test1 m
    ON e.mgrId = m.empId;


-------------------------------------------------------------------------------------



