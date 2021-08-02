/*7�� sub Query : Select �������� Select ���� �ִ� ����*/



select salary
from employee
where ename = 'SCOTT'

select ename, salary
from employee
where salary > select salary
from employee
where ename = 'SCOTT');

--Scott �� ������ �μ��� �ٹ��ϴ� ������� ����ϱ�
select dno
from employee
where ename = 'SCOTT';

select ename, dno 
from employee
where dno = (select dno
from employee
where ename = 'SCOTT');

--�ּұ޿��� �޴� ����� �̸�, ��� ����, �޿� ����ϱ�
select ename, job, salary
from employee
where salary = (select min(salary)from employee);

--���� ������ having : Group by �� ������� ������ ����Ҷ�
select dno, salary
from employee
order by dno;

select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno = 30);
                        
/*������ ������ IN ����ϱ�*/
--�μ���, �ּ� �޿��� �޴� ����� �����ȣ�� �̸��� ����ϴ� ������.
select ename, eno, dno, salary
from employee
order by dno;

select dno, min(salary)
from employee
group by dno

select eno, ename
from employee
where salary in (select min(salary)
                from employee
                group by dno);
                
/*ANY ������*/
-- ���������� ��ȯ�ϴ� ������ ���� ����.
--'< any' �� �ִ밪���� ������ ��Ÿ��
--'> any' �� �ּҰ����� ŭ�� ��Ÿ��                
--'= any' �� IN �� ������

--����) ������ SALEMAN�̸鼭 �޿��� ������ SalesMan ���� ���� ����� ���
        SALESMAN �� �ִ� ���� 1600 ���� ���� ������� ���

select eno, ename, job, salary
from employee
where salary < any(select salary
                    from employee
                    where job = 'SALESMAN')
                    
and job <> 'SALESMAN'

select eno, ename, job, salary from employee
where job = 'SALEMAN';

/*ALL ������ */
--Sub Query�� ��ȯ�ϴ� ��簪�� ��.
--' >all ' : �ִ밪���� ŭ�� ��Ÿ�� 
--' <all ' : �ּҰ����� ������ ��Ÿ��
/*������ SalesMan �� �ƴϸ鼭 ������ SalesMan�� ������� �޿��� ���� ����� ��� ���*/
--1250 ���� ���� ��� ���(������ SALESMAN�� �ƴ�)
select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';        
                 
select salary
from employee
where ename = 'SCOTT';

select ename, salary
from employee
where salary > (select salary
                from employee
                where ename = 'SCOTT');
                
select ename, dno
from employee
where dno = (select dno
            from employee
            where ename = 'SCOTT');

select ename, job, salary
from employee
where salary = (select min(salary) 
                from employee);
                
select dno, min(salary)
from employee
group by dno
having min(salary) > (select min(salary)
                        from employee
                        where dno = 30);
                        
select dno, eno, ename
from employee
where salary = (select min(salary)
                from employee
                )
order by dno;

select max(salary)
from employee
where job = 'SALESMAN';


select eno, ename, job, salary
from employee
where salary < any (select salary
                from employee
                where job = 'SALESMAN')
and job <> 'SALESMAN';

select min(salary)
from employee
where job = 'SALESMAN';


select eno, ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

select ename, job
from employee
where job = (select job
            from employee
            where eno='7788');

select ename, job
from employee
where salary > (select salary
                from employee
                where eno ='7499');

select ename, job, salary
from employee
where salary = (select min(salary)
                from employee);
                
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                        from employee
                        group by job);
                        
select ename, salary, dno
from employee
where salary in (select min(salary)
                from employee
                group by dno
                )
order by dno;


select eno, ename, job, salary
from employee
where salary <ANY (select salary
                from employee
                where job = 'ANALYST' )
and job <> 'ANALYST';

select ename 
from employee
where ename in (select ename
                from employee
                where manager is null);
                
select ename
from employee
where ename in (select ename
                from employee
                where manager is not null);
                
select ename, hiredate
from employee
where dno = (select dno
            from employee
            where ename = 'BLAKE')
and ename <> 'BLAKE';

select eno, ename 
from employee
where salary > (select avg(salary)
                from employee)
order by salary;

select eno, ename
from employee
where dno in (select dno
                from employee
                where ename like '%K%');
                
select ename, dno, job
from employee
where dno = (select dno
                from department
                where loc = 'DALLAS');
                
select ename, salary
from employee
where manager in (select eno
                from employee
                where ename = 'KING');

select dno, ename, job
from employee
where dno = (select dno
                from department
                where dname = 'RESEARCH');


select eno, ename, salary
from employee
where dno in (select dno
              from employee
              where ename like '%M%')
and salary > (select avg(salary)
                from employee
                );


select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                        from employee
                        group by job);
                        
select ename
from employee
where dno in (select dno
            from employee
            where job = 'MANAGER');
            
select ename
from employee
where eno in(select manager
            from employee);
         
                
                
            

