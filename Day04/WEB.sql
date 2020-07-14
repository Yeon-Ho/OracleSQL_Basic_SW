-- to_number
SELECT
    '123.67' "1",
    to_number('123.67')"2",
    to_number('123.67','99999.99')"3",
--    to_number('123.67','99999.9')"4",입력한데이터보다 공간이작으면 처리오류
    to_number('123.67','99999.999')"5"   
FROM dual;

SELECT
    67890 + 11111 "1",
    '67890' + 11111 "2", --숫자와 문자는 자동형변환이 이뤄진다
    to_number('67890') + 11111 "3",
--    '67,890'+11111"4",  ,가 껴있으면 숫자인지 모른다 이럴때 to_number
    to_number('67,890')+11111 "5", --서식문자로 변환가능하다는걸 알려줘야 변환 시켜준다
    to_number('67,890','99,999') + 11111 "6"
FROM dual;

SELECT
--    '$78,789' + 10000 "1",
    to_number('$78,789','$999,999,999') + 10000 "2"
FROM dual;

-- to_date
SELECT
--    '19/10/7'+5 "1"-- 날짜에 덧셈하면 일수가 늘어난다
    to_date('19/10/7')+30 "2"
FROM dual;

SELECT
    '12 1 11' "1",
    to_date('12 1 11') "2",
    to_date('12 1 11','YY MM DD') "3", --년/월/일
    to_date('12 1 11','MM DD YY')"3" --월/일/년
FROM dual;


-- NVL
SELECT * FROM emp;

SELECT empno,ename , NVL(comm,0) COMM
FROM emp
ORDER BY comm DESC , ename;

--NVL2
-- comm이 NULL이면 sal치환
-- comm이 NULL이 아니면 sal+comm로 치환

--NULL 데이터는 존재하지 않는 데이터로 생각해서
--연산 ,함수의 데이터 등으로 사용하면 아무것도 수행하지 않는다.
SELECT ename, sal , comm, sal+comm FROM emp;  --NULL이있을때 수행안해버림

SELECT 
    ename,sal, comm, NVL2(comm, sal+comm , sal) pay
FROM emp;


--NULLIF
SELECT
    NULLIF(10,20)"1",
    NULLIF(20,10)"2",
    NULLIF(10,10)"3"
FROM dual;

-- job컬럼에서 'SALSEMAN'을 찾는다 -> NULL변환
-- NULL값을 NVL을 이용해 '영업' 변환
SELECT empno,ename, job
FROM emp;

SELECT empno,ename, job,
    NULLIF(job,'SALESMAN') N_IF,
    NVL( NULLIF(job,'SALESMAN'),'영업')job_kor
FROM emp;


--DECODE
SELECT * FROM dept;

SELECT empno, ename , deptno,
    DECODE( deptno,
        10, '회계팀',
        20, '연구팀',
        30, '영업팀',
        40, '운영팀',
        '부서없음') dname    -- default값 : 부서없음
FROM emp;

-- CASE 구문
SELECT empno, ename , deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;

--직접 조건주기
SELECT empno, ename , deptno,
    CASE 
        WHEN job=upper('president') THEN '사장'  --위에서부터 읽어서 사장으로 바뀌고 밑으로내려간다.
        WHEN deptno=10 THEN '회계팀'  -- 
        WHEN deptno=20 THEN '연구팀'
        WHEN deptno=30 THEN '영업팀'
        WHEN deptno=40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;

    