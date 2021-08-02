/*7장 sub Query : Select 구문내에 Select 문이 있는 쿼리*/



select salary
from employee
where ename = 'SCOTT'

select ename, salary
from employee
where salary > select salary
from employee
where ename = 'SCOTT');

--Scott 과 동일한 부서에 근무하는 사원들을 출력하기
select dno
from employee
where ename = 'SCOTT';

select ename, dno 
from employee
where dno = (select dno
from employee
where ename = 'SCOTT');

--최소급여를 받는 사원의 이름, 담당 업무, 급여 출력하기
select ename, job, salary
from employee
where salary = (select min(salary)from employee);

--메인 쿼리의 having : Group by 한 결과값에 조건을 사용할때
select dno, salary
from employee
order by dno;

select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno = 30);
                        
/*다중행 연산자 IN 사용하기*/
--부서별, 최소 급여를 받는 사원의 사원번호와 이름을 출력하는 쿼리문.
select ename, eno, dno, salary
from employee
order by dno;

select dno, min(salary)
from employee
group by dno

select eno, ename
from employee
where salary in (select min(salary)
                from employee
                group by dno);
                
/*ANY 연산자*/
-- 서브쿼리가 반환하는 각각의 값과 비교함.
--'< any' 는 최대값보다 작음을 나타냄
--'> any' 는 최소값보다 큼을 나타냄                
--'= any' 는 IN 과 동일함

--예문) 직급이 SALEMAN이면서 급여가 임의의 SalesMan 보다 작은 사원을 출력
        SALESMAN 의 최대 값이 1600 보다 작은 사원들을 출력

select eno, ename, job, salary
from employee
where salary < any(select salary
                    from employee
                    where job = 'SALESMAN')
                    
and job <> 'SALESMAN'

select eno, ename, job, salary from employee
where job = 'SALEMAN';

/*ALL 연산자 */
--Sub Query의 반환하는 모든값과 비교.
--' >all ' : 최대값보다 큼을 나타냄 
--' <all ' : 최소값보다 작음을 나타냄
/*직급이 SalesMan 이 아니면서 직급이 SalesMan인 사원보다 급여가 적은 사원을 모두 출력*/
--1250 보다 작은 모든 사원(직급이 SALESMAN이 아닌)
select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';        
                 
select salary
from employee
where ename = 'SCOTT';

select ename, salary
from employee
where salary > (select salary
                from employee
                where ename = 'SCOTT');
                
select ename, dno
from employee
where dno = (select dno
            from employee
            where ename = 'SCOTT');

select ename, job, salary
from employee
where salary = (select min(salary) 
                from employee);
                
select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno = 30);
                        
select dno, eno, ename
from employee
where salary = (select min(salary)
                from employee
                )
order by dno;

select max(salary)
from employee
where job = 'SALESMAN';


select eno, ename, job, salary
from employee
where salary < any (select salary
                from employee
                where job = 'SALESMAN')
and job <> 'SALESMAN';

select min(salary)
from employee
where job = 'SALESMAN';


select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

select ename, job
from employee
where job = (select job
            from employee
            where eno='7788');

select ename, job
from employee
where salary > (select salary
                from employee
                where eno ='7499');

select ename, job, salary
from employee
where salary = (select min(salary)
                from employee);
                
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                        from employee
                        group by job);
                        
select ename, salary, dno
from employee
where salary in (select min(salary)
                from employee
                group by dno
                )
order by dno;


select eno, ename, job, salary
from employee
where salary <ANY (select salary
                from employee
                where job = 'ANALYST' )
and job <> 'ANALYST';

select ename 
from employee
where ename in (select ename
                from employee
                where manager is null);
                
select ename
from employee
where ename in (select ename
                from employee
                where manager is not null);
                
select ename, hiredate
from employee
where dno = (select dno
            from employee
            where ename = 'BLAKE')
and ename <> 'BLAKE';

select eno, ename 
from employee
where salary > (select avg(salary)
                from employee)
order by salary;

select eno, ename
from employee
where dno in (select dno
                from employee
                where ename like '%K%');
                
select ename, dno, job
from employee
where dno = (select dno
                from department
                where loc = 'DALLAS');
                
select ename, salary
from employee
where manager in (select eno
                from employee
                where ename = 'KING');

select dno, ename, job
from employee
where dno = (select dno
                from department
                where dname = 'RESEARCH');


select eno, ename, salary
from employee
where dno in (select dno
              from employee
              where ename like '%M%')
and salary > (select avg(salary)
                from employee
                );


select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                        from employee
                        group by job);
                        
select ename
from employee
where dno in (select dno
            from employee
            where job = 'MANAGER');
            
select ename
from employee
where eno in(select manager
            from employee);
         
                
                
            

