desc department;              /*���̺��� ������ ������� */
select * from department;

desc employee;
select * from employee;

select eno, ename
from employee;
/*���̺��� ���� (�ķ��� , �ڷ�����,null��뿩��)*/
DESCRIBE employee;
desc employee;

/*�÷��� ��� ������ �����ϱ�*/
/*NUMBER(7,2) : ��ü 7�ڸ� �Ҽ��� 2�ڸ��� ǥ��*/
select salary from employee;
select salary, 
salary + 300, 
salary -300,
salary * 300,
salary / 300
from employee;

select ename, salary, commission from employee;
/*�÷��̸� Alias (��Ī), */
select ename, salary, salary as ���� from employee;
select ename, salary ����, salary *12 ���� from employee;
select ename �����, salary ����, salary *12 "�� ?��" from employee;

select ename, salary, commission from employee;
select ename, salary, salary*12 + commission ��ü���� from employee;
/*nvl�Լ� : �÷��� null�� ó�����ִ� �Լ�*/
select ename, salary, nvl(commission, O) from employee;
select ename, salary, commission, salary*12 + nvl(commission,O) ��ü���� from employee;

/*�÷��� �ߺ��� ����, DISTINCT */
select dno from employee;
select distinct dno from employee;

/*������ 1500 �̻��� ������ ���, Where ���� */
select * from employee
where salary >=1500;

/*�μ���ȣ(dno) �� 10�� ����� ��� */
select * from employee
where dno = 10;

select eno �����ȣ, ename ����̸�, salary ���� from employee
where salary = 1500;

select eno �����ȣ, ename ����̸�, salary ���� from employee
where salary >= 1500;

select eno �����ȣ, ename ����̸�, salary ���� from employee
where salary <= 1500;

select eno �����ȣ, ename ����̸�, salary ���� from employee
where salary <> 1500;

/*���� ������ �˻��ϱ�*/
select * from employee
where ename = 'SCOTT';

desc employee

/*��¥ ������ ��������*/
select * from employee
where hiredate >= '1985/01/01';

/* �� ������(and, or, not) ����ϱ� */

/*�ҼӺμ�(dno)�� 10�� ������ ������MANAGER�� ����� ��� */
select * from employee 
where dno=10 and job='MANAGER';

select * from employee 
where job = 'MANAGER';

select * from employee
where dno=10 or job = 'MANAGER';
/*�μ��� 10�� �ƴ� ��� ������*/
select * from employee
where not dno = 10;

select * from employee
where dno<>10;
/*������ 1000���� �̻� 1500���� ������ ������*/
select * from employee
where salary >= 1000 and salary <= 1500;
/*������ 1000���� �ʰ� 1500���� �̸�*/
select * from employee
where salary < 1000 or salary > 1500;

select * from employee
where commission = 300 or  commission = 500 or commission = 1400;

/*BETWEEN ������ ��� : between A and B <<== A�� B ����*/
select * from employee
where salary between 1000 and 1500;

/*BETWEEB  �����ڸ� �̷��� �ٲܼ��ִ�.*/
select * from employee
where salary > 1000 and salary < 1500;

select * from employee
where salary not between 1000 and 1500;

select * from employee
where hiredate between '1982/01/01' and '1982/12/31';

select * from employee
where hiredate >= '1982/01/01' and hiredate <= '1982/12/31';

/*IN �����ڸ� ����� �˻�, (�������� ���� �Ѳ����� �˻�)*/
select * from employee
where commission in (300, 500, 1400);

/*���� �˻��� or�� �Ἥ �˻��Ҷ� �Ʒ��� ���� �����*/
select * from employee
where commission = 300 or commission = 500 or commission = 1400;

select * from employee
where commission not in (300, 500, 1400);

select * from employee
where commission <> 300 and commission <> 500 and commission <>  1400;

/*LIKE : ���ϵ� ī�带 ����� �˻� 
( %: � ���ڰ� �͵� �������.
_ : �ϳ��� ���ڰ� � ���� �͵� �������.
*/

select * from employee
where ename like '%L%';

/*=�� ����ϸ� �ȵȴ�. =�� ���ٶ�� �ǹ��̱� ������*/
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

/*ename�� A�� �� ���� ��������� ��󳻱�*/
select * from employee
where ename not like '%A';







