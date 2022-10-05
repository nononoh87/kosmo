-- 구조잡기
/*
    이름      name        varchar2(10)
    주민번호   jumin      char(15)
    전화번호   tel        varchar2(20)
    성별      gender      varchar2(10)
    나이      age         number(3)
    출신지     home        varchar2(20)
*/
--CREATE TABLE table_name ([column_name data_tyoe]);

CREATE TABLE info_tab
(
name       varchar2(10),
jumin      char(15),
tel        varchar2(20),
gender     varchar2(10),
age        number(3),
home       varchar2(20)
);
-- 테이블 구조 확인
DESC info_tab;

-- 데이타 확인
SELECT * FROM info_tab;

/*  테이블명 : student_score

학번      id          char(4)
학생명     name        varchar2(20)
국어      kor         number(3)
영어      eng         number(3)
총점      total       number
평균      avg         number(3,2) --앞자리는 전체자리수
*/

CREATE TABLE student_score
(
 id          char(4),
 name        varchar2(20),
 kor         number(3),
 eng         number(3),
 total       number,
 avg         number(5,2)
);

DROP TABLE student_score;

DESC student_score;

--수학 컬럼을 추가
--ALTER TABLE table_name ADD ( [ column_name data_type ] );

ALTER TABLE student_score
    ADD(math number(3));
    
-- 총점 컬럼을 삭제하기
DROP TABLE student_score DROP (total);

-- 평균 컬럼에서 소수점 1자로 변경
ALTER TABLE student_score 
MODIFY (avg number(4,1));

DESC student_score;

-- 데이타 입력
-- 문자 : ''
INSERT INTO student_score( id, name, kor, eng ) 
VALUES ( '0001','홍길동', 50,80 );

SELECT* FROM student_score;

-- 2000번 학번인 홍길자으 국어와 영어점수를 각각 60,90으로 저장(입력)
INSERT INTO student_score( id, name, kor, eng ) 
VALUES ( '2000','홍길자', 60,90 );

commit;
rollback;

--1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score( id, name ) 
VALUES ( '1000','홍길숙' );
--이름이 홍길숙인 학생의 레코드를 삭제
--DELETE FROM table_name WHERE condition;
DELETE FROM student_score 
WHERE name='홍길숙';

SELECT* FROM student_score;

--0001번 학생의 국어점수를 100으로 수정하기
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score
SET kor=100
WHERE id = '0001';

commit;

-- 홍길자의 수학점수를 90 입력하기
UPDATE student_score
SET math = 90
WHERE id = '2000';

SELECT* FROM student_score;

-- 학생들의 평균구하기
UPDATE student_score
set avg = (kor + eng + math) / 3;
-- WHERE
SELECT* FROM student_score;

CREATE TABLE emp_copy
    AS SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;

--1. 사원번호가 7788인 사원의 부서를 10번으로 변경
UPDATE emp_copy
SET deptno =10 
WHERE empno = 7788;
SELECT * FROM emp_copy;

--2. 사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경
UPDATE emp_copy
SET sal = 3500, 
NAME = '홍길숙' 
WHERE empno = 7782;
SELECT * FROM emp_copy;

--3. 모든 부서원의 보너스를 300씩 인상 변경
UPDATE emp_copy 
SET comm = nvl(comm,0) +300;
SELECT * FROM emp_copy;

--4. 사원번호가 7499인 사원의 정보를 삭제
DELETE FROM emp_copy 
WHERE EMPNO = '7499';
SELECT * FROM emp_copy;

--5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
DELETE FROM emp_copy
WHERE HIREDATE < '1981-06-01';
SELECT * FROM emp_copy;

delete from emp_copy;

select* from emp_copy;

rollback;

select* from emp_copy;

truncate table emp_copy;
select* from emp_copy;
rollback;
select* from emp_copy;
-------------------------------------------------------------------

-- 8000번 사원으로 <본인이름>과 급여 10000를 저장하세요
INSERT INTO emp( empno,ename,sal ) 
VALUES ( 8000, '노승환', 10000 );

select * from emp;

-- 7788번 사원으로 <본이이름>과 급여 10000을 지정하세요
INSERT INTO emp( empno,ename,sal )
VALUES ( 7788, '노승환', 10000 );

INSERT INTO emp( empno,ename,sal,deptno ) 
VALUES ( 8001, '홍길국', 10000,20 );

