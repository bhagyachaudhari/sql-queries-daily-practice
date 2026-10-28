
use practice

create table test(
	srno int identity(1,1) NOT NULL,
	name varchar(10) NOT NULL,
	age int NOT NULL,
	delind varchar NOT NULL DEFAULT 'Y'
	CONSTRAINT uc_name UNIQUE(name),
	CONSTRAINT pk_srno PRIMARY KEY(srno),
	CONSTRAINT chk_age CHECK(age>20),
)

insert into test(name,age) values('Bhagyashri', 28)
insert into test(name,age) values('Priyanka', 25)
select * from test

drop table test;

create table test1(
	id int identity(1,1) NOT NULL,
	name varchar(10) NOT NULL,
	age int NOT NULL,
	srno int,
	delind varchar NOT NULL,
	--FOREIGN KEY(srno) REFERENCES test(srno)
)

alter table test1 add constraint pk_srno1 PRIMARY KEY(id)
alter table test1 add constraint chk_age1 CHECK(age>10)
alter table test1 add constraint uk_name UNIQUE(name)
alter table test1 add constraint def_delind DEFAULT 'Y' for delind
alter table test1 add constraint fk_srno FOREIGN KEY(srno) REFERENCES test(srno)

insert into test1(name,age) values('Bhagyashri', 28)
insert into test1(name,age) values('Priyanka', 11)

select * from test1

alter table test1 drop constraint pk_srno1
alter table test1 drop constraint chk_age1
alter table test1 drop constraint def_delind
alter table test1 drop constraint uk_name

drop table test1;

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
