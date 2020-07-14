-- to_char(datetime)
SELECT
--    sysdate
--    to_char(sysdate,'SCC'), -- 세기
--    to_char( to_date('369/1/7'),'SCC')

--    to_char( sysdate, 'YEAR'), --영문 년도
--    to_char( sysdate, 'year'),
--    to_char( sysdate, 'Year')

--    to_char( sysdate, 'YYYY'), --숫자 년도
--    to_char( sysdate, 'YY'), -- 뒤에두자리
--    to_char( sysdate, 'YYY'), -- 뒤에서부터 3자리
--    to_char( sysdate, 'Y') -- 뒤에서부터 1자리
--    to_char(sysdate,'YYYYY') -- YYYY Y 
    
--    to_char(sysdate , 'MM'),    -- 숫자 월
--    to_char(sysdate , 'MONTH'), -- 문자 월
--    to_char(sysdate , 'MON')    -- 문자 월 약어

--    to_char(sysdate , 'Q') --분기 

--    to_char(sysdate , 'DD'), --월 기준 일수
--    to_char(sysdate , 'D'),--주 기준 일수 , 요일 일요일1~토요일6
--    to_char(sysdate , 'DDD') -- 년(365)기준 일수

--    to_char(sysdate , 'DAY'), -- 요일
--    to_char(sysdate , 'DY') -- 요일약자

--    to_char(sysdate , 'HH'),-- 12시간 기준 시간
--    to_char(sysdate , 'HH12'),-- 12시간 기준 시간
--    to_char(sysdate , 'HH24')-- 24시간 기준 시간

--    to_char(sysdate ,'MI') -- 분    

--    to_char(sysdate,'SS')--초

--    to_char(sysdate,'AM'), -- 오전/오후
--    to_char(sysdate,'PM'),
--    to_char(sysdate,'A.M.'),
--    to_char(sysdate,'P.M.')

    to_char(sysdate,'FF') -- 밀리초 sysdate 타입은 안됀다!!

FROM dual;


-- 2분기에 입사한 사람들
SELECT * FROM emp
WHERE to_char(hiredate , 'Q')=2;
--WHERE hiredate >= '81/07/01' AND hiredate < '81/10/01';

SELECT systimestamp ,sysdate FROM dual;

SELECT 
    to_char(systimestamp,'FF'),
    to_char(systimestamp,'FF1'), --10분의 1초
    to_char(systimestamp,'FF2'),  --100분의 1초 (자릿수)
    to_char(systimestamp,'FF3')--1000분의 1초
FROM dual;

SELECT
    to_char(sysdate, 'YYYY/MM/DD DAY HH24:MI:SS')
FROM dual;
