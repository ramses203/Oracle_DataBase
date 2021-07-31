select * from employee;
select eno, ename from employee;
select ename, salary*12 from employee;
select ename, salary*12 + nvl(commission, 0) from employee;
select ename, salary*12 + nvl(commission, 0) "연  봉" from employee;

select * from employee
where commission in(300, 500, 1400);

select *from employee
order by salary asc;

select * from employee
order by salary;

select * from employee
order by salary desc;

select * from employee
order by ename;

select * from employee
order by ename asc;

select * from employee
order by ename desc;

select * from employee
where not dno = 10;

select * from employee
where dno <> 10;

select * from employee
where salary >= 1000 and salary <= 1500;

select * from employee
where commission = 300 or commission = 500 or commission = 1400;

select * from employee
where salary < 1000 or salary > 1500;

select * from employee
where salary between 1000 and 1500;

select * from employee
where salary not between 1000 and 1500;

select * from employee
where hiredate between '1982/01/01' and '1982/12/31';

select * from employee
where commission in(300, 500, 1400);

select * from employee
where commission not in (300, 500, 1400);

select * from employee
where commission is not null;

select ename 사원의이름, salary 급여, salary+300 "인상된 급여" from employee;

select ename, salary, salary*12+100 from employee
order by salary*12+100 desc;

select ename, salary from employee
where salary > 2000
order by salary desc;

select eno, ename from employee
where eno = 7788;

select ename, salary from employee
where salary not between 2000 and 3000;

select ename, job, hiredate from employee
where hiredate between '1981/02/20' and '1981/05/01';

select ename, dno from employee
where dno = 20 or dno = 30
order by ename desc;

select ename, dno from employee
where dno in(20, 30)
order by ename ;

select ename, salary, dno from employee
where salary between 2000 and 3000
and dno in (20, 30)
order by ename;

select ename, hiredate from employee
where hiredate like '81%';

select ename, job from employee
where manager is null;

select ename, salary, commission from employee
where commission is not null
order by salary, commission desc;

select ename from employee
where ename like '__R%';

select ename from employee
where ename like '%E%'
and ename like '%A%';

select ename, job, salary from employee
where job in('CLERK', 'SALESMAN')
and salary not in(1600,950,1300);

select ename, salary, commission from employee
where commission > 500;









