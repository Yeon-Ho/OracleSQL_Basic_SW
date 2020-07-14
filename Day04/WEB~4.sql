SELECT * FROM emp
WHERE empno =7369;
SELECT * FROM dept
WHERE deptno = 20;

SELECT * FROM emp;

SELECT * FROM emp ,dept
WHERE emp.deptno = dept.deptno
ORDER BY dept.deptno;

-- �� ���̺��� ��� ���� �����ϱ�
SELECT * FROM emp,dept;

-- JOIN
--  emp ���̺� : 8cols 12rows
--  dept ���̺� : 3cols 4rows
--  emp x dept : 11cols(8+3)  48rows(12*4)

-- emp,dept ���̺� �� ��ο��� deptno ���� ���� �ุ ����
SELECT * FROM emp,dept -- ����Ŭ ���� ���� 
WHERE emp.deptno = dept.deptno;  

SELECT empno , ename , emp.deptno , dname
FROM emp,dept
WHERE emp.deptno = dept.deptno  -- ���� ����
    AND empno > 7800 -- �Ϲ� ��ȸ ����
ORDER BY empno;

-- ���̺� �̸��� Alias ����
SELECT empno , ename , E.deptno , dname
FROM emp E ,dept D
WHERE E.deptno = D.deptno  -- ���� ����
    AND empno > 7800 ;-- �Ϲ� ��ȸ ����

-- INNER JOIN , ���� ���� 
SELECT empno, ename , E.deptno , dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --���� ����
WHERE empno > 7800; --�Ϲ� ��ȸ ����