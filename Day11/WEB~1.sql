---------- ��, ���� �ο� �ǽ� QUIZ ----------
-- 1. SCOTT������ �̿��Ͽ� ROLE ����
--  - �̸� : ROLE_TEST
CREATE ROLE ROLE_TEST;
--  - �ѿ� ���� �ο�
--	CREATE TABLE
--	CREATE SESSION
--	CREATE VIEW

--(SYSTEM ��������)
GRANT CREATE TABLE,CREATE SESSION ,CREATE VIEW
TO scott
WITH ADMIN OPTION;
--(SCOTT ��������)
GRANT CREATE TABLE,CREATE SESSION ,CREATE VIEW
TO ROLE_TEST;

-- 2. ROLE_TEST ���� test2�� �ο�

--(SYSTEM ��������)
GRANT CREATE USER
to scott;
--(scott��������)
CREATE USER test2 IDENTIFIED BY 1234;

GRANT ROLE_TEST
TO test2;

-- 3. Ȯ��
--  - test2/1234 �� connection(����)
--  - ���̺� ����

CREATE TABLE testTable(
    num NUMBER
);

-- ���̺� �����̽�, tablespace
-- ���̺��� ����Ǵ� ����(����)

--test2 ���� ���� tablespace �����ϱ�

-- (SYSTEM �������� ���� �� ��)
-- ���̺� �����̽� ����
-- �⺻ũ�� 100M ,�����ϸ� 10M�� Ȯ��� , �ִ� 500M����
CREATE TABLESPACE test2_db
DATAFILE 'C:\oraclexe\app\oracle\oradata\test2.db'
SIZE 100M
AUTOEXTEND ON NEXT 10M
MAXSIZE 500M;

-- ���̺����̽��� ����ڰ����� �����ϱ�
ALTER USER test2
DEFAULT TABLESPACE test2_db -- �⺻ ���̺����̽� ����
QUOTA UNLIMITED ON test2_db -- ���̺����̽� �뷮 �Ҵ緮(����)
TEMPORARY TABLESPACE temp; --�ӽ����̺�� temp ����


-- ���̺����̽� ����
DROP TABLESPACE test2_db
INCLUDING CONTENTS AND DATAFILES -- �ǵ����Ϳ� DBF���� ����
CASCADE CONSTRAINTS;--�������������� ��� ������� ����





--  - CREATE TABLE testTable ( num NUMBER ); ����
--	-> �ȸ�������ϴ�!
-------------------------------------------