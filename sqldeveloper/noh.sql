CREATE TABLE dept AS SELECT * FROM scott.dept;

DESC dept;

SELECT*FROM dept;

ALTER TABLE dept
    add CONSTRAINT pk_dept_deptno PRIMARY KEY (depno);
-- 1. student ���̺� �����
CREATE TABLE student
(
no      char(4),
name    varchar2(10) not null,
gender  varchar2(10),
addr    varchar2(50),
jumin   char(15) not null,
deptno  number(2),
CONSTRAINT fk_student_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);
-- 2. �й� �÷��� �⺻Ű(primary key) �������� �߰�
alter table student
add CONSTRAINT pk_student_no PRIMARY KEY (no);

-- 3. �ֹι�ȣ �÷����� NOT NULL �������� ����
alter table student
modify jumin null ;

-- 4. �ּ� �÷��� ����Ʈ ������������ ����� �߰�
alter table student
MODIFY addr default '����';

-- 5. ���� �÷��� üũ ������������ ��������, �������� �߰�
alter table student
modify( check (gender in ('����','����')));

-- [ Ȯ�� ] ���ڵ� �Է½� Ȯ��

INSERT INTO student(no, name, gender, addr, jumin )

VALUES('1111', '������', '����', '����� ������', '801212-1234567' );
-- ���� ����

INSERT INTO student(no, name, jumin )

VALUES('2222', '������', '881212-1234567');
-- ���� ����

INSERT INTO student(no, name, jumin )

VALUES('1111', '������', '881212-1234567');
-- �⺻Ű�� no �����Ϳ� 1111�� �־ ������


INSERT INTO student(no, name, gender, jumin )

VALUES('3333', '������', '����', '830303-1234567');
-- ���������� ����, ���� �ε� ����<�� ����


INSERT INTO student(no, name, addr, jumin )

VALUES('4444', '�����', '����� ���ʱ�', '990909-1234567');
-- ���� ����

INSERT INTO student(no, name, addr, deptno )

VALUES('8888', '�̺���','����� �Ѱ�', 50);
-- �ܷ�Ű�� deptno�� 50�� ����


-- 6. library ���̺� �����
create table library
(
rent_id number(2),
book_id varchar(10) not null,
hakbun char(4),
CONSTRAINT pk_library_rent_id PRIMARY Key (rent_id),
CONSTRAINT fk_library_no FOREIGN KEY (hakbun) REFERENCES student (no)
);

--Ȯ��
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );
-- ���� : student �� no�� 3333�� ����

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );
-- ���� : student �� no�� 5555�� ����
------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE DEPT;
DROP TABLE student;
DROP TABLE library;

CREATE TABLE DEPT
(
DEPTID NUMBER(5),
DEPTNAME VARCHAR(50),
CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)
);

CREATE TABLE EMP
(
EMPID NUMBER(5), 
NAME VARCHAR2(20), 
RESID CHAR(14), 
GENDER VARCHAR2(10), 
AGE NUMBER(5), 
DEPTID NUMBER(5) NOT NULL,
CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID),
CONSTRAINT UK_EMP_RESID UNIQUE (RESID),
CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����')),
CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) REFERENCES DEPT(DEPTID)
);

------------------------------------------------------------------------------------------------------------------------------------

-- INSERT (TABLE: DEPT)
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10001, 'IT��');

INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10002, '������');

INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10003, '��������');

-- INSERT (TABLE: EMP)

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '������', '881112-1187527', '����', 32, 10003);

-- TEST DML (DELETE)
DELETE FROM DEPT WHERE DEPTID = 10003;

-- SELECT ALL (BOTH)
SELECT * FROM DEPT;

SELECT * FROM EMP;

-- DROP (BOTH)
DROP TABLE EMP;
DROP TABLE DEPT;
