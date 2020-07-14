-- NUMBER
CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5)
);
DESC type_test_01;

-- data1 : NUMBER
INSERT INTO type_test_01 (data1)
VALUES ( 1111111111222222222233333333334444444444 );
INSERT INTO type_test_01 (data1)
VALUES ( 11111111112222222222333333333344444444445555555555 );

SELECT data1 FROM type_test_01;--조회


-- data2 : NUMBER(10)
INSERT INTO type_test_01 (data2)
VALUES ( 12345 );

--INSERT INTO type_test_01 (data2)
--VALUES ( 12345678901234567890 ); -- 오류 ,안됨 10자리를 넘어감

INSERT INTO type_test_01 (data2)
VALUES ( 1234.5678 );-- 소수점 이하 반올림

SELECT data2 FROM type_test_01; -- 조회


-- data3 : NUMBER(5,2)
INSERT INTO type_test_01(data3)
VALUES ( 23.56 );

INSERT INTO type_test_01(data3)
VALUES ( 23.5678 ); -- 소수점 3재짜리 반올림 된다.

INSERT INTO type_test_01(data3)
VALUES ( 1234.56 ); -- 오류 , 정수부 자리 너무 많음

INSERT INTO type_test_01(data3)
VALUES ( 34.5 ); -- 꼭 소수점2자리를 채우지 않아도된다.

SELECT data3 FROM type_test_01 WHERE data3 IS NOT NULL; -- 조회


-- data4 : NUMBER(4,5) - 0.0xxxx 
INSERT INTO type_test_01(data4)
VALUES ( 1234 ); -- 안됨  , 정수 입력 불가

INSERT INTO type_test_01(data4)
VALUES ( 0.1234 ); -- 안됨 , 소수점 첫째자리가 0이어야한다.

INSERT INTO type_test_01(data4)
VALUES ( 0.012 ); -- 가능, 소수점4자리를 꼭채울필요는 없다.

INSERT INTO type_test_01(data4)
VALUES ( 0.0123456789 ); -- 가능 , 넘는 자리 반올림 된다.

SELECT data4 FROM type_test_01 WHERE data4 IS NOT NULL; -- 조회

--SELECT * FROM type_test_01;-- 전체 조회