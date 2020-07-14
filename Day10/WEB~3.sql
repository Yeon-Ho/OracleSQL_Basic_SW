-- ������ , SEQUENCE
CREATE SEQUENCE seq_emp;

-- ������ �ڷ���� ��ȸ
SELECT * FROM user_sequences;

--SELECT length('banana') FROM dual;
SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

-- ��� ���
INSERT INTO emp (empno , ename)
VALUES (SEQ_EMP.nextval , 'DAVE3'); --ename �� UNIQUE�� �ߺ��Ұ�

SELECT * FROM emp;

SELECT * FROM user_sequences;

-- ����(�ɼ�)�ο��ؼ� �����������ϱ�
CREATE SEQUENCE test_seq
START WITH 2001
MINVALUE 2001
MAXVALUE 3000
INCREMENT BY 100;

SELECT test_seq.nextval FROM dual;

SELECT test_seq.currval FROM dual;

ALTER SEQUENCE test_seq
CYCLE
CACHE 5;

SELECT * FROM user_sequences
WHERE sequence_name= upper('test_seq');

