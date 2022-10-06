-- ( employees 테이블 )

--- 1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력
SELECT employee_id, (first_name||' '||last_name) name, hire_date
FROM employees
WHERE to_char(hire_date,'YYYY') = 2003;

-- 2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력
SELECT *
FROM employees
WHERE lower(job_id) = 'fi_account' or lower(job_id) = 'ft_mgr'
or lower(job_id) = 'sa_man' or lower(job_id) = 'sa_rep';

-- IN 연산자 사용
SELECT *
FROM employees
WHERE lower(job_id) IN ('fi_account', 'ft_mgr', 'sa_man', 'sa_rep');

-- 3. 커미션을 받는 사원들의 명단을 출력
SELECT *
FROM employees
WHERE commission_pct is not null;

-- 4. 업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력
SELECT job_id,
CASE job_id
WHEN 'SA_MAN' THEN '판매부서'
WHEN 'SA_REP' THEN '판매부서'
ELSE '그 외 부서'
END as job
FROM employees;

--decode 사용
SELECT job_id,
decode(job_id,'SA_MAN','판매부서','SA_REP','판매부서','그외부서') dept_name
FROM employees;

-- 5. 연도별로 입사자들의 최소급여, 최대 급여, 급여의 총합 그리고 평균 급여를 구하시오
SELECT to_char(hire_date, 'YYYY') year, min(salary) min, max(salary) max,
sum(salary) sum, avg(salary) avg
FROM employees
GROUP BY to_char(hire_date, 'YYYY');

-- 6. 부서별 평균 급여가 $10,000 이상인 부서만 구하시오. ( 평균급여가 높은 순으로 )
SELECT department_id, round(avg(salary),0) avg -- 평균 : 소수점 아래에서 반올림
FROM employees
GROUP BY department_id
HAVING avg(salary)>= 10000
ORDER BY avg(salary) desc;

-- 7. 부서별 최대 급여를 구하시오.
SELECT department_id, max(salary) max_salary
FROM employees
GROUP BY department_id;

------------------------------------------------------------------------------------------------------------------------------------

<< 도전문제 >>
- 인사관리 ( hr 계정 )에서 EMPLOYEES 테이블에서

-- 1. EMPLOYEES 테이블에서 사원 이름을 first_name과 last_name를 합쳐 full_name으로 출력
select first_name || ' ' || last_name AS full_name
from employees;

-- 2. 부서번호가 30(구매부서)이고 급여 10000미만인 사원의 full_name과 월급,부서번호를 출력

select first_name || ' ' || last_name AS full_name, salary,department_id
from employees
where department_id = 30 and salary < 10000;

-- 3. 부서번호가 30이고 급여가 10000달러 이하를 받는 2006년도 이전 입사한 사원의 full_name을 출력

select first_name || ' ' || last_name AS full_name
from employees
where department_id = 30 and salary < 10000 and hire_date < '06/01/01';

-- 4. 부서번호가 30(구매부서)이고 급여가 10000이하인 사원과 부서번호가 60(IT부서)에서 급여가 5000이상인 사원을 조회

select *
from employees
where department_id = 30 and salary <= 10000 or department_id = 60 and salary >= 5000;

-- 5. 사원번호가 110번에서 120번인 사원 중 급여가 5000에서 10000사이의 사원명단을 조회

select *
from employees
where department_id >= 110 and department_id <= 120 and salary >= 5000 and salary <= 10000;

-- 6. 사원번호가 110번에서 120번이 아닌 사원을 조회

select *
from employees
where not (employee_id >= 110 and employee_id <= 120);
--between 110 and 120;

-- 7. 부서번호가 30(구매부서), 60(IT부서), 90(경영부서)에 속한 사원을 조회

select *
from employees
where department_id = 30 or department_id = 60 or department_id = 90;

-- 8. 부서번호가 30(구매부서), 60(IT부서), 90(경영부서) 외의 부서에 속한 사원을 조회

