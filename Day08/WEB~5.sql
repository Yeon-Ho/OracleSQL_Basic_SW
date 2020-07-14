-- CHECK
CREATE TABLE cons_06(
--    data NUMBER CHECK( data>=1 AND data <=100) );
    data NUMBER CHECK( data BETWEEN 1 AND 100) );
    
--자료사전
SELECT * FROM user_constraints
WHERE table_name = upper('cons_06');

SELECT * FROM user_cons_columns
WHERE constraint_name = upper('SYS_C007031');

--테이블 정보 조회
DESC cons_01;
DESC cons_06;

--테스트 삽입
INSERT INTO cons_06
VALUES ( 30 );

INSERT INTO cons_06
VALUES ( 200 ); -- 제약조건 범위를 벗어난다. 에러!

-- cons_07 테이블 생성
--  컬럼 : data NUMBER

-- ALTER TABLE 구문을 이용하여 data에
-- 제약사항 CHECK 추가하기
-- 1000,2000,3000,4000 만 입력 가능하도록 만들기;
CREATE TABLE cons_07(
    data NUMBER);

DESC cons_07;

SELECT * FROM user_constraints
WHERE table_name = upper('cons_07');

-- 제약조건 추가
ALTER TABLE cons_07
ADD CONSTRAINT cons_07_uk
    CHECK(data IN(1000,2000,3000,4000));

-- 제약조건 삭제
ALTER TABLE cons_07
DROP CONSTRAINT SYS_C007050;

-- 제약조건 수정
ALTER TABLE cons_07
MODIFY data CHECK(data IN(1000,2000,3000,4000));


-- DEFAULT
CREATE TABLE cons_08(
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10));

-- 제약사항 자료사전에 DEFAULT 설정은 나오지 않음    
SELECT * FROM user_constraints
WHERE table_name = upper('cons_08');

-- 테이블 컬럼 상세 정보 자료사전
SELECT * FROM user_tab_columns
WHERE table_name = upper('cons_08');

ALTER TABLE cons_08
MODIFY data2 DEFAULT sysdate;

ALTER TABLE cons_08
MODIFY data3 DEFAULT 'HI' NOT NULL;

-- 명시적으로 null을 INSERT하면 DEFAULT가 동작하지 않는다.
INSERT INTO cons_08
VALUES ( null , null ,'AA');

SELECT * FROM cons_08;

INSERT INTO cons_08(data1)
VALUES ( 6666 ) ; -- 다른컬럼의 값을 뭐로넣지않았을때 DEFAULT가 동작


-- DEFAULT 주의사항
INSERT INTO cons_08; -- 안됨 , VALUES 절 없음
INSERT INTO cons_08 VALUES (); -- 안됨 , 데이터 있어아함
-- 모든 컬럼의 DEFAULT를 한번에 동작되게 하는 방법은 없다