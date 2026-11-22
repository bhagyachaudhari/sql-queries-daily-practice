
use practice

create table human (
	name varchar(50),
	age int
)

select * from human;

insert into human values('bhagyac', '34');
insert into human values('Priya', '26');

-- Stored procedure

create procedure getdetails @country varchar(50)
AS
BEGIN 
SET NOCOUNT ON
declare @name varchar(50) = 'Bhagyac';
declare @age int;

set @age = 30;
PRINT 'Hello : '+@name+' Your age is: '+cast(@age as varchar);
PRINT 'Bye : '+@country;

declare cur_test CURSOR for
select name, age from human

OPEN cur_test
FETCH NEXT FROM cur_test into @name, @age

WHILE @@FETCH_STATUS = 0 
BEGIN

PRINT 'Your name: '+@name+' and Age is: '+cast(@age as varchar);
FETCH NEXT FROM cur_test into @name, @age
END

CLOSE cur_test
DEALLOCATE cur_test

END
GO

exec getdetails 'INDIA' 

drop procedure getdetails;


create procedure getData @bid varchar(5), @bname varchar(50)
AS
set nocount on
begin tran
begin
declare @error int;
declare @sum int;
select * from human;
set @error = @error + @@ERROR;
if(@error = 0)
BEGIN
	COMMIT TRAN
END
else
BEGIN
	ROLLBACK TRAN
END
end

drop procedure getData;
