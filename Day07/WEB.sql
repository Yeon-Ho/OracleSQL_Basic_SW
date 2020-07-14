-- 2020-03-30
SELECT * FROM emp;

DESC emp;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
FROM emp;

-- INSERT (1)
INSERT INTO emp ( empno,ename,job,mgr,hiredate,sal,comm,deptno )
VALUES ( 1001, 'ALICE','CLERK',1003,'16/4/9',800,null,30);

-- INSERT (2)COULUMN_ID
INSERT INTO emp
VALUES(1002,'MORRIS','CLERK' ,1003,'16/9/2',800,null,30);

SELECT * FROM emp WHERE empno<2000 ;--(확인)


SELECT 1,2,'a','b' FROM dual;

SELECT 1003,'MATHEW','SALESMAN',null,sysdate,1500,100,30
FROM dual;

--  INSERT INTO(3)VALUES대신 SELECT구문 사용   서브쿼리로 삽입
INSERT INTO emp
SELECT 1003,'MATHEW','SALESMAN',null,sysdate,1500,100,30
FROM dual;

SELECT * FROM emp WHERE empno<2000;--(확인)


-- 다음 두 사원의 정보를 삽입하세요

-- 사번 1011, 이름 EDWARD , 직무 MANAGER
--   empno ,   ename    ,  job
INSERT INTO emp(empno , ename , job)
VALUES (1011,'EDWARD','MANAGER');

-- 사번 1014 , 이름Richard , 급여 2000
--   empno ,   ename       , sal
INSERT INTO emp(empno , ename , sal)
VALUES (1015,'Richard',2000);

SELECT * FROM emp WHERE empno<2000;--(확인)

-- commit; -- 커밋, 데이터 변경사항을 영구적으로 적용
 commit;

SELECT * FROM emp;
-- DELETE emp; -- 테이블 전체 삭제
-- rollback; -- 롤백 , 데이터 변경사항을 되돌리기


-- 테이블 생성 ( SELECT 구문의 결과를 사본테이블로 생성한다.) 복사본
CREATE TABLE emp_research
AS 
SELECT * FROM emp;

-- 테이블 확인
SELECT * FROM emp_research;

-- 테이블 삭제
DROP TABLE emp_research;

-- 빈 테이블 복사
SELECT * FROM emp WHERE 1=0; -- 1=0(false)

CREATE TABLE emp_research AS SELECT * FROM emp WHERE 1=0;
-- 테이블 확인
SELECT * FROM emp_research;

-- 20번 부서의 모든 데이터를 INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno = 20;
SELECT * FROM emp_research;--확인

-- 30번 부서의 모든데이터를 empno,ename 만 INSERT
INSERT INTO emp_research(empno,ename)
SELECT empno , ename FROM emp WHERE deptno = 30;
SELECT * FROM emp_research;--확인

-- 모든 데이터 삭제
DELETE emp_research;

-- INSERT ALL
INSERT ALL 
WHEN deptno = 20
    THEN INTO emp_research --전체 데이터 넣기
WHEN deptno = 30
    THEN INTO emp_research(empno , ename)
    VALUES(empno , ename) --원하는 컬럼만 값 넣기
SELECT * FROM emp;

SELECT * FROM emp_research;-- 확인

--INSERT ALL QUIZ

-- emp를 이용해 데이터없이 emp_hire 테이블 생성
--  empno , ename , hiredate
CREATE TABLE emp_hire
AS
SELECT empno,ename,hiredate FROM emp WHERE 1=0;--빈테이블생성

SELECT * FROM emp_hire;--확인 구문

-- emp를 이용해 데이터없이 emp_sal 테이블 생성
--  empno , ename , sal
CREATE TABLE emp_sal
AS
SELECT empno,ename,sal FROM emp WHERE 1=0;--빈테이블생성

SELECT * FROM emp_sal;-- 확인 구문

-- INSERT ALL 사용해서 해결하기
-- emp_hire 테이블 , '1981/06/01' 이전 사원
-- emp_sal 테이블 , 2000보다 많은 사원
INSERT ALL
WHEN hiredate < '1981/06/01'
    THEN INTO emp_hire
    VALUES ( empno , ename , hiredate )
WHEN sal>2000
    THEN INTO emp_sal
    VALUES (empno,ename , sal)
SELECT * FROM emp;

SELECT * FROM emp_hire;
SELECT * FROM emp_sal;--확인구문
-- commit;
-- rollback;
--삭제 코드 (전체테이블 데이터 삭제)
--DELETE emp_hire; -- 프라이머리 키가없어서 여러번 들어가서 삭제코드 
--DELETE emp_sal; 

SELECT * FROM emp_sal
-- DELETE emp_sal   -- 이런식으로 조심해서 사용하자.
WHERE empno = 7839;

SELECT * FROM emp
-- DELETE emp
WHERE empno = 7369;

rollback;