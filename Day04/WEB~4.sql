SELECT * FROM emp
WHERE empno =7369;
SELECT * FROM dept
WHERE deptno = 20;

SELECT * FROM emp;

SELECT * FROM emp ,dept
WHERE emp.deptno = dept.deptno
ORDER BY dept.deptno;

-- 두 테이블의 모든 정보 결합하기
SELECT * FROM emp,dept;

-- JOIN
--  emp 테이블 : 8cols 12rows
--  dept 테이블 : 3cols 4rows
--  emp x dept : 11cols(8+3)  48rows(12*4)

-- emp,dept 테이블 둘 모두에서 deptno 값이 같은 행만 추출
SELECT * FROM emp,dept -- 오라클 전용 문법 
WHERE emp.deptno = dept.deptno;  

SELECT empno , ename , emp.deptno , dname
FROM emp,dept
WHERE emp.deptno = dept.deptno  -- 조인 조건
    AND empno > 7800 -- 일반 조회 조건
ORDER BY empno;

-- 테이블 이름에 Alias 적용
SELECT empno , ename , E.deptno , dname
FROM emp E ,dept D
WHERE E.deptno = D.deptno  -- 조인 조건
    AND empno > 7800 ;-- 일반 조회 조건

-- INNER JOIN , 내부 조인 
SELECT empno, ename , E.deptno , dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --조인 조건
WHERE empno > 7800; --일반 조회 조건