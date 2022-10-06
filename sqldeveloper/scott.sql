-- �������
/*
    �̸�      name        varchar2(10)
    �ֹι�ȣ   jumin      char(15)
    ��ȭ��ȣ   tel        varchar2(20)
    ����      gender      varchar2(10)
    ����      age         number(3)
    �����     home        varchar2(20)
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
-- ���̺� ���� Ȯ��
DESC info_tab;

-- ����Ÿ Ȯ��
SELECT * FROM info_tab;

/*  ���̺�� : student_score

�й�      id          char(4)
�л���     name        varchar2(20)
����      kor         number(3)
����      eng         number(3)
����      total       number
���      avg         number(3,2) --���ڸ��� ��ü�ڸ���
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

--���� �÷��� �߰�
--ALTER TABLE table_name ADD ( [ column_name data_type ] );

ALTER TABLE student_score
    ADD(math number(3));
    
-- ���� �÷��� �����ϱ�
DROP TABLE student_score DROP (total);

-- ��� �÷����� �Ҽ��� 1�ڷ� ����
ALTER TABLE student_score 
MODIFY (avg number(4,1));

DESC student_score;

-- ����Ÿ �Է�
-- ���� : ''
INSERT INTO student_score( id, name, kor, eng ) 
VALUES ( '0001','ȫ�浿', 50,80 );

SELECT* FROM student_score;

-- 2000�� �й��� ȫ������ ����� ���������� ���� 60,90���� ����(�Է�)
INSERT INTO student_score( id, name, kor, eng ) 
VALUES ( '2000','ȫ����', 60,90 );

commit;
rollback;

--1000�� �л� ȫ��� ������ ����
INSERT INTO student_score( id, name ) 
VALUES ( '1000','ȫ���' );
--�̸��� ȫ����� �л��� ���ڵ带 ����
--DELETE FROM table_name WHERE condition;
DELETE FROM student_score 
WHERE name='ȫ���';

SELECT* FROM student_score;

--0001�� �л��� ���������� 100���� �����ϱ�
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score
SET kor=100
WHERE id = '0001';

commit;

-- ȫ������ ���������� 90 �Է��ϱ�
UPDATE student_score
SET math = 90
WHERE id = '2000';

SELECT* FROM student_score;

-- �л����� ��ձ��ϱ�
UPDATE student_score
set avg = (kor + eng + math) / 3;
-- WHERE
SELECT* FROM student_score;

CREATE TABLE emp_copy
    AS SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;

--1. �����ȣ�� 7788�� ����� �μ��� 10������ ����
UPDATE emp_copy
SET deptno =10 
WHERE empno = 7788;
SELECT * FROM emp_copy;

--2. �����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500���� ����
UPDATE emp_copy
SET sal = 3500, 
NAME = 'ȫ���' 
WHERE empno = 7782;
SELECT * FROM emp_copy;

--3. ��� �μ����� ���ʽ��� 300�� �λ� ����
UPDATE emp_copy 
SET comm = nvl(comm,0) +300;
SELECT * FROM emp_copy;

--4. �����ȣ�� 7499�� ����� ������ ����
DELETE FROM emp_copy 
WHERE EMPNO = '7499';
SELECT * FROM emp_copy;

--5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����
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

-- 8000�� ������� <�����̸�>�� �޿� 10000�� �����ϼ���
INSERT INTO emp( empno,ename,sal ) 
VALUES ( 8000, '���ȯ', 10000 );

select * from emp;

-- 7788�� ������� <�����̸�>�� �޿� 10000�� �����ϼ���
INSERT INTO emp( empno,ename,sal )
VALUES ( 7788, '���ȯ', 10000 );

INSERT INTO emp( empno,ename,sal,deptno ) 
VALUES ( 8001, 'ȫ�汹', 10000,20 );

select *from emp;
--(#�����ȵ� �ٸ� ���̺��� Ű)
INSERT INTO emp( empno,ename,sal,deptno ) 
VALUES ( 8002, 'ȫ�汹', 10000,20 );
------------------------------------------
-- �÷����� �ݵ�� ���.
INSERT INTO info_tab(tel,name,jumin,gender,age,home)
VALUES('032','ȫ��','870128','����',36,'��õ');

select *from info_tab;

INSERT INTO info_tab(tel,name) VALUES('1001', 'ȫ�浿');

INSERT INTO info_tab(tel,name) VALUES('1002', '��浿');

INSERT INTO info_tab(tel,name) VALUES('1002', '�Ѹ�');

INSERT INTO info_tab(name,jumin) VALUES('��浿','870128-1234567');

INSERT INTO info_tab(gender, age) VALUES('����', 22);

INSERT INTO info_tab(tel,gender, age) VALUES(9999,'����', 22);

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
    
INSERT INTO info_tab(tel,name ,jumin) VALUES('20001','ȫ����','990101');
INSERT INTO info_tab(tel,name ,jumin) VALUES('20002','ȫ����','990101');
INSERT INTO info_tab(tel,name) VALUES('20001','ȫȫ��');

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK (gender in('����','����'));
    
INSERT INTO info_tab(tel,name,gender) VALUES ('1001','ȫ����','����');
INSERT INTO info_tab(tel,name,gender) VALUES ('2001','ȫ����','����');    
INSERT INTO info_tab(tel,name,gender) VALUES ('3001','ȫ����','����');    

ALTER TABLE info_tab
    MODIFY (gender varchar2(6) default '����');
    
INSERT INTO info_tab(tel,name) VALUES('7777','ȫ��');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '02-777-4444', '990909-1234567');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('������','03-555-5555', '880808-1234567', '����', 27,'���');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27,'���');

INSERT into info_tab( name, jumin) 
VALUES('ȫ����', '550505-1234567');

INSERT INTO info_tab( tel, jumin ) 
VALUES('031-777-7777', '700707-1234567');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '031-000-0000', '700707-1234567');

CREATE TABLE info_tab
(
name       varchar2(10) NOT NULL,
jumin      char(15),
tel        varchar2(20),
gender     varchar2(10) default '����',
age        number(3),
home       varchar2(20),
deptno      number(2),
CONSTRAINT pk_info_tel PRIMARY KEY (tel),
CONSTRAINT up_info_jumin UNIQUE (jumin),
CONSTRAINT ck_info_gender CHECK (gender IN ('����','����')),
CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
-- NOT NULL(�ַ� name�� ���� ����, null���� ������� ����)
-- UNIQUE(�ַ� �ֹι�ȣ�� ����, �����ϰ� �ĺ��ϴ� ���� ��� -> �ߺ�������)
-- PRIMARY KEY(�ַ� ��ȭ��ȣ�� ����, null�� ������� �ʰ� �����ϰ� �ĺ�)
-- CHECK(�ַ� �������п� ����, �������� �Է�ó��)
-- (*) DEFAULT(���� ���� ������ �ʾ����� �⺻���� �����°�)
INSERT INTO info_tab( name, tel, deptno ) VALUES('7777','����','20');
INSERT INTO info_tab( name, tel, deptno ) VALUES('8888','����','22');
INSERT INTO info_tab( name, tel ) VALUES('9999','¯��');

CREATE TABLE sawon
(
sabun            number(6),
sawon_name       varchar2(15),
ubmu             varchar2 (10),
weolgub          number(10,2),
buseo            varchar2(6),
CONSTRAINT pk_sawon PRIMARY KEY (sabun) --2��
);

--3
ALTER TABLE sawon
    add (jiyeok varchar2(30) not null);
--4
ALTER TABLE sawon
    MODIFY(weolgub number(7));
--5
ALTER TABLE sawon 
    add constraint ubmu_CHECK CHECK(ubmu IN ('����', '����', '����'));
--6
ALTER TABLE sawon
    MODIFY( ubmu DEFAULT '����');
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
VALUES('101','����Ʈ��������������');

INSERT INTO buseo( buseo_no, buseo_name )
VALUES('202','������');

INSERT INTO buseo( buseo_no, buseo_name )
VALUES('202','�����ڿ���');

--10
INSERT INTO sawon( sabun,sawon_name,weolgub,buseo,	jiyeok) 
VALUES ('8001','ȫ�浿�̱�','100000','101','�λ�');

INSERT INTO sawon( sabun,sawon_name,ubmu,weolgub,buseo,	jiyeok) 
VALUES ('8002','ȫ����','�繫','200000','202','��õ');

INSERT INTO sawon( sabun,sawon_name,ubmu,buseo,jiyeok) 
VALUES ('8003','ȫ���','����','111','����');

INSERT INTO sawon( sabun,sawon_name,weolgub,jiyeok) 
VALUES ('8004','ȫ�漮','12345678','����');

INSERT INTO sawon( sabun,sawon_name,ubmu,buseo,jiyeok) 
VALUES ('8005','ȫ��ö','��������','303','�Ǳ�');

--11
ALTER TABLE sawon DROP ( jiyeok );
select * from buseo;
--12
DELETE FROM buseo WHERE buseo_name='�����ڿ���';

--13
DROP TABLE sawon;

--14
CREATE TABLE sawon
(
sabun            number(6),
sawon_name       varchar2(15),
ubmu             varchar2 (30) default '����',
weolgub          number(7),
buseo            varchar2(6),
jiyeok           varchar2(30) not null,
CONSTRAINT pk_sawon PRIMARY KEY (sabun),   
CONSTRAINT ubmu_check check(ubmu IN('����','��������','����')),
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
    SELECT  �˻��� �׸��
    FROM    ���̺��
    WHERE   ����;
*/

