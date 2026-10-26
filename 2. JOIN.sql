
use practice

create table Orders1 (
OrderID	int, 
CustomerID int,	
EmployeeID int,	
OrderDate date,
ShipperID int
)

insert into Orders1 values('10308',	2,7,	'1996-09-18',	3);
insert into Orders1 values('10309',	37,	3,	'1996-09-19',	1);
insert into Orders1 values('10310',	77,	8,	'1996-09-20',	2);

create table Customers1 (
CustomerID	int,
CustomerName varchar(50),	
ContactName	varchar(50),	
Address	varchar(50),	
City	varchar(50),	
PostalCode varchar(50),		
Country varchar(50)
)


insert into Customers1 values(1,   'Alfreds Futterkiste',	'Maria Anders',	'Obere Str. 57',	'Berlin', '12209',	'Germany')
insert into Customers1 values(2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico')
insert into Customers1 values(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico')

select * from Orders1
select * from Customers1

select * from Orders1 o INNER JOIN Customers1 c on o.CustomerID = c.CustomerID		-- INNER JOIN
select * from Orders1 o LEFT JOIN Customers1 c on o.CustomerID = c.CustomerID		-- LEFT OUTER JOIN
select * from Orders1 o RIGHT JOIN Customers1 c on o.CustomerID = c.CustomerID		-- RIGHT OUTER JOIN
select * from Orders1 o FULL JOIN Customers1 c on o.CustomerID = c.CustomerID		-- FULL OUTER JOIN

-- CROSS JOIN

SELECT o.OrderDate, c.CustomerName
FROM Orders1 o
CROSS JOIN Customers1 c;


-- SELECT * FROM Orders1 NATURAL JOIN Customers1;



-- SELF JOIN

select * from Customers1 c1 JOIN Customers1 c2 ON c1.CustomerID = c2.CustomerID


-- USING

/*SELECT c.CustomerName, o.OrderDate
FROM Customers1 c
INNER JOIN Orders1 o USING (CustomerID);*/


drop table Orders1
drop table Customers1
