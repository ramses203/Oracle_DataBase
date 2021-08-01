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

select 98.7654,
round(98.7654),
round(98.7654, 2),
round(98.7654,3)
from dual;

select 98.7654,
trunc(98.7654),
trunc(98.7654,2),
trunc(98.7654,-1)
from dual;

select mod(31, 5),
mod(589652, 5),
mod(0, 5)
from dual;

select ename, salary, mod(salary,500)
from employee;

select sysdate
from dual;

select sysdate -1 어제,
sysdate 오늘,
sysdate+1 내일
from dual;

select round(sysdate-hiredate)
from employee;

select hiredate,
trunc(hiredate,'MONTH')
from employee;

select ename, hiredate,
add_MONTHS(hiredate,6)
from employee;

select sysdate,
next_day(sysdate,'토요일')
from dual;

select sysdate,
next_day(sysdate,'MONDAY')
from dual;

select ename, hiredate, last_day(HIREDATE)
from employee;

select ename, hiredate,
to_char(hiredate, 'YY/MM/DD'),
to_char(hiredate, 'YYYY/MM/DD')
from employee;

select to_char(sysdate, 'yyyy/mm/dd,hh24:mi:ss')
from dual;

select ename, to_char(salary, 'L999,999')
from employee;

select ename, hiredate
from employee
where hiredate=to_date(19810220,'yyyy,mm,dd');

select '100,000'-'50,000'
from dual;

select to_number('100,000','999,999')-to_number('50,000','99,999')
from dual;

nvl(commission,0)
nvl(hiredate, '2011/5/10')
nvl(job,'MANAGER');

select ename, salary, commission,
nvl(commission,0),
salary*12+nvl(commission,0)
from employee;
order by job;

select ename, salary, commission,
nvl2(commission, salary*12+commission, salary*12)
from employee
order by job;

select NULLIF('A', 'A'), NULLIF('A','B')
from dual;

select ename, salary, commission,
COALESCE(commission, salary,0)
from employee
order by job;

select ename, dno,
decode(dno, 10, 'ACCOUNTING',
20,'RESEARCH'
,30, 'SALES'
,40, 'OPERATION',
'DEFAULT') AS DNAME
from employee
order by dno;

select ename, dno,
case when dno = 10 then 'ACCOUNTING'
when dno = 20 then 'RESEARCH'
when dno = 30 then 'SALES'
when dno = 40 then 'OPERATIONS'
ELSE 'DEFAULT'
END AS DNAME
from employee
order by dno;

select substr(hiredate,1,2)년도,
substr(hiredate,7,2)달
from employee;

select * from employee
where substr(hiredate,4,2) = '04';

select * from employee
where mod(eno,2)=0;

select hiredate, TO_CHAR(hiredate,'YY/MON/DDDY')
from employee;

select trunc(sysdate-to_date('2021/01/01', 'YYYY/MM/DD'))
from dual;

select eno, ename, nvl(manager,0)MANAGER
from employee;

select eno, ename, job, salary, decode(job, 'ANALYST',salary+200,
                                            'SALESMAN',salary+180,
                                            'MANAGER', salary+150,
                                            'CLERK',salary+100,
                                            salary)UPDATE_SALARY
from employee;

select sum(salary) as '급여총액',
        avg(salary) as '급여평균',
        max(salary) as '최대급여',
        min(salary) as '최소급여'
from employee;

select max(hiredate)"최근에입사한직원",
min(hiredate) as 가장오래된입사한직원
from employee;

select sum(commission)
from employee;

select count(*)사원수
from employee;

select count(commission)커미션을받는사원의수
from employee;

select count(distinct job)직업의수
from employee;

select ename, max(salary)
from employee;

select dno 부서번호, trunc(avg(salary))급여평균
from employee
group by dno;

select dno, avg(salary)
from employee
group by dno;

select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno, job;

select dno, max(salary)
from employee
group by dno
having max(salary) >=3000;

select dno, count(*), sum(salary)
from employee
where job not in ('MANAGER')
group by dno
having sum(salary) > 5000
order by sum(salary);

select max(avg(salary))
from employee
group by dno;

select max(salary) as Maximum,
min(salary) as Minimum,
sum(salary) as Sum,
Round(avg(salary)) as Average
from employee;

select job, max(salary) Maximum,
min(salary) Minimum,
sum(salary) Sum,
Round(avg(salary)) Avarage
from employee
group by job;

select job, count(*)
from employee
group by job;

select count(MANAGER) as "COUNT(MANAGER)"
from employee;

select max(salary)- min(salary) DIFFERNCE
from employee;

select job, min(salary)
from employee
where manager is not null
group by job
having min(salary) > 2000
order by min(salary) desc;

select dno, count(*) "Number of People", round(avg(salary),2) Salary
from employee
group by dno
order by dno;

select decode(dno, 10, 'ACCOUNTING',
                    20, 'RESEARCH',
                    30, 'SALES',
                    40, 'OPERATIONS') dname,
        decode(dno, 10,'NEW YORK',
                    20, 'DALLAS',
                    30, 'CHICAGO',
                    40, 'BOSTON') Location,
count(*) "Number of people",
Round(avg(salary))
from employee
group by dno;
            
select job, dno, decode(dno, 10, sum(salary)) 부서10,
decode(dno, 20, sum(salary)) 부서20,
decode(dno, 30, sum(salary)) 부서30,
sum(salary) 총액
from employee
group by job, dno
order by dno;

select * from employee, department
where employee.dno = department.dno;

select eno, ename, dname
from employee, department
where employee.dno = department.dno
and eno = 7788;

select employee.eno, employee.ename, department.dname, department.dno
from employee, department
where employee.dno = department.dno
and employee.eno=7788;

select eno, ename, dname, employee.dno
from employee, department
where employee.dno = department.dno 
and eno = 7788;


