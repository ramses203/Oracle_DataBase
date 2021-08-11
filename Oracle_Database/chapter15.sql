/*프로시저 생성하기*/
create procedure sp_salary
is
v_salary employee.ename%type;
begin 
select salary into v_salary
from employee
where ename='SCOTT';
dbms_output.put_line('SCOTT의 급여는 ' || v_salary);
end;
/

execute sp_salary;

select name, text from user_source
where name like('%SP_SALARY%');

drop procedure sp_salary2;

create procedure sp_salary2
is
v_salary employee.salary%type;
begin
select salary into v_salary
from employee
where ename = 'SCOTT';
dbms_output.put_line('SCOTT의 급여는 '|| v_salary);
end;
/

select name, text from user_source
where name like('%SP_SALARY%');

drop procedure sp_salary;

create procedure sp_salary
is
v_salary employee.ename%type;
begin
select salary into v_salary from employee
where ename = 'SCOTT';
dbms_output.put_line('scott의 급여는 ' ||v_salary);
end;
/

execute sp_salary;

select name, text from user_source
where name like('SP_SALARY');
 
create procedure sp_salary_ename(
v_ename in employee.ename%type)
is 
v_salary employee.salary%type;
begin
select salary into v_salary
from employee
where ename = v_ename;
dbms_output.put_line(v_ename||'의 급여는 '||v_salary );
end;
/
drop procedure SP_SALARY_ENAME;

execute sp_salary_ename('SCOTT');

select name, text from user_source
where name like('%SP_SALARY_ENAME%');

create procedure sp_salary_ename2(
v_ename in employee.ename%type,
v_salary out employee.salary%type)
is 
begin
select salary into v_salary
from employee
where ename = v_ename;
end;
/

variable v_salary varchar2(14);
execute sp_salary_ename2('SCOTT', :v_salary);
print v_salary;

create or REPLACE function fn_salary_ename(v_ename in employee.ename%type)
return number
is
v_salary number(7,2);
begin 
select salary into v_salary
from employee
where ename= v_ename;
return v_salary;
end;
/

variable v_salary number;
execute: v_salary := fn_salary_ename('SCOTT');
print v_salary;

select fn_salary_ename('SCOTT')
from employee
where ename='SCOTT';


/* 트리거의 사용 */
--첫번째는 사용자가 사용하는 테이블 생성하기
create table dept_original
as
select * from department
where 0=1;

--두번째는 트리거에 의해서 사용되는 백업테이블 생성하기
create table dept_copy
as
select * from department
where 0=1;

create or replace TRIGGER triger_sample1
after insert
on dept_original
for each row
begin
if inserting then
dbms_output.put_line('Insert Trigger 발생');
insert into dept_copy
values(:new.dno, :new.dname, :new.loc);
end if;
end;
/

insert into dept_original
values(10, 'ACOUNTING', 'NEW YORK');

select * from dept_original;
select * from dept_copy;

create or replace trigger trigger_sample2
after delete 
on dept_original
for each row
begin
dbms_output.put_line('Delete 트리거 발생');
delete from dept_copy
where dept_copy.dno = :old.dno;
end;
/


delete dept_original
where dno=10;

create procedure sp_commission
is
cursor c1
is
select * from employee
where commission is not null;
begin 
dbms_output.put_line('사번   이름    급여');
dbms_output.put_line('------------------');
for v_emp in c1 loop
dbms_output.put_line(v_emp.eno||' '|| v_emp.ename||' '||v_emp.salary);
end loop;
end;
/

execute sp_commission;
select name, text from user_source
where name like ('%SP_COMMISSION%');




























