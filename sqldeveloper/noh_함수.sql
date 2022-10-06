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

------------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------------

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

SELECT jumin, CASE substr( jumin, 8, 1) 
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
                    'MANAGER', sal*1.2) AS jobA
FROM emp;

SELECT empno, ename, job, sal, CASE job
         WHEN 'ANALYST' THEN sal*1.1
         WHEN 'CLERK' THEN sal*1.15
         WHEN 'MANAGER' THEN sal*1.2
         ELSE sal
         END as jobA
         FROM emp;
         
-- �����ȣ, �����, ����, �޿�, ������ �޿��� ���

SELECT all job from emp;

SELECT distint job from emp;

desc emp;
SELECT ROWNUM, empno, ename,job FROM emp;
SELECT ROWNUM, empno, ename,job FROM emp;

------------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------------

--3) ������ �׷� 
--GROUP BY : ~���� ���°�

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT deptno, count(*), avg(sal), min(sal), max(sal), sum(sal) AS sumA 
FROM emp
--WHERE
GROUP BY deptno;	 --(#) ��� �÷��� �׷����ϴ� �÷��� �����Լ��� ����
--HAVING

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� 
-- ( �μ��� �޿��� ���� ���� ������ )
select count(*) , round(avg(sal),-2), min(sal), max(sal), sum(sal) as sum
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
group by deptno
having count(deptno) >4;
