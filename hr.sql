-- 전체사원 출력하기
select * from employee;

-- 사원번호와 사원명만 출력하기
select eno, ename from employee;

-- 연봉구하기
select ename, salary, salary*12 from employee;

-- 커미션 더한 연봉 구하기
select ename, salary, salary*12+commission from employee;


