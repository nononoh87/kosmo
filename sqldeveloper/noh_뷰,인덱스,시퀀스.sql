--[����Ŭ] ��, �ε���, ������

-- 7. ��(VIEW)
--  ������ ����
--  ������ ������ ���󵵰� ���� ���

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
select * from v_emp;
DESC v_emp;

insert into v_emp values(1000,'ȫ�浿', 20);
select * from v_emp;
select * from emp;

insert into v_emp values(1000,'ȫȫ��', 20); -- PK���ǿ� �ɷ��� ����

insert into v_emp values(1000,'ȫȫ��', 90); -- FK���ǿ� �ɷ��� ����

CREATE OR REPLACE VIEW v_emp  AS          
           select empno, ename, deptno from emp
           with read only;   -- �������̺��� �ջ��� �������� �Ϻη� �б� �������� ����.
           
insert into v_emp values(2000,'ȫȫ��', 30);

------------------------------------------------------------------------------
           
--[ ���� ] EMP ���̺��� 30�� �μ��� 

--EMPNO�� EMP_NO�� ENAME�� NAME�� SAL�� SALARY�� �ٲ㼭 
--EMP_30 �並 �����Ͻÿ�

CREATE OR REPLACE VIEW v_emp_30 AS
           select empno EMP_NO, ename ENAME, sal SALARY
           from emp
           where deptno=30
           with read only;

SELECT * FROM v_emp_30;

-- (3) ���պ�
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT * FROM v_emp_info;

insert into v_emp_info(empno, ename, dname) values (3333,'�Ͳ���',30); --�Է��� �ȵ�
insert into v_emp_info(empno, ename) values (3333,'�Ͳ���');
delete from v_emp_info where empno = 7788; -- ��� �б��������� ��������.

-- [ ���� ] �μ����� �μ���, �ּұ޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� V_DEPT_SUM �並 �����Ͽ���.
Create or replace view v_dept_sum as
select d.dname, min(sal) emin, max(sal) emax, round(avg(sal)) eavg 
from emp e left outer join dept d
      on e.deptno=d.deptno
group by d.dname
with read only;

select * from v_dept_sum;

-- RESEARCH     1000        5000        3000
insert into emp (empno, ename, sal, deptno) values(4444,'ȣ��', 9900, 20); -- PK���ǿ� �ɷ��� ����

-------------------------------------------------------------------------------

-- 8. ������ (sequence) : �ڵ�������

--* �������� ���Ǵ� �ǻ��÷�
--      CURRVAL : ���� ������ ��
--      NEXTVAL : ���� ������ ������ ��

create sequence seq_temp;
SELECT seq_temp.NeXTVAL FROM dual;

SELECT seq_temp.CURRVAL FROM dual;

-- 5000������ 10�� �����ϴ� �ڵ������� (������)
create sequence seq_temp2
    start with 5000 increment by 10;

insert into emp (empno, ename) values(seq_temp2.nextval,'�ھ�');

DESC EMP;

-------------------------------------------------------------------------------

--9. �ε��� (INDEX) - ���� �˻��� ����

--[ ���� ] rowid Ȯ��
--  select empno, ename, job, rowid from emp;
-- [����] hr����


    
    