-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT ename, sal, sal+nvl(comm,0) AS total_sal -- �ݵ�� ��Ī ��������(�ʼ�)
FROM emp;

--WHERE
SELECT ename||''||job AS staff -- �ݵ�� ��Ī ��������(�ʼ�)
FROM emp;

SELECT distinct job FROM emp;

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT empno, ename, deptno
FROM   emp
WHERE  deptno=20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
SELECT empno, ename, deptno,hiredate 
FROM   emp
WHERE hiredate BETWEeN'1981/01/01'AND'1981/06/09';

-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���
SELECT ename, job
FROM   emp
WHERE JOB='SALESMAN'or job = 'CLERK' ;

SELECT ename, job
FROM   emp
WHERE JOB IN('SALESMAN', 'CLERK') ;

SELECT ename, job
FROM   emp
WHERE JOB=upper('salesman')or job = upper('clerk') ;


-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT*FROM emp
WHERE (job= 'PRESIDENT' and sal >=1500) or job= 'SALESMAN';

-- 5- ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���
SELECT*FROM emp
WHERE (job= 'PRESIDENT' or job= 'SALESMAN') and sal >1500;

-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL OR COMM =0;
-- 7- �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT ENAME, SAL, COMM, SAL+NVL(COMM,0) AS TOTAL_SAL
FROM EMP;
-- 8- �̸� A�� �����ϴ� ����� ���
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%';
-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';
-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%L%L%';
-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT * FROM EMP
WHERE COMM IS NOT NULL;
-- 12- ���ʽ��� �޿����� 10%�̻� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM >= SAL*1.1;
-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
SELECT * FROM EMP
WHERE (JOB='CLERK' OR JOB='ANALYST') AND SAL !=1000 AND SAL !=3000 AND SAL !=5000;

