-- 패딩 , Padding

-- 문자를 표현하기 위해서 공간을 확보하고 ,
-- 그 공간에 문자를 채워넣고 빈 공간이 남으면 설정한 문자로 채운다.

-- LEFT PADDING : lpad()
SELECT lpad('SQL',10) FROM dual;
SELECT lpad(ename, 10) FROM emp;

SELECT lpad('SQL',10,'*') FROM dual;
SELECT lpad(ename, 10,'*') FROM emp;
SELECT lpad(ename, 10,'*-') FROM emp;

SELECT lpad('ABCDEFGH', 5) FROM dual; --공간을 5개줬는데 그이상 넣으려면 짤린다.

-- RIGHT PADDING : rpad()
SELECT rpad('SQL',10) FROM dual;
SELECT rpad('SQL',10,'*') FROM dual;
SELECT rpad('SQL',10,'*-') FROM dual;


-- TRIM (깍아낸다)
--  데이터의 양 끝단에 있는 ' '(띄어쓰기 ,공백)을 제거하는 함수

SELECT '   SQL   ',
    ltrim('   SQL   '),
    rtrim('   SQL   '),
    trim('   SQL   ') --양측 다 공백짜르기
FROM dual;


-- 날짜 함수, DATETIME
SELECT sysdate FROM dual; -- sysdate 는 컴퓨터가 가지고있는 현재 날짜
 
-- 날짜시간 타입을 -> 문자타입(서식 지정)
SELECT 
    to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') now
FROM dual;

-- MONTHS_BETWEEN : 개월 수 차이
SELECT
    months_between('20-01-01','20-02-01') "A",
   round( months_between('20/02/15','20/02/01'),2) "B",
    round( months_between(sysdate,'20/02/01'),2) "C"
FROM dual;

-- next_day : 지정된 요일이 다가오는 날짜 구하기
SELECT
    next_day(sysdate ,'금'),
    next_day(sysdate,'금요일')
FROM dual;

-- trunc(datetime) 함수 , 시간을 자정(00시00분00초)로 맞춘다
SELECT
    sysdate ,
    to_char(sysdate,'YYYY/MM/DD HH24:MI:SS ') now,
    to_char( trunc(sysdate),'YYYY/MM/DD HH24:MI:SS'),
    to_char( trunc(sysdate),'yy/mm/DD HH24:MI:SS;')
FROM dual;

-- 아래 문장이 보이는 결과는 같지만
-- 시간이 포함되어있어서 서로 다른 값을 가진다.
SELECT
    sysdate,
    trunc(sysdate)
FROM dual;



-- to_char(number)
-- to_char(number,fmt) : 서식문자를 이용한 변환

SELECT
    12345 "0",
    to_char(12345) "1",-- '12345'
    length( to_char(12345))"3",
    length(12345)"4", -- 자동형변환 주로 문자와숫자 사이에 일어난다.
    to_char(12345,'99') "5",
    to_char(12345,'9999999999') "6",
    to_char(12345,'0000000000') "7",--0으로나머지를 채움 한칸비워져있는곳은 +나-같은거
    to_char(12345,'9990000000') "8"
FROM dual;

SELECT
    to_char(12345.6789)"1",
    to_char(12345.6789,'99999.9')"2", -- 소숫점은 반올림 해버린다.
    to_char(12345.6789,'9999999.99')"3", --실수든 정수든 남는곳은 빈칸으로
    to_char(12345.6789,'9,999,999.99')"4",
    to_char(12345.6,'9,999,999.999')"5" --소숫점에 공간이 남으면 0으로 채운다.
FROM dual;

SELECT
    to_char(12345)"1",
    to_char(12345,'$99,999,999')"2",
    to_char(12345,'$999')"3",
    trim(to_char(12345,'L99,999,999'))"4" -- LOCALE
FROM dual;
