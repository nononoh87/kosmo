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
�л���   name        varchar2(20)
����      kor         number(3)
����      eng         number(3)
����      total       number
���      avg         number(3,2) --���ڸ��� ��ü�ڸ���
*/

CREATE TABLE student_score
(
 id          char(4),
 name      varchar2(20),
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

------------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------------------

[ ���� ] SQL ����

--1. sawon ���̺��� �����ϼ���.
--sabun�� 6�ڸ� ����
--sawon_name�� �ִ� �ѱ� 5�ڸ�
--ubmu�� �ִ� �ѱ� 10�ڸ�
--weolgub�� ������ 8�ڸ��� �Ҽ��� 2�ڸ�
--buseo�� ���� 3�ڸ�
create table sawon
(
sabun number(6),
sawon_name varchar2(15),
ubmu varchar2(30),
weolgub number(10,2),
buseo number(3)
);

--2. ���� ���̺��� sabun�� �⺻Ű�� ����
alter table sawon
add constraint pk_info_sabun primary key(sabun);

--3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL ���� �Էµ��� �ʵ��� ����
alter table sawon
add (jiyeok varchar(30) not null);

--4. weolgub �÷��� ������ 7�ڸ��� ����
alter table sawon
modify(weolgub number(7));

--5. ubmu�÷��� �����ߡ�, ������������, �������� �� ������ ������ �Էµǵ��� ����
alter table sawon
add constraint ubmu_check check(ubmu in ('����', '��������', '����'));

--6. ubmu�÷��� �����Ͱ� �Է��� �ȵ� ��� �����尪���� �����ߡ��� ����
alter table sawon
modify(ubmu default '����');

--7. buseo ���̺��� �����ϼ���
--buseo_no�� ���� 3�ڷ� �̷���� ��ȣ�� �⺻Ű
--buseo_name�� �ִ� �ѱ� 10�ڸ�
create table buseo
(
buseo_no number(3),
buseo_name varchar2(30),
constraint pk_info_buseo_no primary key (buseo_no)
);

--8. sawon ���̺��� buseo �÷��� buseo ���̺��� buseo_no�� �����ϴ� �ܷ�Ű�� ����
alter table sawon
add constraint fk_info_buseo foreign key (buseo) references buseo(buseo_no);


--9. buseo ���̺� ������ �Է�
insert into buseo(buseo_no, buseo_name)
values (101, '����Ʈ��������������');
insert into buseo(buseo_no, buseo_name)
values (202, '������');
insert into buseo(buseo_no, buseo_name)
values (303, '�����ڿ���');

--10. sawon ���̺� ������ �Է� (�Է��� �ȵ� ��쵵 ����)
insert into sawon (sabun, sawon_name, weolgub, buseo, jiyeok)
values(8001,'ȫ�浿�̱�',100000, 101,'�λ�');
insert into sawon (sabun, sawon_name, ubmu, weolgub, buseo, jiyeok)
values(8002,'ȫ����','�繫',200000, 202,'��õ'); --�ǹ� ���� �ȵ�
insert into sawon (sabun, sawon_name, ubmu, buseo, jiyeok)
values(8003,'ȫ���','����', 111,'����'); --�μ� �μ��� ����
insert into sawon (sabun, sawon_name, weolgub, jiyeok)
values(8004,'ȫ�漮',12345678,'����'); --���ްɸ�
insert into sawon (sabun, sawon_name, ubmu, buseo, jiyeok)
values(8005,'ȫ��ö','��������', 303,'�Ǳ�');

--11. sawon ���̺��� jiyeok �÷��� ����
alter table sawon
drop column jiyeok;

--12. buseo ���̺��� buseo ���� �������ڿ��Ρ��� ���� ����
delete from buseo
where buseo_name = '�����ڿ���'; --�����ֿ� �ٽ��մϴ�.

--13. sawon ���̺��� ��� ������ �����ϰ� ��������� ����
drop table sawon; --���� truncate�� ���
--truncate table sawon;

--14. 1~8 �ܰ������ ������ ���̺��� ���� �ϳ��� CREATE ������ �ۼ�
create table sawon --1
(
sabun number(6),
sawon_name varchar2(15),
ubmu varchar2(30) default '����', --6
weolgub number(7), --4
buseo number(3),
jiyeok varchar(30) not null, --3
constraint pk_sabun primary key(sabun), --2
constraint ubmu_check check(ubmu in ('����', '��������', '����')), --5
constraint fk_info_buseo foreign key (buseo) references buseo(buseo_no) --8
);

create table buseo --7
(
buseo_no number(3),
buseo_name varchar2(30),
constraint pk_buseo_no primary key (buseo_no)
)
--drop table buseo;

------------------------------------------------------------------------------------------------------------------------------------

[ ���� ] select �˻�

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

select * from emp;