SELECT * FROM EMP
WHERE JOB IN ('CLERK','ANALYST') AND SAL !=1000 AND SAL !=3000 AND SAL !=5000;

SELECT * FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL not in(1000,3000,5000);

-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT * FROM EMP
where DEPTNO=30 OR MGR='7782';
------------------------------------------------------------------------------

--3. SQL �Լ� (*) �Լ��� ����ϸ� alias �ʼ�!

--(1) ������ �Լ�

-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
-- ROUND (n, i ) : ���� n�� �Ҽ��� i�ڸ����� �ݿø�
-- wolgub ��Ī�� ����
SELECT ename, sal, ROUND (sal/12, -2)   AS wolgub
FROM emp;

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
--RUNC (n, i ) : ���� n�� �Ҽ��� i�ڸ����� �ڸ�
--tax ��Ī�� ����
SELECT ename, sal, TRUNC (sal*0.033, -1) AS tax
FROM emp;
-------------------------------------------------------------------------------

--(2) ������ �Լ�

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
SELECT empno, ename, LOWER(job) job
FROM emp
WHERE ename=smith;

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
SELECT empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- �̸��� 5���� �̻��� ������� ���
SELECT *
FROM emp
WHERE LENGTH (ename) >= 5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
SELECT RPAD (ename, 15, '*')
FROM emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
SELECT LPAD (sal, 10, '-')
FROM emp;
--substr(str, i, n) : ���ڿ� �� i��°���� n���� �Ϻ� ���ڸ� ����
SELECT name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
FROM info_tab;

-- trim : ���� ���� ����, ltrim : ���� ���� ����, rtrim : ������ ���� ����
select '-' || trim(' �̼��� ') || '-' as col1, 
       '-' || ltrim(' �̼��� ') || '-' as col2, 
       '-' || rtrim(' �̼��� ') || '-' as col3 
from dual; --����� ����Ŭ������ ���.

SELECT sysdate
FROM dual;

-- �޿��� ���ڿ��� '�����̻�����ĥ�ȱ�' ���ڷ� ��ü
SELECT sal, translate(sal,'0123456789','�����̻�����ĥ�ȱ�')kor_sal
FROM emp;

--�޿��� ���ڿ��� 0�� '$'�� �ٲپ� ���
SELECT sal, replace(sal,0,'$')char_sal
FROM emp;
--***** �¿� ����� ���� ������� ���� ���ַ��� REPLACE�� ����Ѵ�.
SELECT REPLACE('    ��  ��  ��    ', '', '') AS ename
FROM dual;
-------------------------------------------------------------------------------

