set serveroutput on
begin
    dbms_output.put_line('Welcome to Oracle');
end;
/

set serveroutput on
declare
v_eno number(4);
v_ename employee.ename%type;
begin
v_eno:=7788;
v_ename:='scott';

dbms_output.put_line('사원번호 사원이름');
dbms_output.put_line('---------------');
dbms_output.put_line(v_eno || '   ' || v_ename);
end;
/

/*오류나는 구문 지금은 뭐가 문제인지 모르겠다.*/
set serveroutput on
declare 
v_eno emoloyee.eno%type;
v_ename employee.ename%type;
begin 
dbms_output.put_line('사원번호   사원이름');
dbms_output.put_line('------------------');

select eno, ename into v_eno, v_ename
from employee
where ename = 'SCOTT';

dbms_output.put_line(v_eno||'    ' ||v_ename);
end;
/

set serveroutput on 
declare
v_employee employee%rowtype;
temp number(4) := 1;
annsal number(7,2);
begin
select * into v_employee
from employee
where ename = 'SCOTT';
if(v_employee.commission is null) then
v_employee.commission :=0;
end if;

annsal:= v_employee.salary*12 + v_employee.commission;

dbms_output.put_line('사원번호   사원이름   연봉');
dbms_output.put_line('-----------------------');
dbms_output.put_line(v_employee.eno||'    '||v_employee.ename||'   '||annsal);
end;
/

set serveroutput on
declare 
v_eno employee.eno%type;
v_ename employee.ename%type;
v_dno employee.dno%type;
v_dname varchar2(20):= null;
begin
select eno, ename,dno
into v_eno, v_ename, v_dno
from employee
where ename='SCOTT';

if (v_dno=10)then
v_dname :='ACCOUNTING';
elsif (v_dno=20)then
v_dname :='RESEARCH';
elsif (v_dno=30)then
v_dname :='SALES';
elsif (v_dno=40)then
v_dname :='OPERATIONS';
end if;
dbms_output.put_line('사원번호    이름     부서명');
dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_dname);
end;
/

/*BASIC Loop로 구구단 2단 출력하기*/
set serveroutput on
declare
dan number:= 2;
i number:= 1;

begin 
loop
dbms_output.put_line(
dan ||' * '|| i ||' = '|| (dan*i));
i:= i+1;
if i>9 then 
exit;
end if;
end loop;
end;
/

set serveroutput on
declare
dan number := 2;
i number := 1;
begin
loop
dbms_output.put_line(dan || ' * ' || i || ' = ' || (dan*i));
i := i+1;
if i > 9 then
exit;
end if;
end loop;
end;
/

set serveroutput on
declare 
dan number :=2;
i number :=1;
begin
loop
dbms_output.put_line(dan || '*' || i || '=' || (dan*i));
i := i+1;
if i > 9 then
exit;
end if;
end loop;
end;
/

set serveroutput on
begin
dbms_output.put_line('Welcome to Oracle');
end;
/

set serveroutput on
declare
v_eno number(4);
v_ename employee.ename%type;
begin
v_eno := 7788;
v_ename := 'SCOTT';
dbms_output.put_line('사원번호     사원이름');
dbms_output.put_line('------------------');
dbms_output.put_line(v_eno||'       '||v_ename);
end;
/

set serverputout on
declare
v_eno employee.eno%type;
v_ename employee.ename%type;
begin
dbms_output.put_line('사원번호          사원이름');
dbms_output.put_line('------------------------');

select eno, ename into v_eno, v_ename
from employee
where ename = 'SCOTT';

dbms_output.put_line(v_eno||'          '||v_ename);
end;
/

set serveroutput on
declare
v_employee employee%rowtype;
temp number(4);
annsal number(7,2);
begin
select * into v_employee
from employee
where ename = 'SCOTT';
if v_employee.commission is null then
v_employee.commission :=0;
end if;

annsal := v_employee.salary * 12 + v_employee.commission;

dbms_output.put_line('사원번호     사원이름     연봉');
dbms_output.put_line('---------------------------');
dbms_output.put_line(v_employee.eno||'        '||v_employee.ename||'      '||annsal);
end;
/



set serveroutput on
declare
v_eno employee.eno%type;
v_ename employee.ename%type;
v_dno employee.dno%type;
v_dname varchar2(20) := null;
begin
select eno, ename, dno into v_eno, v_ename, v_dno
from employee
where ename = 'SCOTT';  
if(v_dno = 10)then
v_dname := 'ACCOUNTING';
elsif(v_dno = 20)then
v_dname := 'RESEARCH';
elsif(v_dno = 30)then
v_dname := 'SALES';
elsif(v_dno = 40)then
v_dname := 'OPERATIONS';
end if;
dbms_output.put_line('사원번호    이름    부서명');
dbms_output.put_line('=======================');
dbms_output.put_line(v_eno||'    '||v_ename||'    '||v_dname);
end;
/




























































