select * from employee;
select eno, ename from employee;
select ename, salary*12 from employee;
select ename, salary*12 + nvl(commission, 0) from employee;
select ename, salary*12 + nvl(commission, 0) "¿¬  ºÀ" from employee;
