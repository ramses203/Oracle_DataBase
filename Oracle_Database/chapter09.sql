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










































