-- �� , VIEW

SELECT * FROM (
    SELECT * FROM emp
    WHERE empno < 2000
);

-- scott ����� ������ �� ���� ����(CREATE VIEW)�� ���
-- ������ �� ����(insufficient privileges)

--CREATE VIEW test_view
--AS ( 
    -- ��������
--    SELECT * FROM emp
--    WHERE empno < 2000
--); --scott ������ view������ ������ �ʾҴ�.

-- scott���� �� ���� ���� �ο��ϱ� (system ���� ���)
-- WEB_ADMIN ���� �����ؼ� �����ϱ�!
GRANT CREATE VIEW
TO scott; 


-- scott ������ �̿��� �� ����( scott ����ڷ� �����ؼ� ����)
-- WEB���� �ٽ� �̵�!
CREATE VIEW test_view
AS ( 
    -- ��������
    SELECT * FROM emp
    WHERE empno < 2000
);

SELECT * FROM test_view;

-- �� �ڷ���� ��ȸ
SELECT * FROM user_views;


-- �� �������� ����
CREATE OR REPLACE VIEW test_view
AS ( 
    SELECT empno , ename FROM emp 
    WHERE empno < 2000
);

-- Ȯ��
SELECT * FROM user_views;

-- �並 �̿��� ������ ����
INSERT INTO test_view ( empno , ename)
VALUES (500, 'AAA');
-- Ȯ��
SELECT * FROM test_view;
SELECT * FROM emp;

-- �並 �̿��� ������ ����
INSERT INTO test_view
VALUES (7000,'BBB');

-- Ȯ�� ���� ( �������� �ȿ� empno < 2000 �� �� �־ �������� ����)
SELECT * FROM test_view;
-- ���� ���̺��� ����Ǿ���
SELECT * FROM emp;

-- WITH CHECK OPTION �ο��ϱ�
CREATE OR REPLACE VIEW test_view
AS (
    SELECT empno , ename  FROM emp
    WHERE empno < 2000)
WITH CHECK OPTION; 

-- �������ǿ� �����ʾƼ� ������ ���� �Ұ� ( where ���� ���� )
INSERT INTO test_view 
VALUES( 8000 ,'CCC'); 

-- �信  WITH CHECK OPTION�� �մ��ؼ� ���԰���!
INSERT INTO test_view
VALUES ( 600 , 'DDD');
-- ��ȸ
SELECT * FROM test_view;
SELECT * FROM emp;