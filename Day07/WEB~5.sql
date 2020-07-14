-- CHAR(n) : 고정 길이 문자
CREATE TABLE type_test_04(
    data1 CHAR,
    data2 CHAR(20),
    data3 CHAR(30 CHAR) );

DESC type_test_04;

INSERT INTO type_test_04
VALUES('Y','1234567890','일이삼사오육칠팔구십');

SELECT * FROM type_test_04;-- 조회 