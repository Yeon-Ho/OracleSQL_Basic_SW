--2020-03-26
SELECT * FROM emp;
SELECT * FROM dept;

-- 카테시안 곱 , CROSS JOIN
SELECT * FROM emp,dept; --카테시안 곱
--CROSS JOIN
SELECT * FROM emp
CROSS JOIN dept;--카테시안 곱

-- NATURAL JOIN
SELECT * FROM emp
NATURAL JOIN dept
ORDER BY deptno,empno;

------------------------OUTER JOIN------------------------------------------

-- OUTER JOIN(오라클 전용구문)
SELECT empno , ename , D.deptno,dname
FROM emp E , dept D
WHERE E.deptno (+) = D.deptno --(+): 아우터 조인 연산자(데이터의 숫자가 부족한 쪽에 추가한다)
ORDER BY deptno , empno;

-- ANSI 표준구문,OUTER JOIN , ANSI는 FROM절에 테이블 하나만와야됨
SELECT empno , ename , D.deptno,dname
FROM emp E 
RIGHT OUTER JOIN dept D  -- 부족한 테이블 반대방향 쓴다
    ON E.deptno = D.deptno -- 조인 조건 
ORDER BY deptno , empno;



-- OUTER JOIN(오라클 전용구문)
SELECT empno , ename , D.deptno,dname
FROM  dept D , emp E 
WHERE D.deptno =  E.deptno (+) --(+): 아우터 조인 연산자(데이터의 숫자가 부족한 쪽에 추가한다)
 ORDER BY deptno , empno;

-- ANSI 표준구문,OUTER JOIN 
SELECT empno , ename , D.deptno,dname
FROM  dept D 
LEFT OUTER JOIN emp E  -- ANSI로 아우터조인 하려면 ON 쪽에서 '='을 봐서 부족한테이블 반대방향 LEFT/RIGHT 쓴다.
ON D.deptno =  E.deptno
ORDER BY deptno , empno;


-- SELF JOIN 에서 OUTER JOIN (오라클전용)
SELECT
    E.empno, E.ename , E.mgr , M.ename 매니저이름
FROM emp E , emp M
WHERE E.mgr = M.empno(+); --KING의 매니저가 없으니까 매니저컬럼이 M이니까

-- SELF JOIN 에서 OUTER JOIN (ANSI)
SELECT
    E.empno, E.ename , E.mgr , M.ename MGR_NAME
FROM emp E 
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno;
    
-- FULL OUTER JOIN(실험해보려고 밑에)
CREATE TABLE test1 ( no NUMBER ); --테이블 생성
CREATE TABLE test2 ( no NUMBER ); --테이블 생성    

DELETE test1; -- 테이블 데이터 전체삭제

INSERT INTO test1 VALUES ( 10 ); --데이터 삽입
INSERT INTO test1 VALUES ( 20 );
INSERT INTO test1 VALUES ( 30 );
SELECT * FROM test1;

DELETE test2; -- 테이블 데이터 전체삭제

INSERT INTO test2 VALUES ( 10 ); --데이터 삽입
INSERT INTO test2 VALUES ( 20 );
INSERT INTO test2 VALUES ( 40 );
SELECT * FROM test2;


SELECT * FROM test1,test2
--WHERE test1.no = test2.no;-- INNER JOIN , EQUI JOIN , 내부조인
--WHERE test1.no(+) = test2.no; -- RIGHT OUTER JOIN
WHERE test1.no = test2.no(+); -- LEFT OUTER JOIN
--WHERE test1.no(+) = test2.no(+); -- 수행되지 않는다.


SELECT * FROM test1
FULL OUTER JOIN test2 -- FULL OUTER JOIN
    ON test1.no = test2.no 
ORDER BY test1.no;
