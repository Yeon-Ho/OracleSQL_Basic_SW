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

SELECT * FROM emp WHERE empno<2000 ;--(Ȯ��)


SELECT 1,2,'a','b' FROM dual;

SELECT 1003,'MATHEW','SALESMAN',null,sysdate,1500,100,30
FROM dual;

--  INSERT INTO(3)VALUES��� SELECT���� ���   ���������� ����
INSERT INTO emp
SELECT 1003,'MATHEW','SALESMAN',null,sysdate,1500,100,30
FROM dual;

SELECT * FROM emp WHERE empno<2000;--(Ȯ��)


-- ���� �� ����� ������ �����ϼ���

-- ��� 1011, �̸� EDWARD , ���� MANAGER
--   empno ,   ename    ,  job
INSERT INTO emp(empno , ename , job)
VALUES (1011,'EDWARD','MANAGER');

-- ��� 1014 , �̸�Richard , �޿� 2000
--   empno ,   ename       , sal
INSERT INTO emp(empno , ename , sal)
VALUES (1015,'Richard',2000);

SELECT * FROM emp WHERE empno<2000;--(Ȯ��)

-- commit; -- Ŀ��, ������ ��������� ���������� ����
 commit;

SELECT * FROM emp;
-- DELETE emp; -- ���̺� ��ü ����
-- rollback; -- �ѹ� , ������ ��������� �ǵ�����


-- ���̺� ���� ( SELECT ������ ����� �纻���̺�� �����Ѵ�.) ���纻
CREATE TABLE emp_research
AS 
SELECT * FROM emp;

-- ���̺� Ȯ��
SELECT * FROM emp_research;

-- ���̺� ����
DROP TABLE emp_research;

-- �� ���̺� ����
SELECT * FROM emp WHERE 1=0; -- 1=0(false)

CREATE TABLE emp_research AS SELECT * FROM emp WHERE 1=0;
-- ���̺� Ȯ��
SELECT * FROM emp_research;

-- 20�� �μ��� ��� �����͸� INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno = 20;
SELECT * FROM emp_research;--Ȯ��

-- 30�� �μ��� ��絥���͸� empno,ename �� INSERT
INSERT INTO emp_research(empno,ename)
SELECT empno , ename FROM emp WHERE deptno = 30;
SELECT * FROM emp_research;--Ȯ��

-- ��� ������ ����
DELETE emp_research;

-- INSERT ALL
INSERT ALL 
WHEN deptno = 20
    THEN INTO emp_research --��ü ������ �ֱ�
WHEN deptno = 30
    THEN INTO emp_research(empno , ename)
    VALUES(empno , ename) --���ϴ� �÷��� �� �ֱ�
SELECT * FROM emp;

SELECT * FROM emp_research;-- Ȯ��

--INSERT ALL QUIZ

-- emp�� �̿��� �����;��� emp_hire ���̺� ����
--  empno , ename , hiredate
CREATE TABLE emp_hire
AS
SELECT empno,ename,hiredate FROM emp WHERE 1=0;--�����̺����

SELECT * FROM emp_hire;--Ȯ�� ����

-- emp�� �̿��� �����;��� emp_sal ���̺� ����
--  empno , ename , sal
CREATE TABLE emp_sal
AS
SELECT empno,ename,sal FROM emp WHERE 1=0;--�����̺����

SELECT * FROM emp_sal;-- Ȯ�� ����

-- INSERT ALL ����ؼ� �ذ��ϱ�
-- emp_hire ���̺� , '1981/06/01' ���� ���
-- emp_sal ���̺� , 2000���� ���� ���
INSERT ALL
WHEN hiredate < '1981/06/01'
    THEN INTO emp_hire
    VALUES ( empno , ename , hiredate )
WHEN sal>2000
    THEN INTO emp_sal
    VALUES (empno,ename , sal)
SELECT * FROM emp;

SELECT * FROM emp_hire;
SELECT * FROM emp_sal;--Ȯ�α���
-- commit;
-- rollback;
--���� �ڵ� (��ü���̺� ������ ����)
--DELETE emp_hire; -- �����̸Ӹ� Ű����� ������ ���� �����ڵ� 
--DELETE emp_sal; 

SELECT * FROM emp_sal
-- DELETE emp_sal   -- �̷������� �����ؼ� �������.
WHERE empno = 7839;

SELECT * FROM emp
-- DELETE emp
WHERE empno = 7369;

rollback;