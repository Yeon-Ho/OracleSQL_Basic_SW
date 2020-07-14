--�������
-- NOT NULL
CREATE TABLE cons_01(
    data VARCHAR2(10) NOT NULL ); --�÷��������� �������Ǽ�����

--���̺� ���� ��ȸ
DESC cons_01;

--�������� �ڷ����
SELECT * FROM user_constraints
WHERE table_name = upper('cons_01');

-- ���������� �ο��� �÷� ���� �ڷ����
SELECT * FROM user_cons_columns
WHERE table_name = upper('cons_01');

-- �׽�Ʈ ����
INSERT INTO cons_01
VALUES (12);
INSERT INTO cons_01
VALUES ('A');
INSERT INTO cons_01
VALUES (null); --����!

SELECT * FROM cons_01; -- ��ȸ

--���̺� ���� �ڷ�������� ��������� ������ �ʴ´�
--���̺� ���� �ڷ����
SELECT * FROM tab; 
--���̺� ���� �ڷ���� (��)
SELECT * FROM tabs;
-- DB�� ��� ���̺� ���� �ڷ����
SELECT * FROM all_tables;

-- NOT NULL �������ǿ� �̸� �ٿ��� �����ϱ�
CREATE TABLE cons_02(
    data VARCHAR2(10) CONSTRAINT cons_02_nn NOT NULL);--�÷��������� �������Ǽ�����

--�������� �ڷ����
SELECT * FROM user_constraints
WHERE table_name = upper('cons_02');

-- �������� ���� ���̺� ���� (���̺������� �����ϱ�)
CREATE TABLE cons_03 (
    data VARCHAR2(10) );

-- NOT NULL ���������� �÷��� ������Ÿ�Կ� ���յǾ��ִ�
-- NOT NULL ���������� �ݿ��� ������ ������Ÿ���� �����ؾ��Ѵ�.
ALTER TABLE cons_03
--ADD | MODIFY | DROP -- �߰� |���� |����
MODIFY data NOT NULL;

 --���̺� ���� Ȯ��
DESC cons_03;


-- �������� �߰� - UNIQUE

-- UNIQUE ����� ���(1) ���̺���
ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uk UNIQUE (data);-- UNIQUE ����� ���(3)ALTER

INSERT INTO cons_03 VALUES (null); -- NOT NULL
INSERT INTO cons_03 VALUES ( 'A' );
INSERT INTO cons_03 VALUES ( 'A' ); -- �ߺ��Ұ� UNIQUE
INSERT INTO cons_03 VALUES ( 'B' );
SELECT * FROM cons_03;

-- UNIQUE ����� ���(2)- �÷����� ����鼭 ���ÿ�
CREATE TABLE cons_04 (
    data VARCHAR2(10) CONSTRAINT cons_uk UNIQUE);
-- UNIQUE ����� ���(3) - �÷�����
CREATE TABLE cons_05 (
    data VARCHAR2(10),
    CONSTRAINT cons05_uk UNIQUE (data) );