/*Join*/

select * from department; --부서테이블(DNO : 부서의 코드, DNAME : 부서명, LOC 부서의 위치)
select * from employee; -- 사원테이블(DNO: 부서의 코드,  ENO: 사번,  JOB: 직책,  Manager: 상사)

select dno, eno, ename --7788 사원의 부서코드를 출력(20)
from employee
where eno = 7788

select dname, dname           -- 
from department
where dno=20;

select * from department;
select * from employee;

/*카디시안 곱: */
select * 
from department, employee
order by department.dno, ename;

--JOIN 하는 순서
--step 1 : 두테이블의 공통의 키컬럼을 where 절에서 = 을 사용해서 검색한다.
select * 
from department, employee
where department.dno = employee.dno;

--step 2 : and 연산하기 : eno 컬럼의 값이 7788인 사원의 값만 출력
select  * 
from department, employee
where department.dno = employee.dno
and eno = 7788;

--EQUL JOIN : where 절의 = 를 사용한 JOIN
--step 3 : 원하는 컬럼만 출력한다.
select eno, ename, dname,department.dno
from department, employee
where department.dno = employee.dno
and eno = 7788;


select eno,ename,dname,department.dno      --dno 컬럼은 두테이블 모두 존재하는 컬럼
from department, employee
where department.dno = employee.dno
and eno = 7788;


/*테이블에 별칭 사용하기*/
select employee.eno, employee.ename, department.dname, department.dno
from department, employee
where department.dno = employee.dno
and eno = 7788;

select e.eno, e.ename, d.dname, d.dno
from department d, employee e
where d.dno = e.dno
and e.eno = 7788;

/*NATURAL JOIN : Oracle 9i 지원
EQUI JOIN 의 where 절 없앰 : 두 테이블의 공통의 키컬럼 "="
-공통키 컬럼을 자동으로 적용해서 작동
-공통 키 컬럼은 별칭이름을 사용하면 오류
*/

select e.eno, e.ename, d.dname, dno  --dno 컬럼에 별칭이름을 사용하면 오류
from employee e natural join department d
where e.eno=7788;

/*EQUI JOIN에서 USING 을 사용하는 경우*/
--NATURAL JOIN 은 두테이블의 공통의 키 컬럼이 동일한 데이터 타입이여야 한다.
--두 테이블에 공통 키 컬럼의 데이터 타입이 다른 경우 USING 을 사용한다.
select eno, ename, dname, dno
from employee e join department d
using (dno)
where e.eno = 7788;

/*EQUI JOIN 의 ON 절 사용*/
select e.eno, e.ename, d.dname, e.dno
from employee e join department d
on e.dno = d.dno
where e.eno = 7788;

/*NON EQUI JOIN : 
- where 절에서 "=" 을 사용하지 않는 JOIN*/

select * from salgrade;

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

/*3개의 테이블 조인*/
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno       --두 테이블의 공통 키컬럼
and salary between losal and hisal;

select * from salgrade;

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and salary between losal and hisal;


/*Self JOIN :  자신의 테이블을 자신이 조인, 주로 사원의 상사를 출력*/
select e.ename 사원이름, m.ename 직속상관이름 
from employee e, employee m
where e.manager = m.eno;


/*JOIN ~ ON 절을 사용한 SELF JOIN
ANSI 호환으로 JOIN : 모든 DBMS에서 사용가능한 JOIN 문법
ON절에 공통 키 컬럼을 사용.*/
select e.ename || '의 직속 상관은 ' || m.ename
from employee e join employee m
on e.manager = m.eno;

/*OUTER JOIN*/
-- 특정 컬럼의 내용은 두테이블에서 공통적이지 않은 내용도 출력해야 될때 , NULL출력
-- + 기호를 사용한 OUTER JOIN
-- ANSI 호환을 통한 OUTER JOIN
select eno, ename, manager from employee;

select e.ename || ' 의 직속 상관은 ' || m.ename
from employee e join employee m
on e.manager = m.eno(+);

/*ANSI 호환 OUTER JOIN
Left Outer JOIN : 왼쪽테이블의 내용을 무조건 출력
Right Outer JOIN : 오른족 테이블의 내용을 무조건 출력
Fuul Outer JOIN : 왼쪽, 오른쪽 테이블 내용을 모두 출력
*/

select e.ename || '의 직속상관은 ' || m.ename 
from employee e Left Outer JOIN employee m
on e.manager = m.eno;

select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and ename = 'SCOTT';

select ename, dname, loc
from employee e join department d
on e.dno = d.dno;

select dno, job, loc 
from employee e join department d
using(dno)
where dno = 10;

select ename, dname, loc 
from employee natural join department
where commission > 0;

select ename, dname
from employee e, department d
where e.dno = d.dno
and ename like '%A%';

select ename, job, dno, dname
from employee natural join department
where loc = 'NEW YORK';

select e.ename Employee, e.manager Emp#, m.eno Manager, m.ename Mgr#
from employee e, employee m
where e.manager = m.eno;

select e.eno, e.ename Employee, e.manager Emp#, m.eno Manager, m.ename Mgr#
from employee e, employee m
where e.manager = m.eno(+)
order by e.eno desc;

select e.ename, e.dno, o.ename
from employee e, employee o
where e.dno = o.dno
and e.ename = 'SCOTT'
and o.ename <> 'SCOTT'; 

select e2.ename, e2.hiredate
from employee e, employee e2
where e.hiredate < e2.hiredate
and e.ename = 'WARD'
order by e2.hiredate;

select e.ename, e.hiredate, m.ename, m.hiredate
from employee e, employee m
where e.manager = m.eno 
and e.hiredate <= m.hiredate

