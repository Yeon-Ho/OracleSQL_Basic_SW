-- 주석 ,COMMENT
SELECT * FROM emp;

-- 테이블 주석 자료사전
SELECT * FROM user_tab_comments;
--컬럼주석 자료사전
SELECT * FROM user_col_comments;

--주석 생성(테이블)
COMMENT ON TABLE emp IS '사원정보';

--주석 생성(컬럼)
COMMENT ON COLUMN emp.empno IS '사원번호';
COMMENT ON COLUMN emp.ename IS '사원이름';
COMMENT ON COLUMN emp.job IS '사원직무';
COMMENT ON COLUMN emp.mgr IS '담당자';
COMMENT ON COLUMN emp.hiredate IS '입사일자';
COMMENT ON COLUMN emp.sal IS '급여';
COMMENT ON COLUMN emp.comm IS '상여금';
COMMENT ON COLUMN emp.deptno IS '부서번호';

-- 테이블 주석 자료사전
SELECT * FROM user_tab_comments
WHERE TABLE_NAME = upper('emp');
--컬럼주석 자료사전
SELECT * FROM user_col_comments
WHERE TABLE_NAME = upper('emp');

----------------------------------------------------------
-- 권한
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = upper('scott');

SELECT * FROM USER_SYS_PRIVS;


-- ROLE 조회
SELECT * FROM dba_role_privs
WHERE GRANTEE = upper('scott');

-- ROLE에 부여된 시스템 권한
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN(upper('resource'),upper('connect'))
ORDER BY grantee , privilege;

-- ROLE을 포함한 시스템 권한 조회하기
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN(
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE grantee= upper('scott') )
UNION
SELECT * FROM DBA_SYS_PRIVS 
WHERE grantee = upper('scott');


-- 사용자 계정 생성
CREATE USER test IDENTIFIED BY 1234;

-- test에게 DB접속 권한 부여하기
GRANT CREATE SESSION
TO test;
-- test에게 DB접속 권한 회수하기
REVOKE CREATE SESSION
FROM test;

-- 롤을 이용한 권한 부여 (한번에)
-- RESOURCE : 기본 객체 생성 권한
-- CONNECT : DB로그온 권한
GRANT RESOURCE , CONNECT
TO TEST;

-- (SYSTEM계정 이용)
GRANT CREATE ROLE
to scott;

-- ( SCOTT 이용)
CREATE ROLE role1;

SELECT * FROM all_users;

GRANT role1
TO test;

GRANT CREATE ROLE
TO test;-- 사용자급 권한때문에 줄수없다(SCOTT->TEST)

--( SYSTEM계정 이용)
GRANT CREATE ROLE
TO scott
WITH ADMIN OPTION; -- 관리자급 권한부여

-- ( SCOTT 이용)
GRANT CREATE ROLE
TO test;

