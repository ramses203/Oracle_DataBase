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



