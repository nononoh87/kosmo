--5. 조인
-- 하나 이상의 테이블로부터 데이터를 검색할 때

--사원테이블(emp)에 사원명과 부서테이블(dept)에 그 사원의 부서명을 출력
SELECT ename, dname
FROM    emp, dept;

--내부조인
SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE e.deptno = d.deptno; --옛날방식

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e INNER JOIN dept d
on e.deptno = d.deptno;

--외부 조인 : 
SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE e.deptno = d.deptno(+);   --안됨

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e LEFT OUTER JOIN dept d
WHERE e.deptno = d.deptno;

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e RIGHT OUTER JOIN dept d
WHERE e.deptno = d.deptno;

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
WHERE e.deptno = d.deptno;

--사원테이블(emp)에 각 사원의 매니저를 조회
SELECT e1.empno empno1, e1.ename ename1, e1.mgr mgr1, e2.empno empno2, e2.ename ename2
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

SELECT e1.empno empno1, e1.ename ename1, e1.mgr mgr1, e2.empno empno2, e2.ename ename2
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;
----------------------------------------------------------------------------

--[#] 집합(SET)

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    --SMITH / ADAMS / JAMES / MILLER
    --UNOON --합집합
   UNION ALL --합집합에 중복되는 교집합 두 번 출력
    --INTERSECT --교집합
    --MINUS --차집합
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
    --CLARK / KING / MILLER
------------------------------------------------------------------------------

[연습]조인

--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
select e.empno empno1, e.ename ename1, e.job job1, e.deptno deptno1, 
        d.dname dname1, d.loc loc1
from emp e left join dept d
on e.deptno = d.deptno;
?
--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력
select e.empno empno1, e.ename ename1, e.sal sal1, d.dname, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

?--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
select e.ename ename1, d.dname dname1, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.comm>=0;
?
--4. 부서별 부서명과 급여 합계를 출력
select d.dname dname1, sum(e.sal) sumsal1
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;
?
-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력
select e.ename ename1, e.job job1, d.dname dname1, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'MANAGER';

-------------------------------------------------------------------------------

--<스키마>
--※ 밑줄친 속성은 기본키(Primary Key)이며 ENROLL의 학번은 STUDENT의 학번을 참조하는 
--외래키(Foreign Key)이고, ENROLL의 강좌번호는 CLASS의 강좌번호를 참조하는 외래키이다. 

--STUDENT(학번 , 학과, 이름) 
--CLASS(강좌번호, 시간, 강좌이름) 
--ENROLL(학번, 강좌번호, 학점)

--SQL-문제-1) 아래 스키마를 보고 평점이 3.0 이상인 학생들의 이름을 보여주는 SQL작성하시오

SELECT s.이름
FROM student s, class c, enroll e
WHERE s.학번=e.학번
and c.강좌번호=e.강좌번호
and e.학점 >= 3.0;

SELECT S.NAME
FROM ENROLL E FULL OUTER JOIN STUDENT S
ON E.NUM=S.NUM
FULL OUTER JOIN CLASS C
ON E.BUN=C.BUN
WHERE E.HAKJUM>=3.0;

SQL-문제-2) 다음 중 아래와 같은 테이블에서 Full Outer Join의 결과를 작성하시오
SELECT E.DEPTNO, E.DNAME, D.DEPTNO, D.DNAME 
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

<DEPT>
DEPTNO DNAME
--------------------
10 RESERCH
30 SALES
30 KING
40 WARD
