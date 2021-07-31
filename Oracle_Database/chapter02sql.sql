--대소문자 변환함수
SELECT
    'Oracle mania',
    upper('Oracle mania'),
    lower('Oracle mania'),
    initcap('Oracle mania')
FROM
    dual;

SELECT
    ename,
    lower(ename),
    upper(ename),
    job,
    initcap(job)
FROM
    employee;
    
select eno, ename, dno from employee
where lower(ename) = 'scott';

/*문자길이 반환 함수*/
--length : 글자수를 반환
--lengthb : bute, 유니코드, 

select length ('OracleMania'), ('오라클매니아')
from dual;

select * from employee;
select ename, length (ename), lengthb(ename) from employee;

/*문자 조작 함수*/
select 'Oracle', 'mania', concat('Oracle', 'mania') from dual;
select * from employee;
select concat (ename,job) 성함직책 from employee;

/*SUCSTR (대상, 시작위치, 추출할 개수)* : 문자열을 잘라온다.*/
select substr('Oracle mania', 4, 3),
        substr('Oracme mania', -4, 3)
        from dual;
        
select ename, substr (ename, 1, 3) from employee;
select ename, substr (ename, -3, 3) from employee;

select * from employee
where substr(ename, -1,1) = 'N';

select * from employee
where substr(hiredate ,1, 2) = '87';

select * from employee
where substr(hiredate ,4, 2) = '09';

select substr ('Oracle mania', 4, 3),
        substrb ('Oracle mania',4, 3)
        from dual;
        
select substr('오라클매니아' ,4,3),
        substrb('오라클매니아' ,4,6)
        from dual;
        
/*INSTR (대상, 찾을글자, 시작위치, 몇번쨰 발견)*/

select INSTR('Oracle mania', 'a') -- a라는 글자가 3번째에 위치한다.
from dual;

select INSTR('Oracle mania', 'a', 5,2) --a를 검색하는데 5번째 자리에서부터 검색한다.2번째로 위치한 a를 출력할꺼다.
from dual;

/*INSTRb : 찾을 글자의 byte*/
select INSTR('오라클매니아', '라'),
        instrb('오라클매니아', '라')
from dual;

select * from employee
where INSTR(ename, 'R',3,1) = '3'; --이름에 3번쨰 자리에 R이 들어간 직원검색

/*LPAD : 왼쪽자리를 특정기호로 채우기*/
select salary, LPAD(salary, 10, '*') from employee;

/*RPAD : 오른쪽자리를 특정기호로 채우기*/

/*공백 제거하기*/
--LTRIM : 왼쪽의 공백을 제거
--RTRIM : 오른족의 공백을 제거

select ' Oracle mania '원본,
LTRIM(' Oracle mania ')왼쪽공백제거,
RTRIM(' Oracle mania ')오른쪽
from dual;

/*특정 문자 제거: TRIM*/
select 'Oracle mania',
TRIM('O' FROM 'Oracle mania')
from dual;

select TRIM(' Oracle mania ')공백제거
from dual;

select * from employee;
select ename, TRIM('S' from ename)s제거
from employee
where ename like '%S%';

/*ROUND (대상, 자릿수) : 특정자리에서 반올림*/

select 98.7654,
ROUND(98.7654),      --소숫점첫번째자리에서 반올림
ROUND(98.7654, 2),  --소숫점 두번째자리에서 반올림
ROUND(98.7654,-1)   --정수 일의자리에서 반올림
from dual;

/*TRUNC 잘라내기*/
select 98.7654,
TRUNC(98.7654),
TRUNC(98.7654,2),
TRUNC(98.7654,-1)
from dual;

/*MOD : 나머지 반환하기*/
select MOD(31,2),
MOD(31,5),
MOD(31,8)
from dual;

/*나머지 구하기*/

select ename, salary, MOD(salary,500)월급나누기500
from employee;

/*현재날짜 출력하기*/
select sysdate from dual;

select sysdate,
sysdate -1, --어제날짜
sysdate,--오늘
sysdate+1 --내일날짜
from dual;

/*날짜에 Round 함수 적용하기*/
--ROUND (date, format) : 날짜에 대해 반올림 힙니다.
select SYSDATE 오늘날짜, HIREDATE 입사날짜, ROUND(SYSDATE-HIREDATE)근무일수
from employee;

/*TRUNC(date, format): 날짜를 잘라낸다.*/
/*특정날짜(DATE)에서 월(MONTH)을 기준으로 버림한 날짜 구하기*/
select hiredate,
TRUNC(HIREDATE,'MONTH')--MONTH 까지만 출력후 일수는 모두 버림
from employee;

/*MONTHS_BTWEEN(date1, date2)*/
select ename, sysdate, hiredate,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
from employee;

/*ADD_MONTHS(date,n): 측정대월수를 더한 날짜를 구하는 함수입니다.*/
select ename, hiredate,
ADD_MONTHS(HIREDATE, 6)
from employee;

/*NEXT_DAY 함수는 해당날짜를 기준으로 최초로 도래하는 요일에 해당되는날짜를 반환*/
select SYSDATE,
NEXT_DAY(TRUNC(SYSDATE), '토요일')
from dual;

/*LAST_DAY 합수는 해당날짜가 속한 달의 마지막 날짜를 반환하는 함수입니다.*/
select ename, hiredate,
LAST_DAY(HIREDATE)
from employee;

select ename, salary, commission,
NVL2(commission, salary*12+commission, salary*12)
from employee
order by job;

/*NULLIF 함수: 두인자의 값이 동일할경우 NULL을 반환하고 두인자의 값이 다를경우 : expr1을 반환해준다.
NULLIF (expr1, expr2): */

select NULLIF('A', 'A'), NULLIF('A', 'B')
from dual;

/*COALESCE 함수 : NULL 이 아닌 첫번째 인수를 반환*/
select COALESCE(null, null, 'A', 'B', 'C')
from dual;

select COALESCE(null, null, null, 'A', 'B', 'C')
from dual;

select COALESCE('BB', null, null, null, 'A', 'B', 'C')
from dual;


select ename, salary, commission, 
COALESCE (commission, salary, 0) 출력결과
from employee
order by job;

/*DECODE 함수 : switch 문과 비슷하다.
DECODE (표현식, 조건1, 결과1, 
                조건2, 결과2,
                조건3, 결과3
                기본결과n)
                
*/

select ename,dno,
        DECODE(dno, 10, 'ACCOUNTING',
                    20, 'RESEARCH',
                    30, 'SALES',
                    40, 'OPERATIONS',
                    'DEFAULT') AS DNAME
from employee
order by dno asc;

/*CASE 함수 : if else 랑 비슷
    CASE expr
        when 조건 1 then 결과1
        when 조건 2 then 결과2
        when 조건 3 then 결과3
        else 결과n
*/

select ename, dno,
CASE when dno=10 then 'ACCOUNTING'
     when dno=20 then 'RESEARCH'
     when dno=30 then 'SALES'
     when dno=40 then 'OPERATION'
     ELSE 'default'
     END DNAME
     from employee
     order by dno asc;
