--2020-03-31
-- DATE
CREATE TABLE type_test_05(
    data DATE
);

INSERT INTO type_test_05
VALUES (sysdate); -- 시간 포함 trunc함수 사용할지말찌 고민하기

INSERT INTO type_test_05
VALUES ('2020/11/21'); -- 자동형변환

-- 년도를 음수로 사용할 때에는 단독으로 사용불가
INSERT INTO type_test_05
VALUES ('-2020/11/21'); -- 년도를 음수로 사용할 때에는 단독으로 사용불가

-- to_date 의 서식 s 는 날짜에 포함된 부호를 인식한다.
INSERT INTO type_test_05
VALUES (to_date('-2020/11/21','syyyy/mm/dd'));--서식문자에 s 붙이기


SELECT * FROM type_test_05; --조회

-- to_char형으로 조회 
SELECT to_char(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05;


INSERT INTO type_test_05
VALUES (to_date('12/7/9','yy/mm/dd') ); -- 2012년도
INSERT INTO type_test_05
VALUES (to_date('12/7/9','rr/mm/dd') ); -- 같다!

-- 년도 2000년대인지 , 1900 년도인지 
INSERT INTO type_test_05
VALUES (to_date('94/7/9','yy/mm/dd') ); -- 2094년도
INSERT INTO type_test_05
VALUES (to_date('94/7/9','rr/mm/dd') ); -- 1994년도

INSERT INTO type_test_05
VALUES (to_date('83/2/1','rr/mm/dd') ); -- 1983년도
INSERT INTO type_test_05
VALUES (to_date('83/2/1','yy/mm/dd') ); -- 2083년도


SELECT * FROM type_test_05; --조회
SELECT to_char(data,'yyyy/mm/dd') FROM type_test_05; --조회.
