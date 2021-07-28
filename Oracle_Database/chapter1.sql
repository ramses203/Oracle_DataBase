desc department;              /*테이블의 구조를 출력해줌 */
select * from department;

desc employee;
select * from employee;

select eno, ename
from employee;
/*테이블의 구조 (컴럼면 , 자료형식,null허용여부)*/
DESCRIBE employee;
desc employee;

/*컬럼에 산술 연산자 적용하기*/
/*NUMBER(7,2) : 전체 7자리 소수점 2자리로 표현*/
select salary from employee;
select salary, 
salary + 300, 
salary -300,
salary * 300,
salary / 300
from employee;

select ename, salary, commission from employee;
/*컬럼이름 Alias (별칭), */
select ename, salary, salary as 연봉 from employee;
select ename, salary 월급, salary *12 연봉 from employee;
select ename 사원명, salary 월급, salary *12 "연 ?봉" from employee;

select ename, salary, commission from employee;
select ename, salary, salary*12 + commission 전체연봉 from employee;
/*nvl함수 : 컬럼의 null을 처리해주는 함수*/
select ename, salary, nvl(commission, O) from employee;
select ename, salary, commission, salary*12 + nvl(commission,O) 전체연봉 from employee;

/*컬럼의 중복을 제거, DISTINCT */
select dno from employee;
select distinct dno from employee;

/*월급이 1500 이상인 직원만 출력, Where 조건 */
select * from employee
where salary >=1500;

/*부서번호(dno) 가 10인 사원을 출력 */
select * from employee
where dno = 10;

select eno 사원번호, ename 사원이름, salary 월급 from employee
where salary = 1500;

select eno 사원번호, ename 사원이름, salary 월급 from employee
where salary >= 1500;

select eno 사원번호, ename 사원이름, salary 월급 from employee
where salary <= 1500;

select eno 사원번호, ename 사원이름, salary 월급 from employee
where salary <> 1500;

/*문자 데이터 검색하기*/
select * from employee
where ename = 'SCOTT';

desc employee

/*날짜 데이터 가져오기*/
select * from employee
where hiredate >= '1985/01/01';

/* 논리 연산자(and, or, not) 사용하기 */

/*소속부서(dno)가 10인 직원의 직급이MANAGER인 사람을 출력 */
select * from employee 
where dno=10 and job='MANAGER';

select * from employee 
where job = 'MANAGER';

select * from employee
where dno=10 or job = 'MANAGER';
/*부서가 10이 아닌 모든 직원들*/
select * from employee
where not dno = 10;

select * from employee
where dno<>10;
/*월급이 1000만원 이상 1500만원 사이인 직원들*/
select * from employee
where salary >= 1000 and salary <= 1500;
/*월급이 1000만원 초과 1500만원 미만*/
select * from employee
where salary < 1000 or salary > 1500;

select * from employee
where commission = 300 or  commission = 500 or commission = 1400;

/*BETWEEN 연산자 사용 : between A and B <<== A와 B 사이*/
select * from employee
where salary between 1000 and 1500;

/*BETWEEB  연산자를 이렇게 바꿀수있다.*/
select * from employee
where salary > 1000 and salary < 1500;

select * from employee
where salary not between 1000 and 1500;

select * from employee
where hiredate between '1982/01/01' and '1982/12/31';

select * from employee
where hiredate >= '1982/01/01' and hiredate <= '1982/12/31';

/*IN 연산자를 사용한 검색, (여러개의 값을 한꺼번에 검색)*/
select * from employee
where commission in (300, 500, 1400);

/*위에 검색은 or를 써서 검색할때 아래와 같이 길어짐*/
select * from employee
where commission = 300 or commission = 500 or commission = 1400;

select * from employee
where commission not in (300, 500, 1400);

select * from employee
where commission <> 300 and commission <> 500 and commission <>  1400;

/*LIKE : 와일드 카드를 사용한 검색 
( %: 어떤 문자가 와도 상관없다.
_ : 하나의 문자가 어떤 값이 와도 상관없다.
*/

select * from employee
where ename like '%L%';

/*=를 사용하면 안된다. =는 같다라는 의미이기 때문에*/
select * from employee
where ename = '%A%';


select * from employee
where ename like '%M%';

select * from employee
where ename like '%N';

select * from employee
where ename like '_A%';

select * from employee
where ename like '__A%';

/*ename에 A가 들어가 있지 않은사람만 골라내기*/
select * from employee
where ename not like '%A';







