--3. SQL 함수 (*) 함수를 사용하면 alias 필수!

--(1) 숫자형 함수

-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
-- ROUND (n, i ) : 숫자 n을 소숫점 i자리에서 반올림
-- wolgub 별칭을 습관
SELECT ename, sal, ROUND (sal/12, -2)   AS wolgub
FROM emp;

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
--RUNC (n, i ) : 숫자 n을 소숫점 i자리에서 자름
--tax 별칭을 습관
SELECT ename, sal, TRUNC (sal*0.033, -1) AS tax
FROM emp;

------------------------------------------------------------------------------------------------------------------------------------

--(2) 문자형 함수

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
SELECT empno, ename, LOWER(job) job
FROM emp
WHERE ename=smith;

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
SELECT empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- 이름이 5글자 이상인 사원들을 출력
SELECT *
FROM emp
WHERE LENGTH (ename) >= 5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
SELECT RPAD (ename, 15, '*')
FROM emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
SELECT LPAD (sal, 10, '-')
FROM emp;
--substr(str, i, n) : 문자열 중 i번째에서 n개의 일부 문자를 선택
SELECT name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
FROM info_tab;

-- trim : 양쪽 공백 제거, ltrim : 왼쪽 공백 제거, rtrim : 오른쪽 공백 제거
select '-' || trim(' 이순신 ') || '-' as col1, 
       '-' || ltrim(' 이순신 ') || '-' as col2, 
       '-' || rtrim(' 이순신 ') || '-' as col3 
from dual; --듀얼은 오라클에서만 사용.

SELECT sysdate
FROM dual;

-- 급여를 숫자에서 '영일이삼사오육칠팔구' 글자로 대체
SELECT sal, translate(sal,'0123456789','영일이삼사오육칠팔구')kor_sal
FROM emp;

--급여의 숫자에서 0을 '$'로 바꾸어 출력
SELECT sal, replace(sal,0,'$')char_sal
FROM emp;
--***** 좌우 공백과 안쪽 공백까지 같이 없애려면 REPLACE를 사용한다.
SELECT REPLACE('    이  순  신    ', '', '') AS ename
FROM dual;

------------------------------------------------------------------------------------------------------------------------------------

--(3) 날짜형 함수

-- 현재까지 근무일 수가 많은 사람 순으로 출력
SELECT ename, hiredate, sysdate-Nvl(hiredate,sysdate), 
                        ceil(sysdate-Nvl(hiredate,sysdate))
FROM emp
ORDER BY sysdate-hiredate desc;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
SELECT ename, FLOOR((sysdate - Nvl(hiredate,sysdate))/7) AS WEEK,
              FLOOR(MOD(sysdate - Nvl(hiredate,sysdate),7)) AS DAY
FROM emp;

select ename, sysdate-hiredate,
        trunc((sysdate-Hiredate)/7,0) AS weeks,
        floor(mod(sysdate-hiredate,7)) AS days
from emp;

-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
SELECT trunc((sysdate-hiredate)/30,0) 
FROM emp
WHERE deptno=10;

SELECT ename, months_beetween(sysdate,hiredate)
FROM emp
WHERE deptno=10;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) 
from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
SELECT next_day(sysdate,('월요일')) AS NextD
from dual;

SELECT next_day(sysdate,2) AS NextD --일1, 월2, 화3...
from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
SELECT last_day(sysdate) AS lastD
from dual;

------------------------------------------------------------------------------------------------------------------------------------

--(4) 변환 함수

-- 입사일자에서 입사년도를 출력
SELECT ename, hiredate, to_char(hiredate, 'YYYY') hire_year
FROM emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE,'YYYY"년" MM"월" DD"일"') AS HIRE_DATE
FROM EMP;

-- 1981년도에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') =1981;

-- 5월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'MM')='05';
--WHERE TO_CHAR(HIREDATE,'MM')LIKE'05';

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
SELECT ENAME, SAL, TO_CHAR(SAL, '$999,999,999,999') AS DOLLAR
FROM EMP;

-- 81년도 2월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'YY MM')='81 02'; --(ALLEN, WARD)

-- 81년도 2월에 입사하지 않은 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY')!='1981'; --(4명)

-- 81년도 하반기에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY MM')between '1981 07' AND '1981 12';--(5명)

--(5) 조건함수 : if ~ else if ~ else 구문

SELECT decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender 
FROM info_tab;

SELECT jumin, CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
            END as gender
FROM info_tab;

-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
SELECT decode( deptno, 10, '영업부', 20, '관리부',30, 'IT부', '기술부') AS buseo 
FROM info_tab;

SELECT CASE deptno 
            WHEN 10 THEN '영업부'
            WHEN 20 THEN '관리부'
            WHEN 30 THEN 'IT부'
            ELSE '기술부'
            END as buseo
FROM info_tab;

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 
SELECT empno, ename, job, sal, decode(job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15, 
                    'MANAGER', sal*1.2) AS jobA
FROM emp;

SELECT empno, ename, job, sal, CASE job
         WHEN 'ANALYST' THEN sal*1.1
         WHEN 'CLERK' THEN sal*1.15
         WHEN 'MANAGER' THEN sal*1.2
         ELSE sal
         END as jobA
         FROM emp;
         
-- 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력

SELECT all job from emp;

SELECT distint job from emp;

desc emp;
SELECT ROWNUM, empno, ename,job FROM emp;
SELECT ROWNUM, empno, ename,job FROM emp;

------------------------------------------------------------------------------------------------------------------------------------

--4. 그룹함수

-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job='SALESMAN';

INSERT INTO emp(enpno, ename, job)
VALUES(9001, '홍길국', 'SALESMAN');

-- 커미션(COMM)을 받는 사람들의 수는
SELECT count(comm) AS commA
FROM emp
WHERE comm !=0;

------------------------------------------------------------------------------------------------------------------------------------

--3) 데이터 그룹 
--GROUP BY : ~별로 묶는것

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT deptno, count(*), avg(sal), min(sal), max(sal), sum(sal) AS sumA 
FROM emp
--WHERE
GROUP BY deptno;	 --(#) 출력 컬럼은 그룹핑하는 컬럼과 집계함수만 가능
--HAVING

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 
-- ( 부서별 급여의 합이 높은 순으로 )
select count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) as sum
from emp
-- where
group by deptno
-- having
order by sum desc;

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
select deptno,job, count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) AS sumC
from emp
-- where
group by deptno, job;

-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
select deptno, round(avg(sal),-2), sum(sal)
from emp
group by deptno
having max(sal) >= 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
select job, round(avg(sal),-2), sum(sal)
from emp
group by job
having avg(sal) >= 3000;

-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
select job, sum(sal) as sum
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum desc;

-- 업무별 최고 급여와 최소 급여의 차이를 구하라
select job, (max(sal) - min(sal)) AS cha
from emp
group by job;
-- 업무 확인하려고 job 임의로 넣었음.

-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
select deptno, count(*) , sum(sal) AS sumF
from emp
-- where
group by deptno
having count(deptno) >4;
