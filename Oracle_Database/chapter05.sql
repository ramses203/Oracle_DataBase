/*������� �޿� �Ѿ�, ��վ�, �ְ��, �ּҾ� ����ϱ�*/
select SUM(salary) as "�޿��Ѿ�",
    AVG(salary) as "�޿����",
    MAX(salary) as "�ִ�޿�",
    MIN(salary) as "�ּұ޿�",
    'aaa' as aaa
from employee;

select ename, salary from employee
order by salary asc;

/*�ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� ����ϱ�*/

select MAX(hiredate)as "���� �ֱ� �Ի���",
        MIN(hiredate) as "���� ������ �Ի���"
from employee;

/*NULL �� �� �÷��� �����Լ� : MAX, MIN, SUM, AVG ���*/
select sum(commission) as "Ŀ�̼� �Ѿ�",
AVG(commission) as "Ŀ�̼� ���",
MAX(commission) as "Ŀ�̼� �ִ밪",
MIN(commission) as "Ŀ�̼� �ּҰ�"
from employee;

select commission, salary from employee;
select salary,commission, nvl(commission,0)+salary as ���Ѱ�
from employee;

/*Count �Լ� : ���ڵ��� ������� ���*/
select count(*) as �ѻ���� from employee; -- ��������

select count (ename) from employee;

select count (commission) from employee;  -- count �Լ��� null�� ó�������ʴ´�.

select commission from employee
where commission is not null;

select count(DISTINCT job) as "���� ����" from employee;

select job from employee;

select DISTINCT job from employee;

/*�׷��Լ�(�����Լ�) �� �ܼ� �÷� ��½� ����*/
--select ename, sum(salary) from employee;

/*Group by ����ϱ�*/
/*�μ����� ��� �޿��� ���*/

select dno as "�μ���ȣ", avg(salary) as "�޿����"
from employee
group by dno; --dno �÷��� ������ ���� �׷����Ѵ�.

select avg(salary) from employee;

select dno as "�μ���ȣ" , salary as �޿� from employee
order by dno asc;

select dno, round(avg(salary)) as �޿���� , sum(salary), min(salary), max(salary)
from employee
group by dno;

select dno, salary from employee
order by dno;

select dno, salary from employee
group by dno;






/*�����÷��� �̿��Ͽ� �׷캰�� �˻��ϱ�*/
select dno, job, count(*), sum(salary)
from employee
group by dno, job    --���÷� ��ο� ���ؼ� �׷���
order by dno, job;

select dno, job, salary from employee
order by dno, job;

/*Group by ������ ���� �˻� : Having*/
--���μ��� ������ �ְ� ���� ���� �����´�.
select dno,count(dno),max(salary)
from employee
group by dno
having max(salary) >=3000 -- Group �� ������ �˻�

--�ְ�޿� ����ϱ� 
select dno salary from employee;

select max(avg(salary))
from employee
group by dno;

select dno, count(dno) avg(dno)
from employee
group by dno;






