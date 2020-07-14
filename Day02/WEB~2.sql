-- ORDER BY ��
SELECT * FROM emp
--ORDER BY empno; 
--ORDER BY ename;
ORDER BY ename DESC;

-- �μ���ȣ ��������, �μ� �� �̸� �������� , �������� ��� ��������
SELECT * FROM emp
ORDER BY deptno ASC , ename DESC , empno;

-- ���������Ҳ��� null���� ���� �ڷ� ���� (�ַ� �̰ž�)
SELECT empno , ename , comm FROM emp
ORDER BY comm DESC NULLS LAST;

-- ���������Ҳ��� null���� ���� ������ ����
SELECT empno , ename , comm FROM emp
ORDER BY comm ASC NULLS FIRST;

-- ���ʿ� null���� ���ֹ�����
SELECT empno , ename , comm FROM emp
WHERE comm IS NOT NULL
ORDER BY comm DESC;

SELECT empno , ename , comm  FROM emp
--WHERE comm IS NOT NULL
ORDER BY comm DESC NULLS LAST , ename , empno;

-- ��ȸ���� �ʴ� �÷��� �̿��ؼ��� ���ı������� ���� �� �ִ�.
SELECT empno , ename , comm FROM emp
ORDER BY sal DESC, comm DESC;

-- DISTINCT Ű����
SELECT DISTINCT 
    deptno 
FROM emp
ORDER BY deptno;

SELECT empno , ename FROM emp;

SELECT DISTINCT empno , ename FROM emp; 

SELECT DISTINCT deptno , ename FROM emp
ORDER BY deptno,ename; -- �� �� ��ü�� ������ ����� ������

-- ���� ���� Ȯ���ϱ�
SELECT DISTINCT 
    job
FROM emp
ORDER BY job;

--�μ����� ������ ������ �ֳ� ����.
SELECT DISTINCT
    deptno,job
FROM emp
ORDER BY deptno , job;