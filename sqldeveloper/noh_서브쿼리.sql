select round(avg(sal)) 
from emp;

select ename, sal 
from emp 
where sal < (select round(avg(sal)) from emp );

-- 월급이 가장 많은 사원의 정보 조회
select ename, sal 
from emp
where sal = (select max(sal) from emp );

-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회
select *
from emp
where sal > (select round(avg(sal)) from emp )
    and sal < (select max(sal) from emp );

-- ext로 묶어서 한번에
select*
from emp e,
    ( select round(avg(sal)) avg, max(sal) max from emp )ext
where e.sal > ext.avg and e.sal < ext.max;
    
-- 월급순으로 상위 10명의 명단을 출력
select ename, sal
from emp
where rownum < 11
order by sal desc; --잘못된 sql

select e.*
from(select ename, sal from emp order by sal desc) e
where rownum <11;

------------------------------------------------------------------------------------------------------------------------------------

--[연습]서브쿼리

-- 1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
select sal from emp where ename='SCOTT';

select empno, ename, job, sal
from emp
where sal >(select sal from emp where ename='SCOTT');

-- 2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력
select min(sal) 최소급여 from emp where deptno =30;

select deptno 부서, min(sal) 최소급여
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno =30);

-- 3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력

select job 직업, avg(sal) 최소급여
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job );

-- 4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE empno = 7521 ) s1,
( SELECT * FROM emp WHERE empno = 7934 ) s2
WHERE e.job = s1.job AND e.sal > s2.sal;

-- 5. 'WARD'와 부서와 업무가 같은 사원 명단 출력
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE ename = 'WARD' ) s
WHERE e.deptno = s.deptno AND e.job = s.job;

------------------------------------------------------------------------------------------------------------------------------------

-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);

insert into emp(empno, ename, job, sal) values(9999,'테스트','CLERK',1250);

-- 10번 부서 사원들의 업무와 동일한 직원들 검색
select job from emp where deptno=10

select ename, job
from emp
where job = ANY(select job from emp where deptno= 10); --ANY잘 안쓰임

select ename, job
from emp
where job in(select job from emp where deptno= 10);

-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
select empno, ename, job
from emp e1
where exists (select * from emp e2 where e1.empno=e2.mgr);
-- FORD / BLAKE /KING /JONES /SCOTT /CLARK

-- 다른 방법
select e3.empno, e3.ename, e3.job
from emp e3
where e3.empno in (select e1.empno from emp e1,emp e2 where e1.empno = e2.mgr);

select e.empno, e.ename, e.job
from emp e
where e.empno in (select e1.empno 
            from emp e1 inner join emp e2 
            on e1.empno = e2.mgr);

-- 사원을 출력
select empno, ename, job
from emp e1
where  not exists (select * from emp e2 where e1.empno=e2.mgr);

------------------------------------------------------------------------------------------------------------------------------------

-- INSERT / UPDATE / DELETE에서

-- (1) 부서별 급여통계 테이블 생성

create table stat_salary ( 

stat_date date not null, -- 날짜
dept_no number, -- 부서
emp_count number, -- 사원수
tot_salary number, -- 급여총액
avg_salary number ); -- 급여평균

DESC stat_salary;

select sysdate, deptno from emp GROUP BY deptno;

INSERT INTO stat_salary(stat_date, dept_no)
    select sysdate,deptno from emp GROUP BY deptno;
    
select * from stat_salary;

(2) 날짜와 부서번호 입력
select hire_
from
where

(3) 사원수, 급여총액, 평균급여 입력(?) -> 수정
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

-- 부서명이 'sales'인 사원의 정보 삭제 (emp_cp)
select * from dept where dname='sales';
select * from emp_cp where deptno=30;
select e.* from emp_cp e,dept d
    where e.deptno =(select d.deptno from dept d where d.dname='sales')
    and e.deptno= d.deptno;
delete from emp_cp e
    where e.deptno = (select d.deptno from dept d where d.dname='sales');
    
-------------------------------------------------------------------------------   
[복습]

-- 11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
select ename 이름, job 업무, sal 급여
from emp
where sal in (select sal from emp where ename='SCOTT'or ename='WARD');

?-- 12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력
select ename 이름, job 업무
from emp
where job in (SELECT job from emp a, dept b where a.deptno = b.deptno and loc='CHICAGO');

-- 13. 부서별(group by)로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
select a.deptno 부서번호, a.ename 이름, a.sal 급여
from emp a,(select deptno, trunc(avg(sal)) avg from emp group by deptno) b 
where a.deptno = b.deptno and a.sal > b.avg;



