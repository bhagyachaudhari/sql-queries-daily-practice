use practice

create table test(
	srno int,
	name varchar(10)
)

insert into test values(1, 'A');
insert into test values(2, 'B');
insert into test values(3, 'A');
insert into test values(4, 'C');

insert into test values(5,'D'),(6,'E'),(7,'C');

insert into test values(6,'EBUY'),(11,'Commercial'),(12,'COS');
insert into test values(13,'EBUY COS'),(11,'Commercial'),(14,'COS APPL');
insert into test values(201,'EBUY COS'),(202,'Commercial'),(203,'COS APPL');
insert into test values(311,'EBUY COS'),(212,'Commercial'),(262,'COS APPL');

insert into test values(401,'cat'),(403,'cab'),(405,'hit');
insert into test values(402,'hot'),(404,'hat'),(406,'black'),(406,'blue'),(406,'blob');

insert into test (srno, name) values(8, 'H')
insert into test (srno) values(9)
insert into test (srno) values(10)
select * from test

select distinct name from test
select * from test where srno = 5
select * from test where name = 'D' and srno = 5
select * from test where name = 'D' or name = 'E'

select * from test where not name = 'A'
select * from test where not srno = 7

select * from test order by srno desc
select * from test order by srno asc
select * from test order by srno 

select * from test where name IS NULL
select * from test where name IS NOT NULL

update test set name = '' where srno = 10
delete from test where srno = 6

select top 1* from test
select min(srno) from test
select max(srno) from test

select count(srno) from test
select avg(srno) from test
select sum(srno) from test

select * from test

select * from test where name like '%mm%'
select * from test where name like 'c%'
select * from test where name like '%s'
select * from test where name like '_o%'
select * from test where name like 'E__%'
select * from test where name like 'E%Y'

select * from test
select * from test where name like 'bl%'
select * from test where name like 'h_t'
select * from test where name like 'h[oa]t'
select * from test where name like 'h[^oa]t'
select * from test where name like 'h[a-j]t'

select * from test
select * from test where srno IN (4,2,1)
select * from test where srno BETWEEN 1 AND 5

select srno as ID, name as NAME from test

select * from
(
select *, row_number() over(partition by srno,name order by srno,name) rnum 
from test) t
where t.rnum >1


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

-- 2nd highest salary emp details
select top 1* from test1 where empSalary
NOT IN(
select max(empSalary) from test1)
order by empSalary desc

-- 2nd highest salary
select max(empSalary) from test1 where empSalary
NOT IN(
select max(empSalary) from test1)

-- 3rd highest salary

select top 1* from test1 where empSalary 
not in (select top 2 empSalary from test1 order by empSalary desc)
order by empSalary desc

select max(empSalary), dept from test1 group by dept
order by dept

select dept, deptCount = count(1) from test1 
group by dept
having count(1) > 1

select * from test1 a, test1 b
where a.mgrid = b.empid

drop table test
drop table test1







