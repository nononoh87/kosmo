--[오라클] 뷰, 인덱스, 시퀀스

-- 7. 뷰(VIEW)
--  데이터 보안
--  복잡한 쿼리의 사용빈도가 높은 경우

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
select * from v_emp;
DESC v_emp;

insert into v_emp values(1000,'홍길동', 20);
select * from v_emp;
select * from emp;

insert into v_emp values(1000,'홍홍이', 20); -- PK조건에 걸려서 오류

insert into v_emp values(1000,'홍홍이', 90); -- FK조건에 걸려서 오류

CREATE OR REPLACE VIEW v_emp  AS          
           select empno, ename, deptno from emp
           with read only;   -- 원본테이블의 손상을 막으려고 일부러 읽기 전용으로 만듬.
           
insert into v_emp values(2000,'홍홍이', 30);

------------------------------------------------------------------------------
           
--[ 연습 ] EMP 테이블에서 30번 부서만 

--EMPNO를 EMP_NO로 ENAME을 NAME로 SAL를 SALARY로 바꿔서 
--EMP_30 뷰를 생성하시오

CREATE OR REPLACE VIEW v_emp_30 AS
           select empno EMP_NO, ename ENAME, sal SALARY
           from emp
           where deptno=30
           with read only;

SELECT * FROM v_emp_30;

-- (3) 복합뷰
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT * FROM v_emp_info;

insert into v_emp_info(empno, ename, dname) values (3333,'맹꽁이',30); --입력이 안됨
insert into v_emp_info(empno, ename) values (3333,'맹꽁이');
delete from v_emp_info where empno = 7788; -- 뷰는 읽기전용으로 만들어야함.

-- [ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
Create or replace view v_dept_sum as
select d.dname, min(sal) emin, max(sal) emax, round(avg(sal)) eavg 
from emp e left outer join dept d
      on e.deptno=d.deptno
group by d.dname
with read only;

select * from v_dept_sum;

-- RESEARCH     1000        5000        3000
insert into emp (empno, ename, sal, deptno) values(4444,'호이', 9900, 20); -- PK조건에 걸려서 오류

-------------------------------------------------------------------------------

-- 8. 시퀀스 (sequence) : 자동증가수

--* 시퀀스에 사용되는 의사컬럼
--      CURRVAL : 현재 시퀀스 값
--      NEXTVAL : 다음 생성될 시퀀스 값

create sequence seq_temp;
SELECT seq_temp.NeXTVAL FROM dual;

SELECT seq_temp.CURRVAL FROM dual;

-- 5000번부터 10씩 증가하는 자동증가수 (시퀀스)
create sequence seq_temp2
    start with 5000 increment by 10;

insert into emp (empno, ename) values(seq_temp2.nextval,'박씨');

DESC EMP;

-------------------------------------------------------------------------------

--9. 인덱스 (INDEX) - 빠른 검색을 위해

--[ 참고 ] rowid 확인
--  select empno, ename, job, rowid from emp;
-- [참고] hr계정


    
    



