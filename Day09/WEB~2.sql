-- ALTER TABLE 테스트용 테이블 생성
CREATE TABLE alter_test(
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT alter_test_pk PRIMARY KEY (empno)
);
--테이블 확인
DESC alter_test;
SELECT * FROM alter_test;

--emp테이블에서 데이터 가져오기
INSERT INTO alter_test
SELECT empno , ename FROM emp;

DESC emp;

--emp.sal 컬럼 추가하기
ALTER TABLE alter_test ADD( sal  NUMBER(7,2) );

-- emp.job 컬럼 추가하기
ALTER TABLE alter_test ADD ( job VARCHAR2(9));

-- sal , job 에 emp테이블의 데이터를 반영하기
-- empno가 같은 데이터를 찾아서 반영할 것!

-- 다중 행 서브쿼리
UPDATE alter_test A
    SET sal = (SELECT sal FROM emp E WHERE E.empno = A.empno),
        job = (SELECT job FROM emp E WHERE E.empno = A.empno);

-- 다중 열 서브쿼리        
UPDATE alter_test A
    SET (sal,job) = (SELECT sal,job FROM emp E WHERE E.empno = A.empno);
           
-- 확인       
SELECT * FROM alter_test;


-- 컬럼 데이터 타입 변경
-- alter_test.job : VARCHAR2(9) -> NUMBER
ALTER TABLE alter_test MODIFY(job NUMBER); -- 불가능 이미 데이터존재

-- job 컬럼의 모든 데이터를 null로 수정
UPDATE alter_test SET job = null;

-- alter_test.job : VARCHAR2(9) -> NUMBER
ALTER TABLE alter_test MODIFY(job NUMBER); -- 데이터가 없어서 ,null값으로 바꿔서 가능!

--확인
DESC alter_test;

-- NOT NULL 제약사항 부여
ALTER TABLE alter_test MODIFY(ename NOT NULL);
-- null 제약사항 풀기
ALTER TABLE alter_test MODIFY(ename NULL);

SELECT * FROM alter_test;

--컬럼 삭제
ALTER TABLE alter_test DROP COLUMN job;

--컬럼 비활성화(복구 불가능)
ALTER TABLE alter_test SET UNUSED ( sal );

-- 비활성화된 컬럼 정보 자료사전 (개수만 나온다)
SELECT * FROM user_unused_col_tabs;

ALTER TABLE cons_12 SET UNUSED (data);
ALTER TABLE cons_14 SET UNUSED (data);
ALTER TABLE cons_15 SET UNUSED (data);

-- 비활성화된 컬럼 정리하기(완전 삭제)
ALTER TABLE alter_test DROP UNUSED COLUMNS;

-- 컬럼명 이름 바꾸기
-- alter_test.empno -> alter_test.eno
ALTER TABLE alter_test RENAME COLUMN empno TO eno;

--확인
SELECT * FROM alter_test;

--테이블명 바꾸기
-- alter_test -> alter_tb
ALTER TABLE alter_test RENAME TO alter_tb;

--확인
SELECT * FROM alter_tb;
