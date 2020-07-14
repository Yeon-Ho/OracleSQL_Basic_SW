-- 뷰 , VIEW

SELECT * FROM (
    SELECT * FROM emp
    WHERE empno < 2000
);

-- scott 사용자 계정에 뷰 생성 권한(CREATE VIEW)이 없어서
-- 수행할 수 없음(insufficient privileges)

--CREATE VIEW test_view
--AS ( 
    -- 서브쿼리
--    SELECT * FROM emp
--    WHERE empno < 2000
--); --scott 계정은 view권한을 가지지 않았다.

-- scott에게 뷰 생성 권한 부여하기 (system 계정 사용)
-- WEB_ADMIN 으로 접속해서 실행하기!
GRANT CREATE VIEW
TO scott; 


-- scott 계정을 이용한 뷰 생성( scott 사용자로 접속해서 실행)
-- WEB으로 다시 이동!
CREATE VIEW test_view
AS ( 
    -- 서브쿼리
    SELECT * FROM emp
    WHERE empno < 2000
);

SELECT * FROM test_view;

-- 뷰 자료사전 조회
SELECT * FROM user_views;


-- 뷰 서브쿼리 수정
CREATE OR REPLACE VIEW test_view
AS ( 
    SELECT empno , ename FROM emp 
    WHERE empno < 2000
);

-- 확인
SELECT * FROM user_views;

-- 뷰를 이용한 데이터 삽입
INSERT INTO test_view ( empno , ename)
VALUES (500, 'AAA');
-- 확인
SELECT * FROM test_view;
SELECT * FROM emp;

-- 뷰를 이용한 데이터 삽입
INSERT INTO test_view
VALUES (7000,'BBB');

-- 확인 구문 ( 서브쿼리 안에 empno < 2000 이 들어가 있어서 보이지는 않음)
SELECT * FROM test_view;
-- 원본 테이블에는 저장되었다
SELECT * FROM emp;

-- WITH CHECK OPTION 부여하기
CREATE OR REPLACE VIEW test_view
AS (
    SELECT empno , ename  FROM emp
    WHERE empno < 2000)
WITH CHECK OPTION; 

-- 제약조건에 맞지않아서 데이터 삽입 불가 ( where 구문 기준 )
INSERT INTO test_view 
VALUES( 8000 ,'CCC'); 

-- 뷰에  WITH CHECK OPTION에 합당해서 삽입가능!
INSERT INTO test_view
VALUES ( 600 , 'DDD');
-- 조회
SELECT * FROM test_view;
SELECT * FROM emp;