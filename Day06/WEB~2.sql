-- ���� �� ��������

-- �μ� �� �ְ� �ӱ��� �޴� ��� ��ȸ�ϱ�
SELECT deptno , max(sal) FROM emp
GROUP BY deptno;

SELECT deptno , empno , ename, sal
FROM emp
WHERE (deptno,sal) IN (
    SELECT deptno , max(sal) FROM emp
    GROUP BY deptno)
ORDER BY deptno;

-- �μ��� �̸���������
SELECT E.deptno ,dname, empno , ename, sal
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno
WHERE (E.deptno,sal) IN (
    SELECT  deptno , max(sal) FROM emp --���������� deptno �������� �������
    GROUP BY deptno)
ORDER BY deptno;

--��Į�� ���������� ó��
SELECT E.deptno ,
    (SELECT dname FROM dept D 
        WHERE E.deptno = D.deptno)dname,
 empno , ename, sal
FROM emp E
--INNER JOIN dept D
--    ON E.deptno = D.deptno
WHERE (deptno,sal) IN (
    SELECT  deptno , max(sal) FROM emp --���������� deptno �������� �������
    GROUP BY deptno)
ORDER BY deptno;


ALTER TABLE cons_9
ADD CONSTRAINT cddd_pk PRIMARY KEY (data);
