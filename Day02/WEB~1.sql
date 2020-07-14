-- SELECT empno, ename, deptno FROM emp
-- WHERE	 구조를 이용하여 해결할 것

SELECT * FROM emp;

 -- 부서번호가 30이고 직무가 영업인 사원 조회
-- ALLEN, WARD, MARTIN, TURNER
SELECT empno , ename , deptno FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

 -- 부서번호가 30이고 직무가 영업이 아닌 사원 조회
-- BLAKE, JAMES
SELECT empno , ename , deptno FROM emp
WHERE deptno = 30 AND NOT job ='SALESMAN';

 -- 부서번호가 30이 아니고 직무가 영업이 아닌 사원 조회
-- SMITH, JONES, CLARK, KING, FORD, MILLER
SELECT empno , ename , deptno FROM emp
--WHERE NOT (deptno = 30 OR job = 'SALESMAN');
WHERE deptno <> 30 AND job <> 'SALESMAN';

 -- 사원번호가 7782에서 7900 사이인 사원 조회
-- CLARK, KING, TURNER, JAMES
 SELECT empno , ename , deptno FROM emp
 WHERE empno BETWEEN 7782 AND 7900;
 
  -- 사원명이 'A'부터 'C'로 시작하는 사원 조회
-- ALLEN, BLAKE, CLARK  
SELECT empno , ename , deptno FROM emp
WHERE ename >= 'A' AND ename <'D';
--WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%';

  
  -- 부서번호가 10 또는 30인 사원 조회 (IN 사용)
-- ALLEN, WARD, MARTIN, BLAKE, CLARK, KING, TURNER, JAMES, MILLER  
SELECT empno , ename , deptno FROM emp
WHERE deptno IN (10,30);