select *
from employees
where department_id != 30 and department_id != 60 and department_id != 90;

select *
from employees
where department_id <> 30 and department_id <> 60 and department_id <> 90;

select *
from employees
where department_id NOT IN( 30, 60 , 90) ;

-- 9. 전화번호에서 590으로 시작하는 사원명과 전화번호를 조회

select first_name || ' ' || last_name AS full_name ,phone_number
from employees
where phone_number like '590%';
------------------------------------------------------------------------------------------------------------------------------------

--REGEXP는 정규식이라는 뜻, REGEXP_like는 단순히 문자열이 포함되어 있는지 
--비교하는 like를 넘어서, 정규식을 비교하여 일치하는 경우 추출하는 함수입니다.

-- 테이블 생성
CREATE TABLE reg_tab( text varchar2(20) );
DROP TABLE reg_tab;
-- 레코드 입력

INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('개');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('고양이');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('박쥐');

-- 커밋
COMMIT;

-- 1. text 컬럼의 문자열에서 't'로 시작하는 데이터 검색
SELECT *
FROM reg_tab
WHERE text LIKE 't%';

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^t');


-- 2. text 컬럼의 문자열에서 't'로 끝나는 데이터 검색
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, 't$');

-- 3. 첫번째 't'로 시작하여 5번째 'r'이 있는 데이터 검색
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^t...r');

-- 4. 숫자로 끝나는 데이터 검색
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '[0-9]$');

-- 5. 숫자로 시작하는 데이타 검색
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[0-9]');

-- 6. 숫자가 아닌 문자로 시작하는 데이터 검색
SELECT*
FROM reg_tab
WHERE NOT REGEXP_LIKE(TEXT, '^[0-9]');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^[^0-9]');

-- 7. 대문자로 시작하는 데이터 검색
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[A-Z]');

-- 8. 소문자 외의 문자로 시작하는 데이터 검색
SELECT*
FROM reg_tab
WHERE NOT REGEXP_LIKE(TEXT, '^[a-z]');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^[^a-z]');

-- 9. 한글로 시작하는 데이터 검색
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[가-하]');

-- 10. 데이터 중 'gg'나 'GG'가 들어있는 데이터 검색
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, 'gg')or REGEXP_LIKE(TEXT, 'GG');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'gg|GG');

------------------------------------------------------------------------------------------------------------------------------------

-- 1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력

select empno, ename, job, sal, sal*1.15 as NEW_Salary, sal*1.15-sal as Increase
from emp;

-- 2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
select ename, hiredate, next_day(add_months( hiredate, 6),2) as commonday
from emp;

-- 3. 이름, 입사일, 입사일로부터 현재까지의 년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력
select ename, hiredate, sal,
to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY') as workyear,
sal*(to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')) as sumsal
from emp;

-- 4.이름, 업무, 입사일, 입사한 요일을 출력
?SELECT ename, job, hiredate, to_char(hiredate,'day') AS HIRED
FROM emp;

-- 5. 업무별, 부서별 급여 합계와 인원수를 출력하되,
-- 10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS 인원수
FROM EMP
WHERE DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

-- 6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
SELECT JOB, TRUNC(AVG(SAL)) 평균, MAX(SAL) 최대
FROM EMP
--WHERE
GROUP BY JOB
HAVING AVG(SAL)>=2000
ORDER BY AVG(SAL) DESC;

-- 7. 같은 입사년도 별로 인원수를 출력
SELECT TO_CHAR(HIREDATE,'YYYY') AS 입사년도, COUNT(*)
FROM EMP
--WHERE
GROUP BY TO_CHAR(HIREDATE,'YYYY');

-- 8. 5개씩 급여합계와 인원수를 출력 (rownum이용)

-- 9. 다음과 같이 출력
--   ( 실제 출력된 인원수가 다를 수도 있음 )
--   CLERK     SALESMAN        MANAGER         (업무명)
----------------------------------------------------------------------------------------
--   4          4               3            (인원수)

--10. 다음과 같이 업무별, 부서별 출력
--   ( 실제 계산된 금액이 다를 수도 있음 )

--업무명       10번부서     20번부서       30번부서       급여합계
----------------------------------------------------------------------------------------
--CLERK        1300        1900          950          4150

--SALESMAN      0           0            5600         5600

--PRESIDENT    5000         0             0           5000

--MANAGER      2450        2975          2850         8275

--ANALYST       0          6000           0           6000

----------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------

-- # HR 계정에서
-- 1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )
select e.EMPLOYEE_ID,d.DEPARTMENT_NAME, e.JOB_ID
from employees e right outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.last_name = 'King';

