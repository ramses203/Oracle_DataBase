create sequence sample_seq
increment by 10
start with 10;

select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences;

select sample_seq.nextval from dual;

select sample_seq.currval from dual;

create sequence dno_seq
increment by 10
start with 10;

create table dept_copy
as
select *
from department
where 0 = 1;

insert into dept_copy
values(dno_seq.nextval, 'MANAGER', 'NEW YORK');

select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences
where sequence_name in('DNO_SEQ');

alter sequence dno_seq
MAXVALUE 50;

drop sequence dno_seq;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMPLOYEE','DEPARTMENT');

create index idx_employee_ename
on employee(ename);

drop index idx_employee_ename;

alter index pk_emp rebuild;

drop index idx_dept_dne;


create unique index idx_dept_dno
on dept_copy(dno);

create unique index idx_dept_loc
on dept_copy(loc);

drop index idx_dept_loc;

create table dept_second
as
select *
from department;

create unique index idx_dept_dno
on dept_second(dno);

create unique index idx_dept_loc
on dept_second(loc);

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMPLOYEE', 'DEPARTMENT');

create index idx_employee_ename
on employee(ename);

drop index idx_employee_ename;

alter index PK_EMP rebuild;

select * from department;

create table dept_second
as
select *
from department;

delete dept_second
where dno = 40;

update dept_second
set dname = 'RESEARCH'
where dno = 30;

update dept_second
set loc = 'NEW YORK'
where dno = 30;

create unique index idx_dept_dno
on dept_second(dno);

select index_name, table_name, column_name
from user_ind_columns
where table_name in('DEPT_SECOND');

create unique index idx_dept_loc
on dept_second(loc);

create index idx_dept_com
on dept_second(dname, loc);

select index_name, table_name, column_name
from user_ind_columns
where table_name in('DEPT_SECOND');



create sequence emp_seq
start with 1
maxvalue 100000
increment by 1;

select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences
where sequence_name like('%EMP%');

create table emp01
as
select eno EMPNO, ename, hiredate
from employee
where 0=1;

insert into emp01
values(emp_seq.nextval, 'JULIA', '11/05/10');

create index IDX_EMP01_ENAME
on emp01(ename);

select index_name, table_name, column_name
from user_ind_columns
where table_name in('EMP01');






