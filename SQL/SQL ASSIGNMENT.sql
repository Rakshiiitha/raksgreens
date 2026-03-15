create database company_db;
use company_db;

create table skills(
skill_id int identity(1,1) primary key,
skill_name varchar(300) not null,
category varchar(300));
select * from skills;

--show databases;
select name from sys.databases;
--show tables
select name from sys.tables;

EXEC sp_rename 'employee','staff';


--DATA INSERTION
create table emp(
dept_id int primary key,
name varchar(300),
email varchar(300),
hire_date date,
salary float,
gender varchar(10));

create table project(
dept_id int primary key,
proj_name varchar(300),
budget float,
);

create table department(
dept_id int primary key,
dept_names varchar(300),
location varchar(50));

alter table project
add proj_id int;

insert into department values(1,'it','chicago'),(5,'it','san fransico'),
(2,'cyber','india'),(4,'cse','chicago');

insert into emp values (1,'Alcina','alci@gmail.com','2023-06-10',72500,'female'),
(2,'meera','meera@gmail.com','2025-03-16',75000,'female'),
(4,'Alice Green','alice.green@company.com','2024-01-10',62000,'female');
insert into emp values (3,'tom','tom@company.com',null,null,null);
insert into emp values (5,'john','john@company.com','2023-03-18',89000,'male');
select * from emp;

insert into project values(1,'training program',25000),(2,'mobile app',60000);
insert into project values(3,'web designing',80000);

select * from project;
 
--qn 9.
alter table department
add sales varchar(50);

--qn. 12
select dept_id AS 'Employee ID', name AS 'Name',email AS 'Email Address', salary from emp;

--qn 13
select *from emp
where hire_date>'2023-01-01';

--qn 14
select * from project
where budget>40000
order by budget;

--qn 15.
select distinct(location) from department;

--qn16-change the position of the column 
-->emp(rightclick)->design->change->ctrl+s
alter table emp
add phone_number varchar(15);

--qn17
update emp
set salary=65000
where name='john doe';

--qn18
update emp
set gender='other'
where dept_id=2;

--qn19
alter table emp
drop column phone_number;

--qn20
select * from emp
where salary between 60000 and 80000;

--qn21
select * from emp
where name like 'j%';

--qn22
select * from project
where dept_id in (1,2);

--qn23
select * from emp
where email is not null;

--qn24
select * from department
where location not in('newyork','chicago');

--qn25
select * from emp
where year(hire_date)=2023;

--qn26
select sum(salary) as 'total salary' from emp;

--qn27
select avg(budget) from project;

--qn28
select max(salary) from emp;

--qn29
select count(*) from emp
where dept_id=2;

--qn30
select min(budget) from project;

--qn31
select e.name,d.dept_names from emp e
join department d on e.dept_id=d.dept_id;

--qn32
select d.dept_names,count(e.name) as 'emp_count' 
from department d left join emp e
on d.dept_id=e.dept_id
group by dept_names;

--qn33
select p.proj_name,d.dept_names from project p
join department d on p.dept_id=d.dept_id;

--qn34
select e.name from emp e join department d 
on e.dept_id=d.dept_id
where d.location='san fransico';

--qn35
select d.dept_names from department d left join project p
on d.dept_id=p.dept_id
where p.proj_name is null;

--qn36
select concat(first_name,' ',last_name) as 'full_name' from emp;

--qn37
select upper(dept_names) from department;

--qn38
select substring(email,1,3) from emp;

--qn39
select abs(-50000);

--qn40
select round(avg(salary),2) from emp;

--qn41
select top 3 *from emp
order by hire_date;

--qn42

--qn45
select dept_id, sum(budget) from project
group by dept_id;

--qn46 (find the employee with the longest first_name using LENGTH.)
select top 1 * from emp
order by len(name) desc;

--qn47
select *from emp
where hire_date

--qn48
delete from emp
where salary<60000;

--qn49
drop table project;

--qn50

