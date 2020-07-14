SELECT * FROM alter_tb;

--데이터 삭제 -DML
DELETE alter_tb;
rollback;

--TRUNCATE - DDL
TRUNCATE TABLE alter_tb;

--테이블 삭제 - DDL
DROP TABLE alter_tb;

--확인
DESC alter_tb;

SELECT * FROM tabs
WHERE table_name = upper('alter_tb');

-- user_tables : 사용자가 생성한 테이블들 정보 자료사전
SELECT * FROM user_tables;