-- 데이터 연결 연산자 ||
SELECT
    ename || ' is ' || job AS EMPLOYEE
FROM emp;

-- ' ' 로 표현된 문자 안에서 '를 사용하고 싶으면 ''를 사용한다.
SELECT -- SMITH's job is CLERK
    ename || '''s job is ' || job AS EMPLOYEE
FROM emp;

-- SQL Functions

-- 단일 행 함수
SELECT
    ename , length(ename) LEN -- Single Row
FROM emp;

-- 그룹 함수
-- 조회되는 결과의 행 수를 나타낸다.
SELECT count(*) FROM emp; -- Group


-- DUAL 테이블
SELECT 1 FROM emp; 
SELECT 1+2 FROM emp; 

SELECT 1 FROM dual;
SELECT 1+2 FROM dual; --테스트용으로 해야되는데 테이블이 없을 때

--여러개의 컬럼이 한개의 행으로 나온다.
SELECT 1+2 더하기, 6*5 곱하기,5-7 빼기 FROM dual; 

-- 숫자함수
--  abs()
SELECT abs(-44) FROM dual;
SELECT abs(-5786.457) FROM dual;
SELECT abs(10-15) "절대값 10-15 " FROM dual;
SELECT abs(sal) FROM emp;


