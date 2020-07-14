-- 2020-03-27
-- ���� �� ��������

-- IN ������
--      SALESMAN���� �޴� �޿� ����
SELECT DISTINCT sal
FROM emp
WHERE job = upper('salesman')
ORDER BY sal;

SELECT * FROM emp
WHERE sal IN( 1250 , 1500 , 1600);

SELECT * FROM emp
WHERE sal IN(
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') );
    
-- ������ ���� �μ���ȣ Ȯ��
SELECT deptno FROM emp
WHERE job = upper('president');

SELECT * FROM emp
--WHERE deptno = 10;
WHERE deptno = (SELECT deptno FROM emp
WHERE job = upper('president')); --�������� ����� �ϳ��� �׷��� = ����
-- ������ �̵� ������ �̵� IN�� ��밡��


-- ANY ������
SELECT * FROM emp
WHERE sal = ANY ( -- IN �����ڿ� ����
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ANY ( -- �ִ�(�ְ�) ������ ���� �����Ͱ� ��ȸ��
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


SELECT * FROM emp
WHERE sal > ANY ( -- �ּ�(����) ������ ū �����Ͱ� ��ȸ��
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


-- ALL ������
SELECT * FROM emp
WHERE sal  = ALL ( -- ��� ��ο� ���� �� ��ȸ�� , �������.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal  < ALL ( -- �ּ�(����)������ ���� ������ ��ȸ�ȴ�.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ALL (  -- �ִ�(�ְ�)������ ū ���� ��ȸ�ȴ�
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

-- EXISTS

-- �Ŵ����� �����ȣ
SELECT DISTINCT mgr FROM emp ORDER BY mgr;

--�Ŵ��� ������ �����ϰ� �ִ� ������� ����
SELECT * FROM emp E
WHERE empno IN (   -- IN����
    SELECT DISTINCT mgr 
    FROM emp
)
ORDER BY empno;  

SELECT * FROM emp E
WHERE EXISTS ( 
    SELECT DISTINCT mgr 
    FROM emp M
    WHERE E.empno = M.mgr
) ORDER BY empno;

-- �Ҽ��ο��� �����ϴ� �μ����� ����
SELECT * FROM dept D
WHERE EXISTS ( SELECT * FROM emp E WHERE D.deptno = E.deptno)
ORDER BY deptno;

SELECT * FROM dept D
WHERE deptno IN ( SELECT deptno FROM emp E )
ORDER BY deptno;
