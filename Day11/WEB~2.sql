-- ��ü ����
--(SCOTT��������)
GRANT SELECT, INSERT
ON dept
TO test, test2;

REVOKE SELECT
ON dept
FROM test,test2;

SELECT * FROM dept;
