--제약사항
-- NOT NULL
CREATE TABLE cons_01(
    data VARCHAR2(10) NOT NULL ); --컬럼레벨에서 제약조건설정함

--테이블 정보 조회
DESC cons_01;

--제약조건 자료사전
SELECT * FROM user_constraints
WHERE table_name = upper('cons_01');

-- 제약조건이 부여된 컬럼 정보 자료사전
SELECT * FROM user_cons_columns
WHERE table_name = upper('cons_01');

-- 테스트 삽입
INSERT INTO cons_01
VALUES (12);
INSERT INTO cons_01
VALUES ('A');
INSERT INTO cons_01
VALUES (null); --오류!

SELECT * FROM cons_01; -- 조회

--테이블 정보 자료사전에는 제약사항이 나오지 않는다
--테이블 정보 자료사전
SELECT * FROM tab; 
--테이블 정보 자료사전 (상세)
SELECT * FROM tabs;
-- DB의 모든 테이블 정보 자료사전
SELECT * FROM all_tables;

-- NOT NULL 제약조건에 이름 붙여서 설정하기
CREATE TABLE cons_02(
    data VARCHAR2(10) CONSTRAINT cons_02_nn NOT NULL);--컬럼레벨에서 제약조건설정함

--제약조건 자료사전
SELECT * FROM user_constraints
WHERE table_name = upper('cons_02');

-- 제약조건 없이 테이블 생성 (테이블레벨에서 지정하기)
CREATE TABLE cons_03 (
    data VARCHAR2(10) );

-- NOT NULL 제약조건은 컬럼의 데이터타입에 결합되어있다
-- NOT NULL 제약조건을 반영할 때에는 데이터타입을 변경해야한다.
ALTER TABLE cons_03
--ADD | MODIFY | DROP -- 추가 |변경 |삭제
MODIFY data NOT NULL;

 --테이블 정보 확인
DESC cons_03;


-- 제약조건 추가 - UNIQUE

-- UNIQUE 만드는 방법(1) 테이블레벨
ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uk UNIQUE (data);-- UNIQUE 만드는 방법(3)ALTER

INSERT INTO cons_03 VALUES (null); -- NOT NULL
INSERT INTO cons_03 VALUES ( 'A' );
INSERT INTO cons_03 VALUES ( 'A' ); -- 중복불가 UNIQUE
INSERT INTO cons_03 VALUES ( 'B' );
SELECT * FROM cons_03;

-- UNIQUE 만드는 방법(2)- 컬럼레벨 만들면서 동시에
CREATE TABLE cons_04 (
    data VARCHAR2(10) CONSTRAINT cons_uk UNIQUE);
-- UNIQUE 만드는 방법(3) - 컬럼레벨
CREATE TABLE cons_05 (
    data VARCHAR2(10),
    CONSTRAINT cons05_uk UNIQUE (data) );