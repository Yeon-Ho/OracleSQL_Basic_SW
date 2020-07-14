-- ORDER BY 절
SELECT * FROM emp
--ORDER BY empno; 
--ORDER BY ename;
ORDER BY ename DESC;

-- 부서번호 오름차순, 부서 내 이름 내림차순 , 동명이인 사번 오름차순
SELECT * FROM emp
ORDER BY deptno ASC , ename DESC , empno;

-- 내림차순할껀데 null들의 값은 뒤로 빼라 (주로 이거씀)
SELECT empno , ename , comm FROM emp
ORDER BY comm DESC NULLS LAST;

-- 오름차순할껀데 null들의 값을 앞으로 빼라
SELECT empno , ename , comm FROM emp
ORDER BY comm ASC NULLS FIRST;

-- 애초에 null값을 없애버리기
SELECT empno , ename , comm FROM emp
WHERE comm IS NOT NULL
ORDER BY comm DESC;

SELECT empno , ename , comm  FROM emp
--WHERE comm IS NOT NULL
ORDER BY comm DESC NULLS LAST , ename , empno;

-- 조회되지 않는 컬럼을 이용해서도 정렬기준으로 삼을 수 있다.
SELECT empno , ename , comm FROM emp
ORDER BY sal DESC, comm DESC;

-- DISTINCT 키워드
SELECT DISTINCT 
    deptno 
FROM emp
ORDER BY deptno;

SELECT empno , ename FROM emp;

SELECT DISTINCT empno , ename FROM emp; 

SELECT DISTINCT deptno , ename FROM emp
ORDER BY deptno,ename; -- 한 행 전체가 같을때 지우기 때문에

-- 직무 종류 확인하기
SELECT DISTINCT 
    job
FROM emp
ORDER BY job;

--부서별로 부족한 직무가 있나 본다.
SELECT DISTINCT
    deptno,job
FROM emp
ORDER BY deptno , job;