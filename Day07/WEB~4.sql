-- VARCHAR2(n) : 문자

CREATE TABLE type_test_02(
    data VARCHAR2(10) 
    );
DESC type_test_02; 

-- 데이터 삽입해보기 , 에러나는 데이터는~??
-- '1234567890'
-- '123456789012345' --에러
-- '일이삼사오육칠팔구십' --에러
-- '일이삼'

INSERT INTO type_test_02(data)
VALUES ('1234567890');

INSERT INTO type_test_02(data)
VALUES ('123456789012345');-- 안됨

INSERT INTO type_test_02(data)
VALUES ('일이삼사오육칠팔구십'); -- 안됨

INSERT INTO type_test_02(data)
VALUES ('일이삼');

SELECT * FROM type_test_02;-- 조회


CREATE TABLE type_test_03(
    data1 VARCHAR2(10 BYTE), --10 바이트
    data2 VARCHAR2(10 CHAR) -- 10개 문자
);

INSERT INTO type_test_03(data1,data2)
VALUES('일이삼' , '일이삼사오육칠팔구십');

INSERT INTO type_test_03(data1,data2)
VALUES('1234567890' ,'1234567890');

INSERT INTO type_test_03(data1,data2)
VALUES('1234567890' , '12345678901234567890'); -- 오류

SELECT * FROM type_test_03;-- 조회