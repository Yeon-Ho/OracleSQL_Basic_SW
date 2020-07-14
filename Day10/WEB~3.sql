-- 시퀀스 , SEQUENCE
CREATE SEQUENCE seq_emp;

-- 시퀀스 자료사전 조회
SELECT * FROM user_sequences;

--SELECT length('banana') FROM dual;
SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

-- 사용 방법
INSERT INTO emp (empno , ename)
VALUES (SEQ_EMP.nextval , 'DAVE3'); --ename 이 UNIQUE라서 중복불가

SELECT * FROM emp;

SELECT * FROM user_sequences;

-- 조건(옵션)부여해서 시퀀스생성하기
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

