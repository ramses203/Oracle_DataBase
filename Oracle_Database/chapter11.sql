/*뷰의 필요성 : 1. 보안 - 실체 테이블의 특정컬럼만 view 저장, 특정레코드,
               2. 편의성 - 복잡한 JOIN 쿼리를 view 에 저장해서 사용. */
               
create table emp_second
as
select *
from employee;

create table dept_second
as
select *
from department;

create view v_emp_job(사번, 사원이름, 부서번호, 담당업무)
as
select eno, ename, dno, job
from emp_second
where job like 'SALESMAN';

select * 
from v_emp_job;

create view v_emp_job2
as
select *
from emp_second
where job like 'SALESMAN';

create view v_emp_complex
as
select * 
from emp_second natural join dept_second;

create view v_emp_sample
as
select eno, ename, job, manager,dno
from emp_second;

create view v_emp_complex2
as
select e.eno, e.ename, e.salary, dno, d.dname, d.loc
from emp_second e natural join dept_second d;

select view_name, text
from user_views;

insert into v_emp_job
values(8000, '윤정화', 30, 'SALESMAN');

create view v_emp_salary
as
select dno, sum(salary) as "sal_sum", avg(salary) as "sal_avg"
from emp_second
group by dno;

create view emp_salary2
as
select dno, sum(salary), avg(salary)
from emp_second
group by dno;

insert into v_emp_salary
values(8000, 1000, 300);

drop view v_emp_job2;

create or replace view v_emp_job2
as
select eno, ename, dno, job
from emp_second
where job like 'MANAGER';

create or replace FORCE view v_emp_notable
as
select eno, ename, dno, job
from emp_notable
where job like 'MANAGER';

create or replace view v_emp_job_nochk;
as
select eno, ename, dno, job
from emp_second
where job like 'MANAGER';

insert into v_emp_job_nochk
values(9000, '김주현', 30, 'SALESMAN');

create or replace view v_emp_job_chk
as
select eno, ename, dno, job
from emp_second
where job like 'MANAGER' with check option;

insert into v_emp_job_chk
values(9000, '김주현', 30, 'MANAGER');

create or replace view v_emp_job_readonly
as
select eno, ename, dno, job
from emp_second
where job like 'MANAGER' with read only;

insert into v_emp_job_readonly
values(9000, '김주현', 30, 'MANAGER');



/*혼자해보기*/

create view v_em_dno
as
select eno, ename, dno
from emp_second
where dno = 20;

create or replace view v_em_dno
as
select eno, ename, dno, salary
from emp_second
where dno = 20;

drop view v_em_dno;


