create table dept(
            dno number(2),
            dname varchar(14),
            loc varchar2(13));
            
create table dept_second
as
select * 
from employee;

select * from dept_second;

create table dept20
as
select eno, ename, salary*12 annsal
from employee
where dno = 20;

create table dept_third
as
select dno, dname
from dept
where 0=1;

create table dept_third2
as
select dno, dname
from dept; 

select * from dept_third2;

create table dept_third3
as
select dno, dname
from department
where 0=1;

select * from dept20;

alter table dept20
add(birth date);

alter table dept
modify dname varchar2(30);

alter table dept20
drop column ename;

alter table dept20
set unused(eno);

alter table dept20
drop unused columns;

rename dept20 to emp20;

drop table emp20; 

truncate table dept_second;

select table_name from user_tables;

select owner, table_name from all_tables;

select owner, table_name from dba_tables;


create table dept(
dno number(2),
dname varchar2(14),
loc varchar2(13));

select * from dept;

create table EMP(
eno number(4),
ename varchar2(10),
dno number(2));

alter table EMP
modify ename varchar(25);

create table EMPLOYEE2
as
select eno EMP_ID, ename NAME, salary SAL, dno DEPT_ID
from employee;

drop table EMP;

rename EMPLOYEE2 to EMP;

alter table dept
drop column dname;

alter table dept
set unused (loc);

alter table dept
drop unused columns;










