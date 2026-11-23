
use practice

create table emp
(
	empid varchar(50),
	salary numeric(20,10)
)

insert into emp values(101, 23000);
insert into emp values(102, 56000);
insert into emp values(103, 12000);
insert into emp values(104, 33000);
insert into emp values(104, 33000);
insert into emp values(104, 33000);

select * from emp

select top 1* from emp where empid IN (
select top 2 empid from emp order by salary desc
) order by salary asc


-- drop table emp


--delete md      
select *
from (      
select *,row_number () over(partition by empid, salary 
order by empid desc ) rnum      
from emp       
) md where rnum>1 

select * from 
(
select *, ROW_NUMBER() over(partition by empid, salary
order by salary desc) rnum from emp
) t where rnum>1


select * from 
(
select *, ROW_NUMBER() over(partition by empid, salary order by salary desc)
rnum from emp
)t
where rnum > 1



create table employee
(
  emp_code int,
  emp_name varchar(15),
  emp_salary numeric(20,4)
)

insert into employee VALUES
(101,'bhagyac',23000),(102,'raj',45000),(103,'kk',12000),(104,'kajal',34000)
select * from employee

select * FROM
(
  select emp_code, emp_name, emp_salary,
  row_number()
  over(ORDER BY emp_salary dESC)rno
  from employee
)t1
where t1.rno = 3


drop table Employee;

create table Employee (
  EmpId INT,
  Name VARCHAR(50),
  Department VARCHAR(50),
  Salary INT
);

select * from Employee;

insert into Employee values(1, 'Sonali', 'JAVA', 500000.00);
insert into Employee values(2, 'Kumar', 'FPGA', 600000.00);
insert into Employee values(3, 'Monya', 'JAVA', 700000.00);
insert into Employee values(4, 'Harshita', 'Testing', 800000.00);
insert into Employee values(5, 'Suraj', 'DevOPS', 900000.00);
insert into Employee values(6, 'Dhiraj', 'App Support', 1000000.00);
insert into Employee values(7, 'Priyanka', 'Admin', 1100000.00);
insert into Employee values(8, 'Moni', 'Medical', 1200000.00);


update Employee set Salary = 1200000.00 where EmpId = 7;


SELECT Salary FROM (

	SELECT *, ROW_NUMBER() OVER (ORDER BY Salary DESC) as rnk
	FROM Employee

) t
where t.rnk = 1;


SELECT * FROM (

	SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) as rnk
	FROM Employee

) t
where t.rnk = 1;


SELECT * FROM (

	SELECT *, RANK() OVER (ORDER BY Salary DESC) as rnk
	FROM Employee

) t
where t.rnk = 2;


select EmpId, name, Department from (

	select *, RANK() OVER (partition by department order by salary desc) as rnk
	from Employee
) t

where t.rnk = 1;


SELECT
    EmpID,
    Department,
    Salary,
    LAG(Salary) OVER (
        ORDER BY EmpID
    ) AS PreviousSalary,

    Salary - LAG(Salary) OVER (
        ORDER BY EmpID
    ) AS SalaryDifference

FROM Employee;









