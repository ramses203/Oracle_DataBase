select table_name, constraint_name
from user_constraints
where table_name in('CUSTOMER');

create table customer(
id varchar(20) constraint customer_id_uk unique,
pwd varchar(20) constraint customer_pwd_nn not null,
name varchar(20) constraint customer_name_nn not null,
phone varchar(30),
address varchar(100)
constraint customer_id_pk_primary key(id));


--�θ� ���̺� : parentTBL (primary Key, Unique)
create table ParentTbl(
name varchar2(20),
age number(3) constraint ParentTbl_age_ck check(AGE > 0 and AGE< 200),
gender varchar(5) constraint ParentTbl_gender_ck check (gender IN('M','W')),
infono number constraint PatentTbl_infono_pk primary key);

desc ParentTbl;

insert into ParentTbl values('ȫ�浿', 30, 'M',1);
insert into ParentTbl values('��ʶ�', 20, 'M',2);
insert into ParentTbl values('����', 25, 'M',3);
insert into ParentTbl values('ȫ���', 300, 'kk',3);
insert into ParentTbl values('�̳���', 30, 'kk',3);
insert into ParentTbl values('��ʼ�', 60, 'kk',3);


select * from ParentTbl;

-- �ڽ� ���̺� : childTBL(Foreign Key)

create table customer(
id varchar(20) constraint customer_id_uk unique,
pwd varchar(20) constraint customer_pwd_nn not null,
name varchar(20) constraint customer_name_nn not null,
phone varchar(30),
address varchar(100));


insert into customer
values('greentea', '1234', '�����ư���', '010-111-1111', 'seoul');

insert into customer
values(null, '1123344', '�׸�Ƽ', '010-222-2222', 'seoul');


/*�������� �̸� Ȯ���ϱ�*/
select table_name, constraint_name
from user_constraints
where table_name in('CUSTOMER');

/*FOREIGN KEY �������� �����ϱ�*/
create table emp_second(
eno number(4) constraint emp_second_eno_pk primary key,
ename varchar2(10),
job varchar2(9),
dno number(2) constraint emp_second_dno_fk references department);

insert into emp_second
values(8000, '����ȭ', 'FC', 40);

CREATE TABLE emp_second(
eno number(4),
ename varchar2(10),
salary number(7, 2) constraint emp_second_salary_min check (salary > 0));

insert into emp_second
values(8000, '����ȭ', 200.123456);

create table emp_second(
eno number(4) constraint emp_second_eno_pk primary key,
ename varchar(10),
salary number(7, 2) default 1000);

insert into emp_second(eno, ename)
values(8001, '����ȸ');

create table emp_copy
as
select * 
from employee;

create table dept_copy
as
select * 
from department;

select table_name, constraint_name
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

select table_name, constraint_name
from user_constraints
where table_name in('EMPLOYEE','DEPARTMENT');

alter table emp_copy
add constraint emp_copy_eno_pk primary key(eno);

alter table dept_copy
add constraint dept_copy_dno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk 
foreign key(dno) references dept_copy(dno);

alter table emp_copy
modify ename constraint emp_copy_ename_nn not null;

alter table dept_copy
drop primary key cascade;

alter table emp_copy
drop constraint emp_copy_ename_nn;

select table_name, constraint_name
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

alter table dept_copy
add constraint dept_copy_dno_pk primary key(dno);

alter table emp_copy
add constraint emp_copy_dno_fk 
foreign key(dno) references dept_copy(dno);  

alter table emp_copy
disable constraint emp_copy_dno_fk;

select table_name, constraint_name, status
from user_constraints
where table_name in('EMP_COPY', 'DEPT_COPY');

insert into emp_copy
values(8000, 'ghMyeong', 'manager', '7698', sysdate, 5000, null, 50);

delete emp_copy
where dno = 50;
 
alter table emp_copy
enable constraint emp_copy_dno_fk;


create table emp_sample
as
select*
from employee
where 0=1;

alter table emp_sample
add constraint my_emp_pk primary key(eno);

create table dept_sample
as
select *
from department
where 0=1;

alter table dept_sample
add constraint my_dept_pk primary key(dno);

select table_name, constraint_name, status
from user_constraints
where table_name in('EMP_SAMPLE', 'DEPT_SAMPLE');

ALTER table emp_sample
add constraint my_emp_dept_fk foreign key(dno) references dept_sample(dno);

alter table emp_sample 
add constraint emp_commission_min_ck check (commission > 0);

insert into emp_sample
values(8000, 'John', 'manager', '7788', sysdate, 5000, -1, 10);




