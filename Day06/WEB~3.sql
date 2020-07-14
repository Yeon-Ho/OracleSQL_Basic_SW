-- 집합 연산자

-- UNION : 합집합 
SELECT empno , ename , job, 0 AS "DEPTNO" FROM emp
WHERE job = 'SALESMAN'
UNION
SELECT empno , ename , job, deptno FROM emp
WHERE job = 'MANAGER'
ORDER BY ename;

--SELECT empno , ename , job, deptno FROM emp
--WHERE job IN ('MANAGER','SALESMAN')
--ORDER BY ename;

-- UNION ALL : 합집합 ,중복허용 (중복값이 추가되서 보인다)
SELECT empno , ename , sal FROM emp
WHERE sal<2000
UNION ALL
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;

-- INTERSECT : 교집합
SELECT empno , ename , sal FROM emp
WHERE sal<2000
INTERSECT
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;

--MINUS : 차집합 (중복된 데이터를 제거)
SELECT empno , ename , sal FROM emp
WHERE sal<2000
MINUS
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;
