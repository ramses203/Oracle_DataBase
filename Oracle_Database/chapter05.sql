/*사원절의 급여 총액, 평균액, 최고액, 최소액 출력하기*/
select SUM(salary) as "급여총액",
    AVG(salary) as "급여평균",
    MAX(salary) as "최대급여",
    MIN(salary) as "최소급여",
    'aaa' as aaa
from employee;

select ename, salary from employee
order by salary asc;

/*최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일 출력하기*/

select MAX(hiredate)as "가장 최근 입사사원",
        MIN(hiredate) as "가장 오래된 입사사원"
from employee;

/*NULL 이 들어간 컬럼의 집계함수 : MAX, MIN, SUM, AVG 사용*/
select sum(commission) as "커미션 총액",
AVG(commission) as "커미션 평균",
MAX(commission) as "커미션 최대값",
MIN(commission) as "커미션 최소값"
from employee;

select commission, salary from employee;
select salary,commission, nvl(commission,0)+salary as 더한값
from employee;

/*Count 함수 : 레코드의 결과값을 출력*/
select count(*) as 총사원수 from employee; -- 총직원수

select count (ename) from employee;

select count (commission) from employee;  -- count 함수는 null를 처리하지않는다.

select commission from employee
where commission is not null;

select count(DISTINCT job) as "직업 개수" from employee;

select job from employee;

select DISTINCT job from employee;

/*그룹함수(집계함수) 와 단순 컬럼 출력시 오류*/
--select ename, sum(salary) from employee;

/*Group by 사용하기*/
/*부서별로 평균 급여를 출력*/

select dno as "부서번호", avg(salary) as "급여평균"
from employee
group by dno; --dno 컬럼의 동일한 값을 그룹핑한다.

select avg(salary) from employee;

select dno as "부서번호" , salary as 급여 from employee
order by dno asc;

select dno, round(avg(salary)) as 급여평균 , sum(salary), min(salary), max(salary)
from employee
group by dno;

select dno, salary from employee
order by dno;

select dno, salary from employee
group by dno;






/*다중컬럼을 이용하여 그룹별로 검색하기*/
select dno, job, count(*), sum(salary)
from employee
group by dno, job    --두컬럼 모두에 대해서 그룹핑
order by dno, job;

select dno, job, salary from employee
order by dno, job;

/*Group by 내에서 조건 검색 : Having*/
--각부서의 월급이 최고 높은 값을 가져온다.
select dno,count(dno),max(salary)
from employee
group by dno
having max(salary) >=3000 -- Group 절 내에서 검색

--최고급여 출력하기 
select dno salary from employee;

select max(avg(salary))
from employee
group by dno;

select dno, count(dno) avg(dno)
from employee
group by dno;






