-- NON-EQUI JOIN , �� ����
SELECT * FROM emp; -- ��� ���� ���̺�
SELECT * FROM salgrade; -- �޿���� ���� ���̺�

SELECT ename ,sal , grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal -- ���� ����
ORDER BY grade , sal,ename;

-- ANSIǥ�� NON-EQUI
SELECT ename ,sal , grade
FROM emp
INNER JOIN salgrade
    ON sal BETWEEN losal AND hisal -- ���� ����
-- WHERE grade = 3  �߰�����    
ORDER BY grade , sal,ename;


-- SELF JOIN
SELECT * FROM emp EMPLOYEE;
SELECT * FROM emp MANAGER;

SELECT empno , ename, mgr FROM emp EMPLOYEE;
SELECT distinct(mgr) FROM emp MANAGER;

SELECT 
    E.empno , E.ename, E.mgr,M.empno , M.ename
FROM emp E , emp M
WHERE E.mgr = M.empno; -- ���� ����

-- ANSI���� SELF JOIN
SELECT 
    E.empno , E.ename, E.mgr, M.ename
FROM emp E 
INNER JOIN emp M
    ON E.mgr = M.empno; -- ���� ����