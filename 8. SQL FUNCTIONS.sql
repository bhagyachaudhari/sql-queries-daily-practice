use practice;

-- String Functions

select UPPER('java');
select LOWER('JAVA');
SELECT LEN('Bhagyashri');
select TRIM(' Java ');
select LTRIM(' Java');
select RTRIM('Java ');
select CONCAT('A', 'B');
select CONCAT('bhagyac@', 'example.com');
select REPLACE('bhagyashri', 'shri', 'c');
select SUBSTRING('Bhagyashri',1,6);

--FORMAT() is slow because it uses the .NET CLR.
--For large datasets, prefer CONVERT():

select FORMAT(GETDATE(), 'yyyy-MM-dd')
SELECT CONVERT(VARCHAR(10), GETDATE(), 23); -- yyyy-MM-dd


-- Numeric Functions

select ABS(-100);
select CEILING(12.99);
select round(12.98, 0);
select floor(12.80);
select POWER(2,3);
select SQRT(25);

-- Date and Time Functions

select GETDATE();
select CURRENT_TIMESTAMP;
select SYSDATETIME();

select YEAR(getdate());
select MONTH(getdate());
select DAY(getdate());

select DATEADD(DAY, 7, GETDATE())
select DATEADD(MONTH, 2, GETDATE())
select DATEADD(YEAR, 2, GETDATE())

SELECT DATEDIFF(DAY, '2026-01-31', GETDATE());
SELECT DATEDIFF(MONTH, '2026-01-31', GETDATE());


select dateadd(year, 1, '2017/05/10')
select dateadd(year, 2, getdate())
select dateadd(MONTH, 2, getdate())

select datediff(year, '2009/10/15',getdate())

select DATENAME(YEAR, GETDATE())
select DATENAME(MONTH, GETDATE())
select DATENAME(DAY, GETDATE())

select DATEpart(DAY, GETDATE())

select GETUTCDATE()

select ISDATE('2010-10-10')
select ISDATE('2010')
select ISDATE('aaaa')


-- NULL Handling Functions

SELECT COALESCE(NULL, 1, 2, 'W3Schools.com'); -- Returns first non-NULL value
select NULLIF(4,4) -- Returns NULL if two values match
select ISNULL(null, 5);



-- Conversion Functions

select cast(675.87 as int);
select cast('2021-05-21' as smalldatetime);
select convert(int, 25.65);
select cast('A' as varchar(20))
SELECT CAST(GETDATE() AS DATE);
SELECT CAST(GETDATE() AS TIME);


-- OTHER

select iif(10>50,'YES','NO')
select ISNUMERIC(10)
select ISNUMERIC('anc')
select CURRENT_USER
select SESSION_USER
select CHARINDEX('t', 'table')
select CHARINDEX('t', 'stabte')

select 'bhagyac@'+'example.com'
select DATALENGTH('bhagyashri  ')
SELECT DATALENGTH('2017-08');
select LEFT('Bhagyashri', 6);


-- User Defined Functions

create function getData(
@bid varchar(10)
)
returns int AS
begin
	declare @bStatus int;
	set @bStatus = 1;
	return @bStatus;
end

select dbo.getData(101);
drop function dbo.getData



create function calculateSum(@num1 int, @num2 int)
returns int as
begin
	declare @sum int;
	set @sum = @num1 + @num2;
	return @sum;
end

select dbo.calculateSum(4,5)
drop function dbo.calculateSum




















