-- 전체사원 출력하기
select * from employee;

-- 사원번호와 사원명만 출력하기
select eno, ename from employee;

-- 연봉구하기
select ename, salary, salary*12 from employee;

-- 커미션 더한 연봉 구하기
select ename, salary, salary*12+commission from employee;

-- distinct로 중복된 데이터를 한번씩만 출력하기
select DISTINCT dno from employee;

-- dual 테이블릐 구조 살펴보기
desc dual;

-- dummy 컬럼 값 확인하기
select * from dual;

-- 오늘 날짜 출력하기
select sysdate from department;

-- 오늘 날짜 한번 출력하기
select sysdate from dual;

-- 급여(salary)가 1500 이상인 사원 출력하기
select salary from employee where salary >= 1500;

-- 10번 부서 소속 사원 출력하기
select dno, ename from employee where dno = 10;

-- scott를 칼럼으로 간주하고 오류를 발생한 예
select * from employee where ename = 'SCOTT';

-- 입사일(hiredate)이 '1981/01/01' 이전인 사원만 출력하기
select * from employee where hiredate <= '1981/01/01';

-- 부서번호가 10이고 직급이 'manager' 인 사원만 출력하기
select * from employee where dno=10 and job='MANAGER';

-- 부서번호가 10이거나 직급이 'manager' 인 사원만 출력하기
select * from employee where dno=10 or job='MANAGER';

-- NOT을 이용한 조건 지정하기
select * from employee where not dno=10;

-- <> 를 이용한 조건 지정하기
select * from employee where dno <> 10;

-- 급여가 1000에서 1500사이인 사원 출력하기
select * from employee where salary >= 1000 and salary <= 1500;

-- 급여가 1000미만이거나 1500초과인 사원 출력하기
select * from employee where salary < 1000 or salary > 1500;

-- 커미션이 300이거나 500이거나 1400인 사원 출력하기
select * from employee where commission=300 or commission=500 or commission=1400; 

-- between and 연산자 사용해서 1000에서 1500사이인 사원을 출력하기
select * from employee where salary BETWEEN 1000 and 1500;

-- not between and 연산자 사용하기
select * from employee where salary not between 1000 and 1500;

-- in 연산자를 사용해서 커미션이 300이거나 500이거나 1400인 사원을 검색하세요
select * from employee where commission in(300,500,1400);

-- commission이 300, 500, 1400이 모두 아닌 사원을 검색하기 위해서 <> 연산자를 사용해 보세요.
select * from employee where commission<>300 and commission<>500 and commission<>1400;

-- commission이 300, 500, 1400이 모두 아닌 사원을 검색하기 위해서 not in 연산자를 사용해 보세요.
select * from employee where commission not in(300,500,1400);

-- 사원 테이블중 F로 시작하는 이름을 갖는 사원을 검색하세요
select * from employee where ename like 'F%';

-- 사원 테이블중 M로 시작하는 이름을 갖는 사원을 검색하세요
select * from employee where ename like 'M%';

-- 사원 테이블중 N로 끝나는 이름을 갖는 사원을 검색하세요
select * from employee where ename like '%N';

-- 사원 테이블중 이름에 M이 포함되어 있는 갖는 사원을 검색하세요
select * from employee where ename like '%M%';

-- 사원 테이블중 이름의 두번째 글자가 'A'인 사원을 검색하세요
select * from employee where ename like '__A%';

-- 사원 이름에 A가 포함되지 않은 사원을 검색하시오
select * from employee where ename not like '%A%';

-- 사원의 커미션을 출력하시오
select ename, dno, commission from employee;

-- 커미션이 null인 사원을 찾는데 실패하는 예
select * from employee where commission is null;

-- 컬럼 값이 null이 아닌지 조회하기
select * from employee where commission is not null;







