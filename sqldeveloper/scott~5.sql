--[문항1]
--급여가 2000 이상 3000 이하인 사원의 이름과 사원번호, 입사일, 급여를 출력하되 이름을 오름차순 정렬하세요.
SELECT ename, empno, hiredate, sal
FROM emp
WHERE sal between 2000 and 3000
ORDER BY ename asc;


--[문항2]
--커미션이 NULL 인 사원이름과, 입사일 부서번호를 출력하되 부서번호를 오를차순 정렬하되 부서번호가 같은 항목이 있을 경우 이름을 오름차순으로 정렬하세요.
SELECT ename, hiredate, deptno,comm
From emp
where comm is null
ORDER BY deptno, ename asc;

--[문항3]
-- 커미션이 300 이거나 500 이거나 1400인 사원의 사원번호와 이름, 월급, 커미션을 출력 하되 커미션을 내림차순 정렬하세요.
-- IN 연산자를 사용해서 출력 하세요.
SELECT empno,ename,sal, comm
FROM emp
WHERE comm IN (300,500,1400)
ORDER BY comm desc;

--[문항4]
--이름의 첫 글자가 ’S’로 시작하는 사원의 이름을 출력하세요.
SELECT ename
FROM emp
WHERE ename like 'S%';

--[문항5]
--LIKE 연산자와 와일드 카드를 사용해서 '81'년도에 입사하지 않은 사원의 이름과 입사일을 출력하세요.
select ename, hiredate
from emp
where hiredate not like '81%';

--[문항6]
--부서 번호를 중복 제거후 오름차순으로 정렬해서 출력하세요.
SELECT DISTINCT deptno
FROM emp
ORDER BY deptno asc;

--[문항7]
--이름에 ‘A’  와 ‘E’ 를 모두 포함하는 사원의 이름을 출력하세요.
SELECT ename
FROM emp
WHERE ename like '%A%'
AND ename like '%E%';

--[문항8]
--substr 함수를 사용해서 12월 달에 입사한 사원의 사원번호, 이름, 입사일을 출력하세요.
SELECT empno, ename, hiredate
FROM emp
WHERE substr(hiredate,4,2) = '12'; 

--[문항9] 
--NVL 함수를 사용해서 사원의 연봉을 계산해서 사원이름, 월급, 커미션 , 연봉을 출력하되 연봉이 많은 순서대로 출력하세요.
SELECT ename 이름,sal 월급, NVL(comm, 0)보너스, NVL(sal, 0)*12 연봉  
FROM emp
ORDER BY NVL(sal, 0)*12 desc;

--[문항10]
--NVL2 함수를 사용해서 사원의 연봉을 계산해서 사원이름, 월급, 커미션 , 연봉을 출력하되 연봉이 많은 순서대로 출력하세요.
SELECT ename 이름,sal 월급, NVL(comm, 0)보너스, NVL2(sal,sal, 0)*12 연봉  
FROM emp
ORDER BY NVL2(sal,sal, 0)*12 desc;

--[문항11]
--사원들의 급여 총액 , 평균액, 최고액, 최소액을 출력 하세요. 각 컬럼을 
--“급여총액”, “평균액, “최고액”, “최소액”으로 별칭이름으로 출력하세요.
SELECT sum(sal) 급여총액, ROUND(avg(sal),0) 평균액, min(sal) 최소액, max(sal) 최고액
FROM emp;

--[문항12]
--직업 종류의 갯수를 출력 하세요.  출력컬럼을 “직업 종류의 갯수”로 별칭이름으로 출력 하세요.
SELECT COUNT(DISTINCT job) 직업_종류의_갯수
FROM emp;

--[문항13]
--각 부서별 평균 월급을 구해서 부서번호와 평균 월급을 출력 하되  각각 “부서번호”, “평균월급” 으로 별칭이름으로 출력하세요.
SELECT   deptno 부서번호, ROUND(AVG(sal),0) 평균월급
FROM     emp
GROUP BY deptno;

--[문항14]
--담당 업무가 동일한 사원의 수를 구하시오. (참고 , count 함수 사용)
SELECT   JOB, COUNT(*)
FROM     emp
GROUP BY JOB;

--[문항15]
--직급별 사원의 최저 급여를 출력하시오, 관리자를 알수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외 시키고
--결과를 급여에 대한 내림차순으로 정렬하여 출력 하세요.
SELECT   JOB,MIN(SAL)
FROM     emp
WHERE    MANAGER IS NOT NULL
GROUP BY JOB   
HAVING   MIN(SAL)>2000 
ORDER BY MIN(SAL) DESC;

--[문항16]
--서브 쿼리를 사용해서 사원번호가 7788인 사원과 담당업무가 같은 사원을 출력 하시오  <담당이름, 담당업무> 출력 하시오
SELECT JOB FROM emp WHERE empno=7788;

SELECT   ENAME 담당이름, JOB 담당업무
FROM     emp
WHERE    JOB LIKE (SELECT JOB FROM emp WHERE empno=7788);

--[문항17]
--서브 쿼리를 사용해서 담당업무가 7499 인 사원보다 급여가 많은 사원을 출력 하시오. <사원이름, 담당업무> 출력 하시오.
SELECT   ENAME 사원이름, JOB 담당업무
FROM     EMPLOYEE
WHERE    SALARY > (SELECT SALARY FROM EMPLOYEE WHERE ENO=7499);

--[문항18]
--서브 쿼리를 사용해서 각 부서의 최소 급여를 받는 사원의 이름 , 급여, 부서번호를 출력하시오.
SELECT   ENAME 이름, SALARY 급여, DNO 부서번호
FROM     EMPLOYEE
WHERE    SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

--[문항19]
--서브 쿼리를 사용해서 급여가 평균 급여보다 많은 사원들의 사원보호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
ELECT ROUND(AVG(SALARY),0) AVG FROM EMPLOYEE;

SELECT   ENO 사원번호, ENAME 사원이름
FROM     EMPLOYEE
WHERE    SALARY>(SELECT ROUND(AVG(SALARY),0) AVG FROM EMPLOYEE)
ORDER BY SALARY;

--[문항20]
--서브 쿼리를 사용해서 DEPT 테이블에 있는 부서명 DNAME 컬럼에서  ‘RESEARCH’ 부서의 부서번호, 사원이름 및 담당 업무를 표시하시오.
SELECT   D.DEPTNO, E.ENAME, E.JOB
FROM     EMPLOYEE E, DEPT D
WHERE    E.DNO=D.DEPTNO
AND      D.DNAME='RESEARCH';