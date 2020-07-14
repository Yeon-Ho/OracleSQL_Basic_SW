-- �ε��� , INDEX

-- �ε��� �ڷ����
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

-- �ε��� �÷� �ڷ����
SELECT * FROM user_ind_columns
WHERE TABLE_NAME = upper('emp');

-- �ε��� ��ȸ , salgrade���̺�
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade'); --��ȸ����
--���α��� Ȯ��
SELECT * FROM salgrade;

--�ε��� ���� , NONUNIQUE(�ߺ������)
CREATE INDEX idx_salgrade
ON salgrade( grade );-- NONUNIQUE(�ߺ������)

-- �ٽ� �ε��� ��ȸ
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade'); 

-- �ε����� �ߺ��Ǵ� ������ ������ ����
INSERT INTO salgrade VALUES ( 1 , 10000 , 15000);

-- Ȯ��
SELECT * FROM salgrade;

-- �ε��� ����� ����
ALTER INDEX idx_salgrade REBUILD;

-- �ε��� ����
DROP INDEX idx_salgrade;


-- UNIQUE �ε��� ���� , �̹� �ߺ����� �־ �ȴ��
CREATE UNIQUE INDEX idx_salgrade ON salgrade( grade );
-- �̹� �ߺ����� �־ �ȴ��

SELECT * FROM salgrade
WHERE grade = 5 AND losal = 10000;

-- ������Ʈ�� 5���ߺ����� �ϳ��� ����!
UPDATE salgrade set grade = 6
WHERE grade = 5 AND losal = 10000;

-- UNIQUE �ε��� ���� , �ߺ������� ��� ����!
CREATE UNIQUE INDEX idx_salgrade ON salgrade( grade );

-- �ڷ���� ��ȸ
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade');


--���� �Ұ��� 
INSERT INTO salgrade VALUES ( 4 ,10202 ,111005);

-- emp���̺� �μ��� ��ȸ
SELECT * FROM emp
WHERE deptno = 30;

-- NONUNIQUE �ε��� ����
CREATE INDEX idx_empdept ON emp (deptno);

-- �ڷ���� ��ȸ
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

-- �μ� �� �̸����� ��ȸ
SELECT * FROM emp
WHERE deptno = 10
    AND ename = 'MILLER';

-- ���� �÷� �ε��� ( COMPOSITE UNIQUE INDEX)
CREATE UNIQUE INDEX idx_emp_depno_ename
ON emp ( deptno , ename );

-- �ڷ���� Ȯ��
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

SELECT * FROM user_ind_columns
WHERE TABLE_NAME = upper('emp')
ORDER BY INDEX_NAME , COLUMN_POSITION;


