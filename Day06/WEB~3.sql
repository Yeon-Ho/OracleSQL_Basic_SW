-- ���� ������

-- UNION : ������ 
SELECT empno , ename , job, 0 AS "DEPTNO" FROM emp
WHERE job = 'SALESMAN'
UNION
SELECT empno , ename , job, deptno FROM emp
WHERE job = 'MANAGER'
ORDER BY ename;

--SELECT empno , ename , job, deptno FROM emp
--WHERE job IN ('MANAGER','SALESMAN')
--ORDER BY ename;

-- UNION ALL : ������ ,�ߺ���� (�ߺ����� �߰��Ǽ� ���δ�)
SELECT empno , ename , sal FROM emp
WHERE sal<2000
UNION ALL
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;

-- INTERSECT : ������
SELECT empno , ename , sal FROM emp
WHERE sal<2000
INTERSECT
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;

--MINUS : ������ (�ߺ��� �����͸� ����)
SELECT empno , ename , sal FROM emp
WHERE sal<2000
MINUS
SELECT empno , ename , sal FROM emp
WHERE sal<1000
ORDER BY empno;