-- 2. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )
select e.employee_id id, e.last_name, d.department_name dname, j.job_id jobname
from employees e, departments d, jobs j
where e.department_id = d.department_id
        and e.job_id = j.job_id
        and e.last_name = 'King';   --옛날 방식

select e.employee_id as 사번 , e.last_name as 사원명, d.department_name as 부서명, j.job_title as 업무명
from employees e inner join departments d
            on e.department_id = d.department_id
            full outer join jobs j
            on e.job_id = j.job_id
where e.last_name like 'King';

-- 3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력
-- (*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
SELECT  e.employee_id as 사번, e.first_name||' '||last_name as 이름, e.hire_date as 입사일, d.department_name as 부서명  
FROM    employees e left outer join departments d
on      e.employee_id = d.department_id;


-- 4. 'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력
-- (*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
SELECT e1.first_name||' '||e1.last_name 사원명, e2.first_name||' '||e2.last_name 매니저명, d.department_name DEPTNAME
FROM employees e1, employees e2, departments d
WHERE e2.manager_id=e1.employee_id(+) and e1.department_id =d.department_id and d.department_name = 'Executive'; 

------------------------------------------------------------------------------------------------------------------------------------

-- [ 연습 2 ] 서브쿼리

-- 1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. 
-- Zlotkey는 제외하십시오.
select first_name||' '||last_name 이름, hire_date 입사일 
from employees 
where department_id = (select department_id from employees where last_name='Zlotkey');

-- 2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 
-- 결과를 급여에 대해 오름차순으로 정렬하십시오.
select salary 급여, employee_id 사번, first_name||' '||last_name 사원명 
from employees
where salary > (SELECT avg(salary) FROM employees)
order by salary asc;

-- 3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는
--질의를 작성하십시오.
SELECT employee_id 사번, first_name||' '||last_name 이름 
FROM employees
WHERE department_id IN (SELECT department_id 
                        FROM employees 
                        WHERE first_name||' '||last_name like '%u%');

-- 4. 부서 위치 ID가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하십시오.
select first_name||' '||last_name 이름, department_id 부서번호, job_id 업무ID
from employees
where department_id  IN(SELECT department_id 
                        FROM departments
                        WHERE location_id=1700);

-- 5. King에게 보고하는 모든 사원의 이름과 급여를 표시하십시오.
select first_name||' '||last_name 이름, salary 급여
from employees
where manager_id IN(? select employee_id 
                     from employees 
                     where last_name= 'King');

-- 6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.
SELECT DEPARTMENT_ID, FIRST_NAME ||' '|| LAST_NAME FULL_NAME, employee_id
FROM employees
WHERE department_id = (SELECT department_id 
                       FROM departments 
                       WHERE department_name ='Executive');


-- 7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는
-- 모든 사원의 사원 번호, 이름 및 급여를 표시하는 질의를 작성하십시오.
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME FULL_NAME, SALARY
FROM employees
WHERE DEPARTMENT_ID in(SELECT DEPARTMENT_ID 
                       FROM employees 
                       WHERE FIRST_NAME ||' '|| LAST_NAME like '%u%')
and salary>(SELECT AVG(SALARY)FROM employees);