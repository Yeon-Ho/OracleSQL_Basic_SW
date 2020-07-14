-- 2020-03-27
-- 복수 행 서브쿼리

-- IN 연산자
--      SALESMAN들이 받는 급여 형태
SELECT DISTINCT sal
FROM emp
WHERE job = upper('salesman')
ORDER BY sal;

SELECT * FROM emp
WHERE sal IN( 1250 , 1500 , 1600);

SELECT * FROM emp
WHERE sal IN(
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') );
    
-- 사장이 속한 부서번호 확인
SELECT deptno FROM emp
WHERE job = upper('president');

SELECT * FROM emp
--WHERE deptno = 10;
WHERE deptno = (SELECT deptno FROM emp
WHERE job = upper('president')); --서브쿼리 결과가 하나임 그래서 = 가능
-- 단일행 이든 다중행 이든 IN은 사용가능


-- ANY 연산자
SELECT * FROM emp
WHERE sal = ANY ( -- IN 연산자와 같음
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ANY ( -- 최대(최고) 값보다 작은 데이터가 조회됨
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


SELECT * FROM emp
WHERE sal > ANY ( -- 최소(최저) 값보다 큰 데이터가 조회됨
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


-- ALL 연산자
SELECT * FROM emp
WHERE sal  = ALL ( -- 결과 모두와 같은 때 조회됨 , 쓸모없음.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal  < ALL ( -- 최소(최저)값보다 작은 데이터 조회된다.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ALL (  -- 최대(최고)값보다 큰 값이 조회된다
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

-- EXISTS

-- 매니저들 사원번호
SELECT DISTINCT mgr FROM emp ORDER BY mgr;

--매니저 역할을 수행하고 있는 사원들의 정보
SELECT * FROM emp E
WHERE empno IN (   -- IN버전
    SELECT DISTINCT mgr 
    FROM emp
)
ORDER BY empno;  

SELECT * FROM emp E
WHERE EXISTS ( 
    SELECT DISTINCT mgr 
    FROM emp M
    WHERE E.empno = M.mgr
) ORDER BY empno;

-- 소속인원이 존재하는 부서들의 정보
SELECT * FROM dept D
WHERE EXISTS ( SELECT * FROM emp E WHERE D.deptno = E.deptno)
ORDER BY deptno;

SELECT * FROM dept D
WHERE deptno IN ( SELECT deptno FROM emp E )
ORDER BY deptno;
