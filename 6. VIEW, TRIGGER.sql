
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



-- VIEW

create view vw_Orders as select * from orders;
select * from vw_Orders;

create index idx_orders ON orders(orderid);

exec sp_help orders;


-- trigger

create trigger trg_orders
on orders
after insert 
as
begin
	insert into orders values(11, 1, getdate());
end


insert into orders values(12, 2, getdate());
select * from orders;









