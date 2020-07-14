-- ALTER TABLE �׽�Ʈ�� ���̺� ����
CREATE TABLE alter_test(
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT alter_test_pk PRIMARY KEY (empno)
);
--���̺� Ȯ��
DESC alter_test;
SELECT * FROM alter_test;

--emp���̺��� ������ ��������
INSERT INTO alter_test
SELECT empno , ename FROM emp;

DESC emp;

--emp.sal �÷� �߰��ϱ�
ALTER TABLE alter_test ADD( sal  NUMBER(7,2) );

-- emp.job �÷� �߰��ϱ�
ALTER TABLE alter_test ADD ( job VARCHAR2(9));

-- sal , job �� emp���̺��� �����͸� �ݿ��ϱ�
-- empno�� ���� �����͸� ã�Ƽ� �ݿ��� ��!

-- ���� �� ��������
UPDATE alter_test A
    SET sal = (SELECT sal FROM emp E WHERE E.empno = A.empno),
        job = (SELECT job FROM emp E WHERE E.empno = A.empno);

-- ���� �� ��������        
UPDATE alter_test A
    SET (sal,job) = (SELECT sal,job FROM emp E WHERE E.empno = A.empno);
           
-- Ȯ��       
SELECT * FROM alter_test;


-- �÷� ������ Ÿ�� ����
-- alter_test.job : VARCHAR2(9) -> NUMBER
ALTER TABLE alter_test MODIFY(job NUMBER); -- �Ұ��� �̹� ����������

-- job �÷��� ��� �����͸� null�� ����
UPDATE alter_test SET job = null;

-- alter_test.job : VARCHAR2(9) -> NUMBER
ALTER TABLE alter_test MODIFY(job NUMBER); -- �����Ͱ� ��� ,null������ �ٲ㼭 ����!

--Ȯ��
DESC alter_test;

-- NOT NULL ������� �ο�
ALTER TABLE alter_test MODIFY(ename NOT NULL);
-- null ������� Ǯ��
ALTER TABLE alter_test MODIFY(ename NULL);

SELECT * FROM alter_test;

--�÷� ����
ALTER TABLE alter_test DROP COLUMN job;

--�÷� ��Ȱ��ȭ(���� �Ұ���)
ALTER TABLE alter_test SET UNUSED ( sal );

-- ��Ȱ��ȭ�� �÷� ���� �ڷ���� (������ ���´�)
SELECT * FROM user_unused_col_tabs;

ALTER TABLE cons_12 SET UNUSED (data);
ALTER TABLE cons_14 SET UNUSED (data);
ALTER TABLE cons_15 SET UNUSED (data);

-- ��Ȱ��ȭ�� �÷� �����ϱ�(���� ����)
ALTER TABLE alter_test DROP UNUSED COLUMNS;

-- �÷��� �̸� �ٲٱ�
-- alter_test.empno -> alter_test.eno
ALTER TABLE alter_test RENAME COLUMN empno TO eno;

--Ȯ��
SELECT * FROM alter_test;

--���̺�� �ٲٱ�
-- alter_test -> alter_tb
ALTER TABLE alter_test RENAME TO alter_tb;

--Ȯ��
SELECT * FROM alter_tb;