select *from emp;
--(#생성안됨 다른 테이블의 키)
INSERT INTO emp( empno,ename,sal,deptno ) 
VALUES ( 8002, '홍길국', 10000,20 );
------------------------------------------
-- 컬럼명은 반드시 써라.
INSERT INTO info_tab(tel,name,jumin,gender,age,home)
VALUES('032','홍자','870128','남자',36,'인천');

select *from info_tab;

INSERT INTO info_tab(tel,name) VALUES('1001', '홍길동');

INSERT INTO info_tab(tel,name) VALUES('1002', '김길동');

INSERT INTO info_tab(tel,name) VALUES('1002', '둘리');

INSERT INTO info_tab(name,jumin) VALUES('김길동','870128-1234567');

INSERT INTO info_tab(gender, age) VALUES('남자', 22);

INSERT INTO info_tab(tel,gender, age) VALUES(9999,'남자', 22);

DELETE FROM info_tab;
commit;

ALTER  TABLE   info_tab
ADD  CONSTRAINT  pk_info_tel  PRIMARY  KEY ( tel );

DROP TABLE info_tab;

CREATE TABLE info_tab
(
name       varchar2(10),
jumin      char(15),
tel        varchar2(20),
gender     varchar2(10),
age        number(3),
home       varchar2(20),
CONSTRAINT pk_info_tel PRIMARY KEY (tel)
);
ALTER TABLE info_tab
    MODIFY (name varchar2(10) not null);

ALTER TABLE info_tab
    ADD CONTRAINT up_info_jumin UNIQE (jumin);
    
INSERT INTO info_tab(tel,name ,jumin) VALUES('20001','홍실이','990101');
INSERT INTO info_tab(tel,name ,jumin) VALUES('20002','홍동이','990101');
INSERT INTO info_tab(tel,name) VALUES('20001','홍홍이');

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK (gender in('남성','여성'));
    
INSERT INTO info_tab(tel,name,gender) VALUES ('1001','홍돌이','남성');
INSERT INTO info_tab(tel,name,gender) VALUES ('2001','홍숙이','남자');    
INSERT INTO info_tab(tel,name,gender) VALUES ('3001','홍숙이','여성');    

ALTER TABLE info_tab
    MODIFY (gender varchar2(6) default '남성');
    
INSERT INTO info_tab(tel,name) VALUES('7777','홍이');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑순이', '02-777-4444', '990909-1234567');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('갑갑이','03-555-5555', '880808-1234567', '남자', 27,'경기');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('홍길동','03-031-0310', '900909-1234567', '남성', 27,'경기');

INSERT into info_tab( name, jumin) 
VALUES('홍길자', '550505-1234567');

INSERT INTO info_tab( tel, jumin ) 
VALUES('031-777-7777', '700707-1234567');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑동이', '031-000-0000', '700707-1234567');

CREATE TABLE info_tab
(
name       varchar2(10) NOT NULL,
jumin      char(15),
tel        varchar2(20),
gender     varchar2(10) default '남성',
age        number(3),
home       varchar2(20),
deptno      number(2),
CONSTRAINT pk_info_tel PRIMARY KEY (tel),
CONSTRAINT up_info_jumin UNIQUE (jumin),
CONSTRAINT ck_info_gender CHECK (gender IN ('남성','여성')),
CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
-- NOT NULL(주로 name에 많이 쓰임, null값을 허용하지 않음)
-- UNIQUE(주로 주민번호에 쓰임, 유일하게 식별하는 값만 허용 -> 중복허용안함)
-- PRIMARY KEY(주로 전화번호에 쓰임, null값 허용하지 않고 유일하게 식별)
-- CHECK(주로 성별구분에 쓰임, 제한적인 입력처리)
-- (*) DEFAULT(값을 지정 해주지 않았을때 기본값이 나오는것)
INSERT INTO info_tab( name, tel, deptno ) VALUES('7777','맹이','20');
INSERT INTO info_tab( name, tel, deptno ) VALUES('8888','꽁이','22');
INSERT INTO info_tab( name, tel ) VALUES('9999','짱이');

CREATE TABLE sawon
(
sabun            number(6),
sawon_name       varchar2(15),
ubmu             varchar2 (10),
weolgub          number(10,2),
buseo            varchar2(6),
CONSTRAINT pk_sawon PRIMARY KEY (sabun) --2번
);

--3
ALTER TABLE sawon
    add (jiyeok varchar2(30) not null);
--4
ALTER TABLE sawon
    MODIFY(weolgub number(7));
--5
ALTER TABLE sawon 
    add constraint ubmu_CHECK CHECK(ubmu IN ('개발', '유지', '관리'));
--6
ALTER TABLE sawon
    MODIFY( ubmu DEFAULT '개발');
--7
CREATE TABLE buseo
(
buseo_no        varchar2(9),
buseo_name      varchar2(30)
);
--8
alter table sawon
add constraint fk_buseo foreign key (buseo) references buseo(buseo_no);

--9
INSERT INTO buseo( buseo_no, buseo_name )
VALUES('101','소프트웨어유지보수부');

INSERT INTO buseo( buseo_no, buseo_name )
VALUES('202','관리부');

INSERT INTO buseo( buseo_no, buseo_name )
VALUES('202','인적자원부');

--10
INSERT INTO sawon( sabun,sawon_name,weolgub,buseo,	jiyeok) 
VALUES ('8001','홍길동이군','100000','101','부산');

INSERT INTO sawon( sabun,sawon_name,ubmu,weolgub,buseo,	jiyeok) 
VALUES ('8002','홍길자','사무','200000','202','인천');

INSERT INTO sawon( sabun,sawon_name,ubmu,buseo,jiyeok) 
VALUES ('8003','홍길순','개발','111','대전');

INSERT INTO sawon( sabun,sawon_name,weolgub,jiyeok) 
VALUES ('8004','홍길석','12345678','서울');

INSERT INTO sawon( sabun,sawon_name,ubmu,buseo,jiyeok) 
VALUES ('8005','홍길철','유지보수','303','판교');

--11
ALTER TABLE sawon DROP ( jiyeok );
select * from buseo;
--12
DELETE FROM buseo WHERE buseo_name='인적자원부';

--13
DROP TABLE sawon;

--14
CREATE TABLE sawon
(
sabun            number(6),
sawon_name       varchar2(15),
ubmu             varchar2 (30) default '개발',
weolgub          number(7),
buseo            varchar2(6),
jiyeok           varchar2(30) not null,
CONSTRAINT pk_sawon PRIMARY KEY (sabun),   
CONSTRAINT ubmu_check check(ubmu IN('개발','유지보수','관리')),
CONSTRAINT fk_buseo FOREIGN KEY(buseo) references buseo(buseo_no)
);
CREATE TABLE buseo
(
buseo_no        number(3),
buseo_no        varchar2(30),
constraint pk_buseo_no PRIMARY KEY(buseo_no)
);
select *from sawon;
------------------------------------------------------------------------

/*
    SELECT  검색할 항목들
    FROM    테이블명
    WHERE   조건;
*/

-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력
SELECT ename, sal, sal+nvl(comm,0) AS total_sal -- 반드시 별칭 만드어야함(필수)
FROM emp;

--WHERE
SELECT ename||''||job AS staff -- 반드시 별칭 만드어야함(필수)
FROM emp;

SELECT distinct job FROM emp;

-- 1- 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
SELECT empno, ename, deptno
FROM   emp
WHERE  deptno=20;

-- 2- 입사일이 81/01/01에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력
SELECT empno, ename, deptno,hiredate 
FROM   emp
WHERE hiredate BETWEeN'1981/01/01'AND'1981/06/09';

-- 3- 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력
SELECT ename, job
FROM   emp
WHERE JOB='SALESMAN'or job = 'CLERK' ;

SELECT ename, job
FROM   emp
WHERE JOB IN('SALESMAN', 'CLERK') ;

SELECT ename, job
FROM   emp
WHERE JOB=upper('salesman')or job = upper('clerk') ;


-- 4- 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력
SELECT*FROM emp
WHERE (job= 'PRESIDENT' and sal >=1500) or job= 'SALESMAN';

-- 5- 업무가 president 또는 salesman이고 급여가 1500이상인 사원의 정보를 출력
SELECT*FROM emp
WHERE (job= 'PRESIDENT' or job= 'SALESMAN') and sal >1500;

-- 6- 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL OR COMM =0;
-- 7- 사원명, 급여, 커미션, 총급여( 급여 + 커미션)을 출력
SELECT ENAME, SAL, COMM, SAL+NVL(COMM,0) AS TOTAL_SAL
FROM EMP;
-- 8- 이름 A로 시작하는 사원명 출력
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%';
-- 9- 이름이 두번째 문자가 L인 사원명 출력
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';
-- 10- 이름에 L이 두 번 이상 포함된 사원명 출력
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%L%L%';
-- 11- 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력
SELECT * FROM EMP
WHERE COMM IS NOT NULL;
-- 12- 보너스가 급여보다 10%이상 많은 모든 사원에 대해 이름, 급여, 보너스를 출력
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM >= SAL*1.1;
-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP
WHERE (JOB='CLERK' OR JOB='ANALYST') AND SAL !=1000 AND SAL !=3000 AND SAL !=5000;

SELECT * FROM EMP
WHERE JOB IN ('CLERK','ANALYST') AND SAL !=1000 AND SAL !=3000 AND SAL !=5000;

SELECT * FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL not in(1000,3000,5000);

-- 14- 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
SELECT * FROM EMP
where DEPTNO=30 OR MGR='7782';
------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------

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

SELECT CASE substr( jumin, 8, 1) 
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
                    'MANAGER', sal*1.2) AS change
FROM emp;


SELECT empno, ename,sal, job CASE job
            WHEN 'analyst' THEN sal*1.0
            WHEN 'clerk' THEN sal*1.5
            WHEN 'manager' THEN sal*2.0
            ELSE sal
            END as jobA
FROM info_tab;

-- 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력

SELECT all job from emp;

SELECT distint job from emp;

desc emp;
SELECT ROWNUM, empno, ename,job FROM emp;
SELECT ROWNUM, empno, ename,job FROM emp;
-------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------

--3) 데이터 그룹 
--GROUP BY : ~별로 묶는것

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT deptno, count(*), avg(sal), min(sal), max(sal), sum(sal) AS sumA 
FROM emp
--WHERE
GROUP BY deptno; --(#) 출력 컬럼은 그룹핑하는 컬럼과 집계함수만 가능
--HAVING

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 
-- ( 부서별 급여의 합이 높은 순으로 )
select count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) AS sumB
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
group by deptno;
having count(deptno) >4
    