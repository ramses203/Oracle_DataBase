--��ҹ��� ��ȯ�Լ�
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

/*���ڱ��� ��ȯ �Լ�*/
--length : ���ڼ��� ��ȯ
--lengthb : bute, �����ڵ�, 

select length ('OracleMania'), ('����Ŭ�ŴϾ�')
from dual;

select * from employee;
select ename, length (ename), lengthb(ename) from employee;

/*���� ���� �Լ�*/
select 'Oracle', 'mania', concat('Oracle', 'mania') from dual;
select * from employee;
select concat (ename,job) ������å from employee;

/*SUCSTR (���, ������ġ, ������ ����)* : ���ڿ��� �߶�´�.*/
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
        
select substr('����Ŭ�ŴϾ�' ,4,3),
        substrb('����Ŭ�ŴϾ�' ,4,6)
        from dual;
        
/*INSTR (���, ã������, ������ġ, ����� �߰�)*/

select INSTR('Oracle mania', 'a') -- a��� ���ڰ� 3��°�� ��ġ�Ѵ�.
from dual;

select INSTR('Oracle mania', 'a', 5,2) --a�� �˻��ϴµ� 5��° �ڸ��������� �˻��Ѵ�.2��°�� ��ġ�� a�� ����Ҳ���.
from dual;

/*INSTRb : ã�� ������ byte*/
select INSTR('����Ŭ�ŴϾ�', '��'),
        instrb('����Ŭ�ŴϾ�', '��')
from dual;

select * from employee
where INSTR(ename, 'R',3,1) = '3'; --�̸��� 3���� �ڸ��� R�� �� �����˻�

/*LPAD : �����ڸ��� Ư����ȣ�� ä���*/
select salary, LPAD(salary, 10, '*') from employee;

/*RPAD : �������ڸ��� Ư����ȣ�� ä���*/

/*���� �����ϱ�*/
--LTRIM : ������ ������ ����
--RTRIM : �������� ������ ����

select ' Oracle mania '����,
LTRIM(' Oracle mania ')���ʰ�������,
RTRIM(' Oracle mania ')������
from dual;

/*Ư�� ���� ����: TRIM*/
select 'Oracle mania',
TRIM('O' FROM 'Oracle mania')
from dual;

select TRIM(' Oracle mania ')��������
from dual;

select * from employee;
select ename, TRIM('S' from ename)s����
from employee
where ename like '%S%';

/*ROUND (���, �ڸ���) : Ư���ڸ����� �ݿø�*/

select 98.7654,
ROUND(98.7654),      --�Ҽ���ù��°�ڸ����� �ݿø�
ROUND(98.7654, 2),  --�Ҽ��� �ι�°�ڸ����� �ݿø�
ROUND(98.7654,-1)   --���� �����ڸ����� �ݿø�
from dual;

/*TRUNC �߶󳻱�*/
select 98.7654,
TRUNC(98.7654),
TRUNC(98.7654,2),
TRUNC(98.7654,-1)
from dual;

/*MOD : ������ ��ȯ�ϱ�*/
select MOD(31,2),
MOD(31,5),
MOD(31,8)
from dual;

/*������ ���ϱ�*/

select ename, salary, MOD(salary,500)���޳�����500
from employee;

/*���糯¥ ����ϱ�*/
select sysdate from dual;

select sysdate,
sysdate -1, --������¥
sysdate,--����
sysdate+1 --���ϳ�¥
from dual;

/*��¥�� Round �Լ� �����ϱ�*/
--ROUND (date, format) : ��¥�� ���� �ݿø� ���ϴ�.
select SYSDATE ���ó�¥, HIREDATE �Ի糯¥, ROUND(SYSDATE-HIREDATE)�ٹ��ϼ�
from employee;

/*TRUNC(date, format): ��¥�� �߶󳽴�.*/
/*Ư����¥(DATE)���� ��(MONTH)�� �������� ������ ��¥ ���ϱ�*/
select hiredate,
TRUNC(HIREDATE,'MONTH')--MONTH ������ ����� �ϼ��� ��� ����
from employee;

/*MONTHS_BTWEEN(date1, date2)*/
select ename, sysdate, hiredate,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
from employee;

/*ADD_MONTHS(date,n): ����������� ���� ��¥�� ���ϴ� �Լ��Դϴ�.*/
select ename, hiredate,
ADD_MONTHS(HIREDATE, 6)
from employee;

/*NEXT_DAY �Լ��� �ش糯¥�� �������� ���ʷ� �����ϴ� ���Ͽ� �ش�Ǵ³�¥�� ��ȯ*/
select SYSDATE,
NEXT_DAY(TRUNC(SYSDATE), '�����')
from dual;

/*LAST_DAY �ռ��� �ش糯¥�� ���� ���� ������ ��¥�� ��ȯ�ϴ� �Լ��Դϴ�.*/
select ename, hiredate,
LAST_DAY(HIREDATE)
from employee;








