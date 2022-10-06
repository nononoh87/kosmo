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
INSERT INTO reg_tab VALUES('�����');
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