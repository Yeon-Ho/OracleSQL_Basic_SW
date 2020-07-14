-- �ּ� ,COMMENT
SELECT * FROM emp;

-- ���̺� �ּ� �ڷ����
SELECT * FROM user_tab_comments;
--�÷��ּ� �ڷ����
SELECT * FROM user_col_comments;

--�ּ� ����(���̺�)
COMMENT ON TABLE emp IS '�������';

--�ּ� ����(�÷�)
COMMENT ON COLUMN emp.empno IS '�����ȣ';
COMMENT ON COLUMN emp.ename IS '����̸�';
COMMENT ON COLUMN emp.job IS '�������';
COMMENT ON COLUMN emp.mgr IS '�����';
COMMENT ON COLUMN emp.hiredate IS '�Ի�����';
COMMENT ON COLUMN emp.sal IS '�޿�';
COMMENT ON COLUMN emp.comm IS '�󿩱�';
COMMENT ON COLUMN emp.deptno IS '�μ���ȣ';

-- ���̺� �ּ� �ڷ����
SELECT * FROM user_tab_comments
WHERE TABLE_NAME = upper('emp');
--�÷��ּ� �ڷ����
SELECT * FROM user_col_comments
WHERE TABLE_NAME = upper('emp');

----------------------------------------------------------
-- ����
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = upper('scott');

SELECT * FROM USER_SYS_PRIVS;


-- ROLE ��ȸ
SELECT * FROM dba_role_privs
WHERE GRANTEE = upper('scott');

-- ROLE�� �ο��� �ý��� ����
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN(upper('resource'),upper('connect'))
ORDER BY grantee , privilege;

-- ROLE�� ������ �ý��� ���� ��ȸ�ϱ�
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN(
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE grantee= upper('scott') )
UNION
SELECT * FROM DBA_SYS_PRIVS 
WHERE grantee = upper('scott');


-- ����� ���� ����
CREATE USER test IDENTIFIED BY 1234;

-- test���� DB���� ���� �ο��ϱ�
GRANT CREATE SESSION
TO test;
-- test���� DB���� ���� ȸ���ϱ�
REVOKE CREATE SESSION
FROM test;

-- ���� �̿��� ���� �ο� (�ѹ���)
-- RESOURCE : �⺻ ��ü ���� ����
-- CONNECT : DB�α׿� ����
GRANT RESOURCE , CONNECT
TO TEST;

-- (SYSTEM���� �̿�)
GRANT CREATE ROLE
to scott;

-- ( SCOTT �̿�)
CREATE ROLE role1;

SELECT * FROM all_users;

GRANT role1
TO test;

GRANT CREATE ROLE
TO test;-- ����ڱ� ���Ѷ����� �ټ�����(SCOTT->TEST)

--( SYSTEM���� �̿�)
GRANT CREATE ROLE
TO scott
WITH ADMIN OPTION; -- �����ڱ� ���Ѻο�

-- ( SCOTT �̿�)
GRANT CREATE ROLE
TO test;

