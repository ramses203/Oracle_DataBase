/*Join*/

select * from department; --�μ����̺�(DNO : �μ��� �ڵ�, DNAME : �μ���, LOC �μ��� ��ġ)
select * from employee; -- ������̺�(DNO: �μ��� �ڵ�,  ENO: ���,  JOB: ��å,  Manager: ���)

select dno, eno, ename --7788 ����� �μ��ڵ带 ���(20)
from employee
where eno = 7788

select dname, dname           -- 
from department
where dno=20;

select * from department;
select * from employee;

/*ī��þ� ��: */
select * 
from department, employee
order by department.dno, ename;

--JOIN �ϴ� ����
--step 1 : �����̺��� ������ Ű�÷��� where ������ = �� ����ؼ� �˻��Ѵ�.
select * 
from department, employee
where department.dno = employee.dno;

--step 2 : and �����ϱ� : eno �÷��� ���� 7788�� ����� ���� ���
select  * 
from department, employee
where department.dno = employee.dno
and eno = 7788;

--EQUL JOIN : where ���� = �� ����� JOIN
--step 3 : ���ϴ� �÷��� ����Ѵ�.
select eno, ename, dname,department.dno
from department, employee
where department.dno = employee.dno
and eno = 7788;


select eno,ename,dname,department.dno      --dno �÷��� �����̺� ��� �����ϴ� �÷�
from department, employee
where department.dno = employee.dno
and eno = 7788;


/*���̺� ��Ī ����ϱ�*/
select employee.eno, employee.ename, department.dname, department.dno
from department, employee
where department.dno = employee.dno
and eno = 7788;

select e.eno, e.ename, d.dname, d.dno
from department d, employee e
where d.dno = e.dno
and e.eno = 7788;

/*NATURAL JOIN : Oracle 9i ����
EQUI JOIN �� where �� ���� : �� ���̺��� ������ Ű�÷� "="
-����Ű �÷��� �ڵ����� �����ؼ� �۵�
-���� Ű �÷��� ��Ī�̸��� ����ϸ� ����
*/

select e.eno, e.ename, d.dname, dno  --dno �÷��� ��Ī�̸��� ����ϸ� ����
from employee e natural join department d
where e.eno=7788;

/*EQUI JOIN���� USING �� ����ϴ� ���*/
--NATURAL JOIN �� �����̺��� ������ Ű �÷��� ������ ������ Ÿ���̿��� �Ѵ�.
--�� ���̺� ���� Ű �÷��� ������ Ÿ���� �ٸ� ��� USING �� ����Ѵ�.
select eno, ename, dname, dno
from employee e join department d
using (dno)
where e.eno = 7788;

/*EQUI JOIN �� ON �� ���*/
select e.eno, e.ename, d.dname, e.dno
from employee e join department d
on e.dno = d.dno
where e.eno = 7788;

/*NON EQUI JOIN : 
- where ������ "=" �� ������� �ʴ� JOIN*/

select * from salgrade;

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

/*3���� ���̺� ����*/
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno       --�� ���̺��� ���� Ű�÷�
and salary between losal and hisal;

select * from salgrade;

select ename, salary, grade
from employee, salgrade
where salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and salary between losal and hisal;


/*Self JOIN :  �ڽ��� ���̺��� �ڽ��� ����, �ַ� ����� ��縦 ���*/
select e.ename ����̸�, m.ename ���ӻ���̸� 
from employee e, employee m
where e.manager = m.eno;


/*JOIN ~ ON ���� ����� SELF JOIN
ANSI ȣȯ���� JOIN : ��� DBMS���� ��밡���� JOIN ����
ON���� ���� Ű �÷��� ���.*/
select e.ename || '�� ���� ����� ' || m.ename
from employee e join employee m
on e.manager = m.eno;

/*OUTER JOIN*/
-- Ư�� �÷��� ������ �����̺��� ���������� ���� ���뵵 ����ؾ� �ɶ� , NULL���
-- + ��ȣ�� ����� OUTER JOIN
-- ANSI ȣȯ�� ���� OUTER JOIN
select eno, ename, manager from employee;

select e.ename || ' �� ���� ����� ' || m.ename
from employee e join employee m
on e.manager = m.eno(+);

/*ANSI ȣȯ OUTER JOIN
Left Outer JOIN : �������̺��� ������ ������ ���
Right Outer JOIN : ������ ���̺��� ������ ������ ���
Fuul Outer JOIN : ����, ������ ���̺� ������ ��� ���
*/

select e.ename || '�� ���ӻ���� ' || m.ename 
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

