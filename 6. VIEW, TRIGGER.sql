
use practice

-- VIEW
create view vw_test 
AS
select * from test;

select * from vw_test

drop view vw_test

-- index
select * from test
create index idx_test on test(srno,name) -- columns which are used in filter
drop index idx_test on test

-- trigger

create trigger trg_test 
ON test
AFTER INSERT
AS
BEGIN
insert into test1(name,age) values('Leena', 30)
END

insert into test(name,age) values('Komal', 31)
select * from test
select * from test1

drop trigger trg_test 












