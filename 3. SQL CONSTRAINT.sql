
use practice

create table student(
	srno int identity(1,1) NOT NULL,
	name varchar(10) NOT NULL,
	age int NOT NULL,
	delind varchar NOT NULL DEFAULT 'Y'
	CONSTRAINT uc_name UNIQUE(name),
	CONSTRAINT pk_srno PRIMARY KEY(srno),
	CONSTRAINT chk_age CHECK(age>20),
)

insert into student(name,age) values('Bhagyashri', 28)
insert into student(name,age) values('Priyanka', 25)

select * from student

drop table student;

create table student1(
	id int identity(1,1) NOT NULL,
	name varchar(10) NOT NULL,
	age int NOT NULL,
	srno int,
	delind varchar NOT NULL,
	FOREIGN KEY(srno) REFERENCES student(srno)
)

alter table student1 add constraint pk_srno1 PRIMARY KEY(id)
alter table student1 add constraint chk_age1 CHECK(age>10)
alter table student1 add constraint uk_name UNIQUE(name)
alter table student1 add constraint def_delind DEFAULT 'Y' for delind
alter table student1 add constraint fk_srno FOREIGN KEY(srno) REFERENCES student1(srno)

insert into student1(name,age) values('Bhagyashri', 28)
insert into student1(name,age) values('Priyanka', 11)

select * from student1

alter table student1 drop constraint pk_srno1
alter table student1 drop constraint chk_age1
alter table student1 drop constraint def_delind
alter table student1 drop constraint uk_name

drop table student1;

create table users (
	id int NOT NULL,
	email varchar(10) NOT NULL,
	age int NOT NULL,
	delind varchar(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT uc_email UNIQUE(email),
	CONSTRAINT pk_id PRIMARY KEY(id),
	CONSTRAINT chk_age CHECK(age>20)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE users
DROP INDEX uc_email;

ALTER TABLE users
ADD CONSTRAINT uc_email UNIQUE (email);

ALTER TABLE orders
DROP FOREIGN KEY fk_user;

ALTER TABLE orders
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);

alter table users drop constraint pk_id;
alter table users drop constraint chk_age;
alter table users drop constraint uc_email;
alter table users drop constraint def_delind;

alter table users add constraint pk_id PRIMARY KEY(id);
alter table users add constraint chk_age CHECK(age>10);
alter table users add constraint uc_email UNIQUE(email);
ALTER TABLE users alter column delind varchar(1) 



CREATE TABLE employees (
    employee_id INT NOT NULL AUTO_INCREMENT,         -- NOT NULL & AUTO_INCREMENT
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,                  -- NOT NULL
    email VARCHAR(100) UNIQUE,                       -- UNIQUE
    hire_date DATE NOT NULL,                         -- NOT NULL
    salary DECIMAL(10, 2) CHECK (salary > 0),        -- CHECK constraint
    department_id INT,
	e_status VARCHAR(20) DEFAULT 'active',  -- DEFAULT constraint
    PRIMARY KEY (employee_id),                       -- PRIMARY KEY
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  -- FOREIGN KEY
    ON DELETE CASCADE           -- deletes employee if department is deleted
	ON UPDATE CASCADE           -- updates employee if department changes
);

ALTER TABLE users
ADD CONSTRAINT unique_username UNIQUE (username);

ALTER TABLE users
ADD CONSTRAINT chk_status CHECK (status IN ('active', 'inactive'));

ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE SET NULL;


select * from Employee;
EXEC sp_help Employee;

alter table Employee alter column EmpId int NOT NULL;

alter table Employee add constraint pk_employee PRIMARY KEY(EmpId);

alter table Employee add constraint chk_employee CHECK (Salary > 0);

alter table Employee add empStatus char(50) default 'ACTIVE'

-- update employee set empStatus = 'ACTIVE'

alter table Employee add constraint uk_employee UNIQUE (Name);


select * from Employee e1 JOIN Employee e2 ON e1.empid = e2.empid;

select * from employee where name like 'k%';


select * into FullTimeEmloyee from ContractEmployee
select * from FullTimeEmloyee;

insert into FullTimeEmloyee
select * from ContractEmployee



