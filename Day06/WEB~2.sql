-- 다중 열 서브쿼리

-- 부서 별 최고 임금을 받는 사원 조회하기
SELECT deptno , max(sal) FROM emp
GROUP BY deptno;

SELECT deptno , empno , ename, sal
FROM emp
WHERE (deptno,sal) IN (
    SELECT deptno , max(sal) FROM emp
    GROUP BY deptno)
ORDER BY deptno;

-- 부서에 이름까지붙임
SELECT E.deptno ,dname, empno , ename, sal
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno
WHERE (E.deptno,sal) IN (
    SELECT  deptno , max(sal) FROM emp --서브쿼리는 deptno 누구껀지 안적어도댐
    GROUP BY deptno)
ORDER BY deptno;

--스칼라 서브쿼리로 처리
SELECT E.deptno ,
    (SELECT dname FROM dept D 
        WHERE E.deptno = D.deptno)dname,
 empno , ename, sal
FROM emp E
--INNER JOIN dept D
--    ON E.deptno = D.deptno
WHERE (deptno,sal) IN (
    SELECT  deptno , max(sal) FROM emp --서브쿼리는 deptno 누구껀지 안적어도댐
    GROUP BY deptno)
ORDER BY deptno;


ALTER TABLE cons_9
ADD CONSTRAINT cddd_pk PRIMARY KEY (data);
