SELECT * FROM alter_tb;

--������ ���� -DML
DELETE alter_tb;
rollback;

--TRUNCATE - DDL
TRUNCATE TABLE alter_tb;

--���̺� ���� - DDL
DROP TABLE alter_tb;

--Ȯ��
DESC alter_tb;

SELECT * FROM tabs
WHERE table_name = upper('alter_tb');

-- user_tables : ����ڰ� ������ ���̺�� ���� �ڷ����
SELECT * FROM user_tables;