--(3) ��¥�� �Լ�

-- ������� �ٹ��� ���� ���� ��� ������ ���
SELECT ename, hiredate, sysdate-Nvl(hiredate,sysdate), 
                        ceil(sysdate-Nvl(hiredate,sysdate))
FROM emp
ORDER BY sysdate-hiredate desc;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
SELECT ename, FLOOR((sysdate - Nvl(hiredate,sysdate))/7) AS WEEK,
              FLOOR(MOD(sysdate - Nvl(hiredate,sysdate),7)) AS DAY
FROM emp;

select ename, sysdate-hiredate,
        trunc((sysdate-Hiredate)/7,0) AS weeks,
        floor(mod(sysdate-hiredate,7)) AS days
from emp;


-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
SELECT trunc((sysdate-hiredate)/30,0) 
FROM emp
WHERE deptno=10;

SELECT ename, months_beetween(sysdate,hiredate)
FROM emp
WHERE deptno=10;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) 
from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
SELECT next_day(sysdate,('������')) AS NextD
from dual;

SELECT next_day(sysdate,2) AS NextD --��1, ��2, ȭ3...
from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
SELECT last_day(sysdate) AS lastD
from dual;
-------------------------------------------------------------------------------

--(4) ��ȯ �Լ�

-- �Ի����ڿ��� �Ի�⵵�� ���
SELECT ename, hiredate, to_char(hiredate, 'YYYY') hire_year
FROM emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE,'YYYY"��" MM"��" DD"��"') AS HIRE_DATE
FROM EMP;

-- 1981�⵵�� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') =1981;

-- 5���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'MM')='05';
--WHERE TO_CHAR(HIREDATE,'MM')LIKE'05';

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
SELECT ENAME, SAL, TO_CHAR(SAL, '$999,999,999,999') AS DOLLAR
FROM EMP;

-- 81�⵵ 2���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'YY MM')='81 02'; --(ALLEN, WARD)

-- 81�⵵ 2���� �Ի����� ���� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY')!='1981'; --(4��)

-- 81�⵵ �Ϲݱ⿡ �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY MM')between '1981 07' AND '1981 12';--(5��)

--(5) �����Լ� : if ~ else if ~ else ����

SELECT decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender 
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '����'
            WHEN '3' THEN '����'
            ELSE '����'
            END as gender
FROM info_tab;

-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
SELECT decode( deptno, 10, '������', 20, '������',30, 'IT��', '�����') AS buseo 
FROM info_tab;

SELECT CASE deptno 
            WHEN 10 THEN '������'
            WHEN 20 THEN '������'
            WHEN 30 THEN 'IT��'
            ELSE '�����'
            END as buseo
FROM info_tab;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� 
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

-- �����ȣ, �����, ����, �޿�, ������ �޿��� ���

SELECT all job from emp;

SELECT distint job from emp;

desc emp;
SELECT ROWNUM, empno, ename,job FROM emp;
SELECT ROWNUM, empno, ename,job FROM emp;
-------------------------------------------------------------------------------

--4. �׷��Լ�

-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job='SALESMAN';

INSERT INTO emp(enpno, ename, job)
VALUES(9001, 'ȫ�汹', 'SALESMAN');


-- Ŀ�̼�(COMM)�� �޴� ������� ����
SELECT count(comm) AS commA
FROM emp
WHERE comm !=0;
-------------------------------------------------------------------------------

--3) ������ �׷� 
--GROUP BY : ~���� ���°�

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT deptno, count(*), avg(sal), min(sal), max(sal), sum(sal) AS sumA 
FROM emp
--WHERE
GROUP BY deptno; --(#) ��� �÷��� �׷����ϴ� �÷��� �����Լ��� ����
--HAVING

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� 
-- ( �μ��� �޿��� ���� ���� ������ )
select count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) AS sumB
from emp
-- where
group by deptno
-- having
order by sum desc;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
select deptno,job, count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) AS sumC
from emp
-- where
group by deptno, job;

-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
select deptno, round(avg(sal),-2), sum(sal)
from emp
group by deptno
having max(sal) >= 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
select job, round(avg(sal),-2), sum(sal)
from emp
group by job
having avg(sal) >= 3000;

-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
select job, sum(sal) as sum
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum desc;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
select job, (max(sal) - min(sal)) AS cha
from emp
group by job;
-- ���� Ȯ���Ϸ��� job ���Ƿ� �־���.

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
select deptno, count(*) , sum(sal) AS sumF
from emp
-- where
group by deptno;
having count(deptno) >4
    