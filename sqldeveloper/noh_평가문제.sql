--[����1]
--�޿��� 2000 �̻� 3000 ������ ����� �̸��� �����ȣ, �Ի���, �޿��� ����ϵ� �̸��� �������� �����ϼ���.
SELECT ename, empno, hiredate, sal
FROM emp
WHERE sal between 2000 and 3000
ORDER BY ename asc;


--[����2]
--Ŀ�̼��� NULL �� ����̸���, �Ի��� �μ���ȣ�� ����ϵ� �μ���ȣ�� �������� �����ϵ� �μ���ȣ�� ���� �׸��� ���� ��� �̸��� ������������ �����ϼ���.
SELECT ename, hiredate, deptno,comm
From emp
where comm is null
ORDER BY deptno, ename asc;

--[����3]
-- Ŀ�̼��� 300 �̰ų� 500 �̰ų� 1400�� ����� �����ȣ�� �̸�, ����, Ŀ�̼��� ��� �ϵ� Ŀ�̼��� �������� �����ϼ���.
-- IN �����ڸ� ����ؼ� ��� �ϼ���.
SELECT empno,ename,sal, comm
FROM emp
WHERE comm IN (300,500,1400)
ORDER BY comm desc;

--[����4]
--�̸��� ù ���ڰ� ��S���� �����ϴ� ����� �̸��� ����ϼ���.
SELECT ename
FROM emp
WHERE ename like 'S%';

--[����5]
--LIKE �����ڿ� ���ϵ� ī�带 ����ؼ� '81'�⵵�� �Ի����� ���� ����� �̸��� �Ի����� ����ϼ���.
select ename, hiredate
from emp
where hiredate not like '81%';

--[����6]
--�μ� ��ȣ�� �ߺ� ������ ������������ �����ؼ� ����ϼ���.
SELECT DISTINCT deptno
FROM emp
ORDER BY deptno asc;

--[����7]
--�̸��� ��A��  �� ��E�� �� ��� �����ϴ� ����� �̸��� ����ϼ���.
SELECT ename
FROM emp
WHERE ename like '%A%'
AND ename like '%E%';

--[����8]
--substr �Լ��� ����ؼ� 12�� �޿� �Ի��� ����� �����ȣ, �̸�, �Ի����� ����ϼ���.
SELECT empno, ename, hiredate
FROM emp
WHERE substr(hiredate,4,2) = '12'; 

--[����9] 
--NVL �Լ��� ����ؼ� ����� ������ ����ؼ� ����̸�, ����, Ŀ�̼� , ������ ����ϵ� ������ ���� ������� ����ϼ���.
SELECT ename �̸�,sal ����, NVL(comm, 0)���ʽ�, NVL(sal, 0)*12 ����  
FROM emp
ORDER BY NVL(sal, 0)*12 desc;

--[����10]
--NVL2 �Լ��� ����ؼ� ����� ������ ����ؼ� ����̸�, ����, Ŀ�̼� , ������ ����ϵ� ������ ���� ������� ����ϼ���.
SELECT ename �̸�,sal ����, NVL(comm, 0)���ʽ�, NVL2(sal,sal, 0)*12 ����  
FROM emp
ORDER BY NVL2(sal,sal, 0)*12 desc;

--[����11]
--������� �޿� �Ѿ� , ��վ�, �ְ��, �ּҾ��� ��� �ϼ���. �� �÷��� 
--���޿��Ѿס�, ����վ�, ���ְ�ס�, ���ּҾס����� ��Ī�̸����� ����ϼ���.
SELECT sum(sal) �޿��Ѿ�, ROUND(avg(sal),0) ��վ�, min(sal) �ּҾ�, max(sal) �ְ��
FROM emp;

--[����12]
--���� ������ ������ ��� �ϼ���.  ����÷��� ������ ������ �������� ��Ī�̸����� ��� �ϼ���.
SELECT COUNT(DISTINCT job) ����_������_����
FROM emp;

--[����13]
--�� �μ��� ��� ������ ���ؼ� �μ���ȣ�� ��� ������ ��� �ϵ�  ���� ���μ���ȣ��, ����տ��ޡ� ���� ��Ī�̸����� ����ϼ���.
SELECT   deptno �μ���ȣ, ROUND(AVG(sal),0) ��տ���
FROM     emp
GROUP BY deptno;

--[����14]
--��� ������ ������ ����� ���� ���Ͻÿ�. (���� , count �Լ� ���)
SELECT   JOB, COUNT(*)
FROM     emp
GROUP BY JOB;

--[����15]
--���޺� ����� ���� �޿��� ����Ͻÿ�, �����ڸ� �˼� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���� ��Ű��
--����� �޿��� ���� ������������ �����Ͽ� ��� �ϼ���.
SELECT   JOB,MIN(SAL)
FROM     emp
WHERE    MANAGER IS NOT NULL
GROUP BY JOB   
HAVING   MIN(SAL)>2000 
ORDER BY MIN(SAL) DESC;

--[����16]
--���� ������ ����ؼ� �����ȣ�� 7788�� ����� �������� ���� ����� ��� �Ͻÿ�  <����̸�, ������> ��� �Ͻÿ�
SELECT JOB FROM emp WHERE empno=7788;

SELECT   ENAME ����̸�, JOB ������
FROM     emp
WHERE    JOB LIKE (SELECT JOB FROM emp WHERE empno=7788);

--[����17]
--���� ������ ����ؼ� �������� 7499 �� ������� �޿��� ���� ����� ��� �Ͻÿ�. <����̸�, ������> ��� �Ͻÿ�.
SELECT   ENAME ����̸�, JOB ������
FROM     EMPLOYEE
WHERE    SALARY > (SELECT SALARY FROM EMPLOYEE WHERE ENO=7499);

--[����18]
--���� ������ ����ؼ� �� �μ��� �ּ� �޿��� �޴� ����� �̸� , �޿�, �μ���ȣ�� ����Ͻÿ�.
SELECT   ENAME �̸�, SALARY �޿�, DNO �μ���ȣ
FROM     EMPLOYEE
WHERE    SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

--[����19]
--���� ������ ����ؼ� �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.
ELECT ROUND(AVG(SALARY),0) AVG FROM EMPLOYEE;

SELECT   ENO �����ȣ, ENAME ����̸�
FROM     EMPLOYEE
WHERE    SALARY>(SELECT ROUND(AVG(SALARY),0) AVG FROM EMPLOYEE)
ORDER BY SALARY;

--[����20]
--���� ������ ����ؼ� DEPT ���̺� �ִ� �μ��� DNAME �÷�����  ��RESEARCH�� �μ��� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.
SELECT   D.DEPTNO, E.ENAME, E.JOB
FROM     EMPLOYEE E, DEPT D
WHERE    E.DNO=D.DEPTNO
AND      D.DNAME='RESEARCH';