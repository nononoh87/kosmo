--5. ����
-- �ϳ� �̻��� ���̺�κ��� �����͸� �˻��� ��

--������̺�(emp)�� ������ �μ����̺�(dept)�� �� ����� �μ����� ���
SELECT ename, dname
FROM    emp, dept;

--��������
SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE e.deptno = d.deptno; --�������

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e INNER JOIN dept d
on e.deptno = d.deptno;

--�ܺ� ����
SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE e.deptno = d.deptno(+);   --�ȵ�

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e LEFT OUTER JOIN dept d
WHERE e.deptno = d.deptno;

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e RIGHT OUTER JOIN dept d
WHERE e.deptno = d.deptno;

SELECT e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
WHERE e.deptno = d.deptno;

--������̺�(emp)�� �� ����� �Ŵ����� ��ȸ
SELECT e1.empno empno1, e1.ename ename1, e1.mgr mgr1, e2.empno empno2, e2.ename ename2
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

SELECT e1.empno empno1, e1.ename ename1, e1.mgr mgr1, e2.empno empno2, e2.ename ename2
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;

------------------------------------------------------------------------------------------------------------------------------------

--[#] ����(SET)

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    --SMITH / ADAMS / JAMES / MILLER
    --UNOON --������
   UNION ALL --�����տ� �ߺ��Ǵ� ������ �� �� ���
    --INTERSECT --������
    --MINUS --������
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
    --CLARK / KING / MILLER

------------------------------------------------------------------------------------------------------------------------------------

--[����]����

--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
select e.empno empno1, e.ename ename1, e.job job1, e.deptno deptno1, 
        d.dname dname1, d.loc loc1
from emp e left join dept d
on e.deptno = d.deptno;

--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
select e.empno empno1, e.ename ename1, e.sal sal1, d.dname, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
select e.ename ename1, d.dname dname1, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.comm>=0;

--4. �μ��� �μ���� �޿� �հ踦 ���
select d.dname dname1, sum(e.sal) sumsal1
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;

-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ���
select e.ename ename1, e.job job1, d.dname dname1, d.loc loc1
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'MANAGER';

------------------------------------------------------------------------------------------------------------------------------------

--�Ի繮��

--<��Ű��>
--�� ����ģ �Ӽ��� �⺻Ű(Primary Key)�̸� ENROLL�� �й��� STUDENT�� �й��� �����ϴ� 
--�ܷ�Ű(Foreign Key)�̰�, ENROLL�� ���¹�ȣ�� CLASS�� ���¹�ȣ�� �����ϴ� �ܷ�Ű�̴�. 
--STUDENT(�й� , �а�, �̸�) 
--CLASS(���¹�ȣ, �ð�, �����̸�) 
--ENROLL(�й�, ���¹�ȣ, ����)

--1. �Ʒ� ��Ű���� ���� ������ 3.0 �̻��� �л����� �̸��� �����ִ� SQL�ۼ��Ͻÿ�

SELECT s.�̸�
FROM student s, class c, enroll e
WHERE s.�й�=e.�й�
and c.���¹�ȣ=e.���¹�ȣ
and e.���� >= 3.0;

SELECT S.NAME
FROM ENROLL E FULL OUTER JOIN STUDENT S
ON E.NUM=S.NUM
FULL OUTER JOIN CLASS C
ON E.BUN=C.BUN
WHERE E.HAKJUM>=3.0;

--2. ���� �� �Ʒ��� ���� ���̺��� Full Outer Join�� ����� �ۼ��Ͻÿ�
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
------------------------------------------------------------------------------------------------------------------------------------

--1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e, dept d
WHERE       e.deptno=d.deptno and e.ename like '%L%';
--GROUP BY
--HAVING
--ORDER BY

SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e INNER JOIN dept d
    ON      e.deptno=d.deptno
WHERE       e.ename like '%L%';
--GROUP BY
--HAVING
--ORDER BY

--2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
SELECT e.ename ���, e.hiredate �Ի���, d.ename ������, d.hiredate ������ �Ի���
FROM emp e inner join emp d
    ON e.mgr = d.empno
WHERE e.hiredate < d.hiredate;

--3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
--��� ����� �Ŵ������ �Ŵ�����
--7839 KING 
--7698 BLAKE 7839 KING 
--7782 CLARK 7839 KING
--:
--���
SELECT e1.empno empno, e1.ename ename, e2.mgr, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno(+);

SELECT e1.empno empno, e1.ename ename, e2.mgr, e2.ename
FROM emp e1 left outer join emp e2
    ON e1.mgr=e2.empno;
