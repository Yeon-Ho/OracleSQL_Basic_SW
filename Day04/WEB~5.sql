-- NON-EQUI JOIN , 비등가 조인
SELECT * FROM emp; -- 사원 정보 테이블
SELECT * FROM salgrade; -- 급여등급 정보 테이블

SELECT ename ,sal , grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal -- 조인 조건
ORDER BY grade , sal,ename;

-- ANSI표준 NON-EQUI
SELECT ename ,sal , grade
FROM emp
INNER JOIN salgrade
    ON sal BETWEEN losal AND hisal -- 조인 조건
-- WHERE grade = 3  추가가능    
ORDER BY grade , sal,ename;


-- SELF JOIN
SELECT * FROM emp EMPLOYEE;
SELECT * FROM emp MANAGER;

SELECT empno , ename, mgr FROM emp EMPLOYEE;
SELECT distinct(mgr) FROM emp MANAGER;

SELECT 
    E.empno , E.ename, E.mgr,M.empno , M.ename
FROM emp E , emp M
WHERE E.mgr = M.empno; -- 조인 조건

-- ANSI문법 SELF JOIN
SELECT 
    E.empno , E.ename, E.mgr, M.ename
FROM emp E 
INNER JOIN emp M
    ON E.mgr = M.empno; -- 조인 조건