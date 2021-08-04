create table dept_copy
as
select * from department;

insert into dept_copy
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept_copy
(dno, loc, dname)
values(20, 'DALLAS', 'RESEARCH');

insert into dept_copy
(dno, dname)
values(30,'SALES');

insert into dept_copy
values(40,'OPERATION', NULL);


insert into dept_copy
values(50,'COMPUTING', '');

create table emp_copy
as
select eno, ename, job, hiredate, dno 
from employee
where 0=1;



insert into emp_copy
values(7000,'CANDY', 'MANAGER', '2012/05/01', 10);

insert into EMP_COPY
values(7010, 'TOM', 'MANAGER', TO_DATE('2012,05,01','YYYY,MM,DD'),20);

select * from emp_copy;

insert into emp_copy
values(7020, 'JERRY', 'SALESMAN', sysdate, 30);

drop table dept_copy;

create table dept_copy
as
select * from department
where 0=1;

insert into dept_copy
select * from department;

update dept_copy
set dname = 'PROGRAMING'
where dno = 10;

update dept_copy
set dname = 'HR';

update dept_copy
set dname = 'PROGRAMING', LOC = 'SEOUL'
where dno = 10;

update dept_copy
set loc = (select loc
            from dept_copy
            where  dno = 20)
where dno = 10;


update dept_copy
set dname = (select dname
             from dept_copy
             where dno = 30), 
    loc = (select loc
            from dept_copy
            where dno = 30)
where dno = 10;

delete dept_copy
where dno = 10;

delete dept_copy;

create table dept_copy
as
select * from employee;

delete dept_copy
where dno = (select dno
                from department
                where dname = 'SALES');
                
create table dept_copy
as
select * 
from department;

delete dept_copy;

select * from dept_copy;

rollback;

select * from dept_copy;

commit;

create table EMP_INSERT
as
select *
from employee
where 0 = 1;

insert into emp_insert
values(1, 'ghMyeong', 'STUDENT', '', SYSDATE, 2700, 230, 10);

insert into emp_insert
values(2, 'he-man', 'SOLDIER', '', TO_DATE(SYSDATE-1, 'YY,MM,DD'), 1150, NULL, 20);

create table emp_copy
as
select *
from employee;

update emp_copy
set dno = 10
where eno = 7788;

update emp_copy
set (job, salary) =(select job, salary
                    from emp_copy
                    where eno = 7499)

where eno = 7788;

update emp_copy
set dno = (select dno
            from emp_copy
            where eno =7369)
where job = (select job
            from emp_copy
            where eno = 7369);
            
create table dept_copy
as
select *
from department;

delete dept_copy
where dname = 'RESEARCH';

delete dept_copy
where dno in (10, 40);

create table customer(
id varchar(20) not null,
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(30),
address varchar(100));

insert into customer
values(null, null, null, '010-111-1111', 'seoul');

create table customer1(
id varchar(20) unique,
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(30),
address varchar(100));

insert into customer1
values('greentea', '1234', '녹차아가씨', '010-111-1111', 'seoul');

insert into customer1
values(null, '11223344', '그린티', '020-2222-2222', 'seoul');

/*제약조건에 이름을 넣기 : 제약조건을 제거할때 쉽게 제거하기 위해서*/
-- 제약 조건 이름을 부여하지 않을 경우 Oracle 에서 랜덤하게 이름을 생성

create table customer3(
id varchar(20) constraint customer_id_uk unique,
pwd varchar(20) constraint customer_pwd_nn not null,
name varchar(20) constraint customer_name_nn not null,
phone varchar(30),
address varchar(100));

select * from user_constraints;





































