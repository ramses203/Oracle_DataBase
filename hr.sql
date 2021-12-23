-- ��ü��� ����ϱ�
select * from employee;

-- �����ȣ�� ����� ����ϱ�
select eno, ename from employee;

-- �������ϱ�
select ename, salary, salary*12 from employee;

-- Ŀ�̼� ���� ���� ���ϱ�
select ename, salary, salary*12+commission from employee;

-- distinct�� �ߺ��� �����͸� �ѹ����� ����ϱ�
select DISTINCT dno from employee;

-- dual ���̺�l ���� ���캸��
desc dual;

-- dummy �÷� �� Ȯ���ϱ�
select * from dual;

-- ���� ��¥ ����ϱ�
select sysdate from department;

-- ���� ��¥ �ѹ� ����ϱ�
select sysdate from dual;

-- �޿�(salary)�� 1500 �̻��� ��� ����ϱ�
select salary from employee where salary >= 1500;

-- 10�� �μ� �Ҽ� ��� ����ϱ�
select dno, ename from employee where dno = 10;

-- scott�� Į������ �����ϰ� ������ �߻��� ��
select * from employee where ename = 'SCOTT';

-- �Ի���(hiredate)�� '1981/01/01' ������ ����� ����ϱ�
select * from employee where hiredate <= '1981/01/01';

-- �μ���ȣ�� 10�̰� ������ 'manager' �� ����� ����ϱ�
select * from employee where dno=10 and job='MANAGER';

-- �μ���ȣ�� 10�̰ų� ������ 'manager' �� ����� ����ϱ�
select * from employee where dno=10 or job='MANAGER';

-- NOT�� �̿��� ���� �����ϱ�
select * from employee where not dno=10;

-- <> �� �̿��� ���� �����ϱ�
select * from employee where dno <> 10;

-- �޿��� 1000���� 1500������ ��� ����ϱ�
select * from employee where salary >= 1000 and salary <= 1500;

-- �޿��� 1000�̸��̰ų� 1500�ʰ��� ��� ����ϱ�
select * from employee where salary < 1000 or salary > 1500;

-- Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ��� ����ϱ�
select * from employee where commission=300 or commission=500 or commission=1400; 

-- between and ������ ����ؼ� 1000���� 1500������ ����� ����ϱ�
select * from employee where salary BETWEEN 1000 and 1500;

-- not between and ������ ����ϱ�
select * from employee where salary not between 1000 and 1500;

-- in �����ڸ� ����ؼ� Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� �˻��ϼ���
select * from employee where commission in(300,500,1400);

-- commission�� 300, 500, 1400�� ��� �ƴ� ����� �˻��ϱ� ���ؼ� <> �����ڸ� ����� ������.
select * from employee where commission<>300 and commission<>500 and commission<>1400;

-- commission�� 300, 500, 1400�� ��� �ƴ� ����� �˻��ϱ� ���ؼ� not in �����ڸ� ����� ������.
select * from employee where commission not in(300,500,1400);

-- ��� ���̺��� F�� �����ϴ� �̸��� ���� ����� �˻��ϼ���
select * from employee where ename like 'F%';

-- ��� ���̺��� M�� �����ϴ� �̸��� ���� ����� �˻��ϼ���
select * from employee where ename like 'M%';

-- ��� ���̺��� N�� ������ �̸��� ���� ����� �˻��ϼ���
select * from employee where ename like '%N';

-- ��� ���̺��� �̸��� M�� ���ԵǾ� �ִ� ���� ����� �˻��ϼ���
select * from employee where ename like '%M%';

-- ��� ���̺��� �̸��� �ι�° ���ڰ� 'A'�� ����� �˻��ϼ���
select * from employee where ename like '__A%';

-- ��� �̸��� A�� ���Ե��� ���� ����� �˻��Ͻÿ�
select * from employee where ename not like '%A%';

-- ����� Ŀ�̼��� ����Ͻÿ�
select ename, dno, commission from employee;

-- Ŀ�̼��� null�� ����� ã�µ� �����ϴ� ��
select * from employee where commission is null;

-- �÷� ���� null�� �ƴ��� ��ȸ�ϱ�
select * from employee where commission is not null;







