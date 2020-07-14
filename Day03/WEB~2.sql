-- 숫자 함수 문제

-- 12.523 -> 소수점이하 반올림
SELECT round(12.523,0) FROM dual;
-- -12.723 -> 소수점이하 반올림
SELECT round(-12.723,0) FROM dual;
-- 12.567 -> 소수점 3째자리에서 반올림
SELECT round(12.567,2) FROM dual;
-- 12345 -> 1의 자리에서 반올림
SELECT round(12345,-1) FROM dual;
-- 56789 -> 10의 자리에서 반올림
SELECT round(56789 ,-2) FROM dual;

-- 12.456 -> 소수점이하 버림
SELECT trunc(12.456,0) FROM dual;
-- 12.456 -> 소수점 3째자리에서 버림
SELECT  trunc(12.456,2)FROM dual;
-- 12345 -> 1의자리에서 버림
SELECT trunc(12345,-1) FROM dual;
-- 56789 -> 10의자리에서 버림
SELECT trunc(56789,-2) FROM dual;

-- 13을 8로 나눈 나머지
SELECT mod(13,8) FROM dual;

-- 12.345 올림 -> 13
SELECT ceil(12.345) FROM dual;
-- -12.567 올림 -> -12
SELECT Ceil(-12.567) FROM dual;
-- 12.567 내림 -> 12
SELECT floor(12.567) FROM dual;
-- 12.123 내림 -> 12
SELECT floor(12.123) FROM dual;
-- -12.567 내림 -> -13
SELECT floor(-12.567) FROM dual;
-- -12.123 내림 -> -13
SELECT floor(-12.123) FROM dual;

-- 3의 4제곱 -> 81
SELECT power(3,4) FROM dual;
-- 3의 -1 제곱 -> 0.33333333333
SELECT power(3,-1) FROM dual;

-- 9의 제곱근 -> 3
SELECT sqrt(9)FROM dual;
-- 11의 제곱근 -> 3.3166...
SELECT sqrt(11)FROM dual;

-- 양수면 1 ,음수면-1 , 0이면 0 반환
SELECT sign(12) FROM dual;