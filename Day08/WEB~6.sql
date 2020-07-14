 -- PRIMARY KEY(컬럼레벨) 컬럼옆에 이름있이
 CREATE TABLE cons_09(
    no NUMBER CONSTRAINT cons_09_pk PRIMARY KEY,
    data VARCHAR2(20) NOT NULL
 );

-- 이름 없이 프라이머리키(컬럼레벨)
 CREATE TABLE cons_10(
    no NUMBER PRIMARY KEY,  
    data VARCHAR2(20) NOT NULL
 );
 
 -- 마지막에 이름에 프라이머리키 설정(컬럼레벨)
 CREATE TABLE cons_11(
    no NUMBER,
    data VARCHAR2(20) NOT NULL,
    CONSTRAINT cons_11_pk PRIMARY KEY(no)
 );

-- 테이블만 만들고 ALTER로 (테이블레벨)
CREATE TABLE cons_12(
    no NUMBER,
    data VARCHAR2(20) NOT NULL
 );
ALTER TABLE cons_12
ADD CONSTRAINT cons_12_pk PRIMARY KEY (no);


SELECT * FROM user_constraints
WHERE table_name = upper('cons_13');


-- 복합키 , PRIMARY KEY를 여러개의 컬럼으로 지정하기
CREATE TABLE cons_13(
    trade_date DATE,
    trade_no NUMBER);

-- 컬럼 묶어서 프라이머리키로 지정
ALTER TABLE cons_13
ADD CONSTRAINT cons_13_pk
    PRIMARY KEY(trade_date, trade_no);

-- 프라이머리키 삭제
ALTER TABLE cons_13
DROP CONSTRAINT cons_13_pk;
