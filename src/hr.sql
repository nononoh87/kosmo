--( employees ���̺� )

--- 1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
SELECT employee_id, (first_name||' '||last_name) name, hire_date
FROM employees
WHERE to_char(hire_date,'YYYY') = 2003;

-- 2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
SELECT *
FROM employees
WHERE lower(job_id) = 'fi_account' or lower(job_id) = 'ft_mgr'
or lower(job_id) = 'sa_man' or lower(job_id) = 'sa_rep';

-- IN ������ ���
SELECT *
FROM employees
WHERE lower(job_id) IN ('fi_account', 'ft_mgr', 'sa_man', 'sa_rep');

-- 3. Ŀ�̼��� �޴� ������� ������ ���
SELECT *
FROM employees
WHERE commission_pct is not null;

-- 4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
SELECT job_id,
CASE job_id
WHEN 'SA_MAN' THEN '�Ǹźμ�'
WHEN 'SA_REP' THEN '�Ǹźμ�'
ELSE '�� �� �μ�'
END as job
FROM employees;

--decode ���
SELECT job_id,
decode(job_id,'SA_MAN','�Ǹźμ�','SA_REP','�Ǹźμ�','�׿ܺμ�') dept_name
FROM employees;

-- 5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
SELECT to_char(hire_date, 'YYYY') year, min(salary) min, max(salary) max,
sum(salary) sum, avg(salary) avg
FROM employees
GROUP BY to_char(hire_date, 'YYYY');

-- 6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
SELECT department_id, round(avg(salary),0) avg -- ��� : �Ҽ��� �Ʒ����� �ݿø�
FROM employees
GROUP BY department_id
HAVING avg(salary)>= 10000
ORDER BY avg(salary) desc;

-- 7. �μ��� �ִ� �޿��� ���Ͻÿ�.
SELECT department_id, max(salary) max_salary
FROM employees
GROUP BY department_id;
-------------------------------------------------------------------------------

--REGEXP�� ���Խ��̶�� ��, REGEXP_like�� �ܼ��� ���ڿ��� ���ԵǾ� �ִ��� 
--���ϴ� like�� �Ѿ, ���Խ��� ���Ͽ� ��ġ�ϴ� ��� �����ϴ� �Լ��Դϴ�.

-- ���̺� ����
CREATE TABLE reg_tab( text varchar2(20) );
DROP TABLE reg_tab;
-- ���ڵ� �Է�

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
INSERT INTO reg_tab VALUES('��');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('������');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('����');

-- Ŀ��
COMMIT;

-- 1. text �÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�
SELECT *
FROM reg_tab
WHERE text LIKE 't%';

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^t');


-- 2. text �÷��� ���ڿ����� 't'�� ������ ������ �˻�
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, 't$');

-- 3. ù��° 't'�� �����Ͽ� 5��° 'r'�� �ִ� ������ �˻�
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^t...r');
?

-- 4. ���ڷ� ������ ������ �˻�
SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '[0-9]$');
?
-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[0-9]');
?
-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�
SELECT*
FROM reg_tab
WHERE NOT REGEXP_LIKE(TEXT, '^[0-9]');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^[^0-9]');

-- 7. �빮�ڷ� �����ϴ� ������ �˻�
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[A-Z]');
?
-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�
SELECT*
FROM reg_tab
WHERE NOT REGEXP_LIKE(TEXT, '^[a-z]');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'^[^a-z]');

-- 9. �ѱ۷� �����ϴ� ������ �˻�
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, '^[��-��]');
?
-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
SELECT*
FROM reg_tab
WHERE REGEXP_LIKE(TEXT, 'gg')or REGEXP_LIKE(TEXT, 'GG');

SELECT *
FROM reg_tab
WHERE REGEXP_LIKE(text,'gg|GG');
-------------------------------------------------------------------------------

1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���

select empno, ename, job, sal, sal*1.15 as NEW_Salary, sal*1.15-sal as Increase
from emp;

-- 2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
select ename, hiredate, next_day(add_months( hiredate, 6),2) as commonday
from emp;

--3.�̸�, �Ի���, �Ի��Ϸκ��� ��������� ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���
select ename, hiredate, sal,
to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY') as workyear,
sal*(to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')) as sumsal
from emp;

--4.�̸�, ����, �Ի���, �Ի��� ������ ���
?SELECT ename, job, hiredate, to_char(hiredate,'day') AS HIRED
FROM emp;

--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�,
--10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS �ο���
FROM EMP
WHERE DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
SELECT JOB, TRUNC(AVG(SAL)) ���, MAX(SAL) �ִ�
FROM EMP
--WHERE
GROUP BY JOB
HAVING AVG(SAL)>=2000
ORDER BY AVG(SAL) DESC;

--7. ���� �Ի�⵵ ���� �ο����� ���
SELECT TO_CHAR(HIREDATE,'YYYY') AS �Ի�⵵, COUNT(*)
FROM EMP
--WHERE
GROUP BY TO_CHAR(HIREDATE,'YYYY');

8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)

?

?

9. ������ ���� ���

   ( ���� ��µ� �ο����� �ٸ� ���� ���� )

?

   CLERK     SALESMAN        MANAGER                       (������)

-----------------------------------------------------------------------

     4                 4                      3                             (�ο���)

?

?

    

?

10. ������ ���� ������, �μ��� ���

   ( ���� ���� �ݾ��� �ٸ� ���� ���� )

?

������       10���μ�     20���μ�       30���μ�       �޿��հ�

----------------------------------------------------------------------------------------

CLERK        1300        1900          950          4150

SALESMAN      0           0            5600         5600

PRESIDENT    5000         0             0           5000

MANAGER      2450        2975          2850         8275

ANALYST       0          6000           0           6000

------------------------------------------------------------------------

# HR ��������

--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
select e.EMPLOYEE_ID,d.DEPARTMENT_NAME, e.JOB_ID
from employees e right outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.last_name = 'King';
?

--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
select e.employee_id id, d.department_name dname, j.job_title jobname
from employees e, departments d, jobs j
where e.department_id = d.department_id
        and e.job_id = j.job_id
        and e.last_name = 'King';   --���� ���

select e.employee_id as ��� , e.last_name as �����, d.department_name as �μ���, j.job_title as ������
from employees e inner join departments d
            on e.department_id = d.department_id
            full outer join jobs j
            on e.job_id = j.job_id
where e.last_name like 'King';

--3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
--(*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
SELECT  e.employee_id as ���, e.first_name||' '||last_name as �̸�, e.hire_date as �Ի���, d.department_name as �μ���  
FROM    employees e left outer join departments d
on      e.employee_id = d.department_id;


--4. 'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
--(*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
SELECT e1.first_name||' '||e1.last_name �����, e2.first_name||' '||e2.last_name �Ŵ�����, d.department_name DEPTNAME
FROM employees e1, employees e2, departments d
WHERE e2.manager_id=e1.employee_id(+) and e1.department_id =d.department_id and d.department_name = 'Executive'; 

------------------------------------------------------------------------------



