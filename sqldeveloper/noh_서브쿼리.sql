select round(avg(sal)) 
from emp;

select ename, sal 
from emp 
where sal < (select round(avg(sal)) from emp );

-- ������ ���� ���� ����� ���� ��ȸ
select ename, sal 
from emp
where sal = (select max(sal) from emp );

-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ
select *
from emp
where sal > (select round(avg(sal)) from emp )
    and sal < (select max(sal) from emp );

-- ext�� ��� �ѹ���
select*
from emp e,
    ( select round(avg(sal)) avg, max(sal) max from emp )ext
where e.sal > ext.avg and e.sal < ext.max;
    
-- ���޼����� ���� 10���� ����� ���
select ename, sal
from emp
where rownum < 11
order by sal desc; --�߸��� sql

select e.*
from(select ename, sal from emp order by sal desc) e
where rownum <11;

------------------------------------------------------------------------------------------------------------------------------------

--[����]��������

-- 1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select sal from emp where ename='SCOTT';

select empno, ename, job, sal
from emp
where sal >(select sal from emp where ename='SCOTT');

-- 2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
select min(sal) �ּұ޿� from emp where deptno =30;

select deptno �μ�, min(sal) �ּұ޿�
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno =30);

-- 3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���

select job ����, avg(sal) �ּұ޿�
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job );

-- 4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE empno = 7521 ) s1,
( SELECT * FROM emp WHERE empno = 7934 ) s2
WHERE e.job = s1.job AND e.sal > s2.sal;

-- 5. 'WARD'�� �μ��� ������ ���� ��� ��� ���
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE ename = 'WARD' ) s
WHERE e.deptno = s.deptno AND e.job = s.job;

------------------------------------------------------------------------------------------------------------------------------------

-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);

insert into emp(empno, ename, job, sal) values(9999,'�׽�Ʈ','CLERK',1250);

-- 10�� �μ� ������� ������ ������ ������ �˻�
select job from emp where deptno=10

select ename, job
from emp
where job = ANY(select job from emp where deptno= 10); --ANY�� �Ⱦ���

select ename, job
from emp
where job in(select job from emp where deptno= 10);

-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
select empno, ename, job
from emp e1
where exists (select * from emp e2 where e1.empno=e2.mgr);
-- FORD / BLAKE /KING /JONES /SCOTT /CLARK

-- �ٸ� ���
select e3.empno, e3.ename, e3.job
from emp e3
where e3.empno in (select e1.empno from emp e1,emp e2 where e1.empno = e2.mgr);

select e.empno, e.ename, e.job
from emp e
where e.empno in (select e1.empno 
            from emp e1 inner join emp e2 
            on e1.empno = e2.mgr);

-- ����� ���
select empno, ename, job
from emp e1
where  not exists (select * from emp e2 where e1.empno=e2.mgr);

------------------------------------------------------------------------------------------------------------------------------------

-- INSERT / UPDATE / DELETE����

-- (1) �μ��� �޿���� ���̺� ����

create table stat_salary ( 

stat_date date not null, -- ��¥
dept_no number, -- �μ�
emp_count number, -- �����
tot_salary number, -- �޿��Ѿ�
avg_salary number ); -- �޿����

DESC stat_salary;

select sysdate, deptno from emp GROUP BY deptno;

INSERT INTO stat_salary(stat_date, dept_no)
    select sysdate,deptno from emp GROUP BY deptno;
    
select * from stat_salary;

(2) ��¥�� �μ���ȣ �Է�
select hire_
from
where

(3) �����, �޿��Ѿ�, ��ձ޿� �Է�(?) -> ����
select count(*), sum(sal), round(avg(sal)) from emp group by deptno

update stat_salary ss
set (emp_count, tot_salary, avg_salary)
    =(select count(*), sum(sal), round(avg(sal))
        from emp e
        where ss.dept_no =e.deptno
        group by deptno);

select * from stat_salary;

create table emp_cp as select* from emp;
select * from emp_cp;

-- �μ����� 'sales'�� ����� ���� ���� (emp_cp)
select * from dept where dname='sales';
select * from emp_cp where deptno=30;
select e.* from emp_cp e,dept d
    where e.deptno =(select d.deptno from dept d where d.dname='sales')
    and e.deptno= d.deptno;
delete from emp_cp e
    where e.deptno = (select d.deptno from dept d where d.dname='sales');
    
-------------------------------------------------------------------------------   
[����]

-- 11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���
select ename �̸�, job ����, sal �޿�
from emp
where sal in (select sal from emp where ename='SCOTT'or ename='WARD');

?-- 12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���
select ename �̸�, job ����
from emp
where job in (SELECT job from emp a, dept b where a.deptno = b.deptno and loc='CHICAGO');

-- 13. �μ���(group by)�� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
select a.deptno �μ���ȣ, a.ename �̸�, a.sal �޿�
from emp a,(select deptno, trunc(avg(sal)) avg from emp group by deptno) b 
where a.deptno = b.deptno and a.sal > b.avg;



