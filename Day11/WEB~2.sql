-- 객체 권한
--(SCOTT계정으로)
GRANT SELECT, INSERT
ON dept
TO test, test2;

REVOKE SELECT
ON dept
FROM test,test2;

SELECT * FROM dept;
