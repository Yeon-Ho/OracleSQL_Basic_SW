---------- 롤, 권한 부여 실습 QUIZ ----------
-- 1. SCOTT계정을 이용하여 ROLE 생성
--  - 이름 : ROLE_TEST
CREATE ROLE ROLE_TEST;
--  - 롤에 권한 부여
--	CREATE TABLE
--	CREATE SESSION
--	CREATE VIEW

--(SYSTEM 계정으로)
GRANT CREATE TABLE,CREATE SESSION ,CREATE VIEW
TO scott
WITH ADMIN OPTION;
--(SCOTT 계정으로)
GRANT CREATE TABLE,CREATE SESSION ,CREATE VIEW
TO ROLE_TEST;

-- 2. ROLE_TEST 롤을 test2에 부여

--(SYSTEM 계정으로)
GRANT CREATE USER
to scott;
--(scott계정으로)
CREATE USER test2 IDENTIFIED BY 1234;

GRANT ROLE_TEST
TO test2;

-- 3. 확인
--  - test2/1234 로 connection(접속)
--  - 테이블 생성

CREATE TABLE testTable(
    num NUMBER
);

-- 테이블 스페이스, tablespace
-- 테이블이 저장되는 공간(파일)

--test2 계정 전용 tablespace 생성하기

-- (SYSTEM 계정으로 수행 할 것)
-- 테이블 스페이스 생성
-- 기본크기 100M ,부족하면 10M씩 확장됨 , 최대 500M까지
CREATE TABLESPACE test2_db
DATAFILE 'C:\oraclexe\app\oracle\oradata\test2.db'
SIZE 100M
AUTOEXTEND ON NEXT 10M
MAXSIZE 500M;

-- 테이블스페이스를 사용자계정에 적용하기
ALTER USER test2
DEFAULT TABLESPACE test2_db -- 기본 테이블스페이스 지정
QUOTA UNLIMITED ON test2_db -- 테이블스페이스 용량 할당량(전부)
TEMPORARY TABLESPACE temp; --임시테이블로 temp 지정


-- 테이블스페이스 삭제
DROP TABLESPACE test2_db
INCLUDING CONTENTS AND DATAFILES -- 실데이터와 DBF파일 삭제
CASCADE CONSTRAINTS;--의존성을가지는 모든 제약사항 삭제





--  - CREATE TABLE testTable ( num NUMBER ); 수행
--	-> 안만들어집니다!
-------------------------------------------