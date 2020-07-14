-- SELECT empno, ename, deptno FROM emp
-- WHERE	 ������ �̿��Ͽ� �ذ��� ��

SELECT * FROM emp;

 -- �μ���ȣ�� 30�̰� ������ ������ ��� ��ȸ
-- ALLEN, WARD, MARTIN, TURNER
SELECT empno , ename , deptno FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

 -- �μ���ȣ�� 30�̰� ������ ������ �ƴ� ��� ��ȸ
-- BLAKE, JAMES
SELECT empno , ename , deptno FROM emp
WHERE deptno = 30 AND NOT job ='SALESMAN';

 -- �μ���ȣ�� 30�� �ƴϰ� ������ ������ �ƴ� ��� ��ȸ
-- SMITH, JONES, CLARK, KING, FORD, MILLER
SELECT empno , ename , deptno FROM emp
--WHERE NOT (deptno = 30 OR job = 'SALESMAN');
WHERE deptno <> 30 AND job <> 'SALESMAN';

 -- �����ȣ�� 7782���� 7900 ������ ��� ��ȸ
-- CLARK, KING, TURNER, JAMES
 SELECT empno , ename , deptno FROM emp
 WHERE empno BETWEEN 7782 AND 7900;
 
  -- ������� 'A'���� 'C'�� �����ϴ� ��� ��ȸ
-- ALLEN, BLAKE, CLARK  
SELECT empno , ename , deptno FROM emp
WHERE ename >= 'A' AND ename <'D';
--WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%';

  
  -- �μ���ȣ�� 10 �Ǵ� 30�� ��� ��ȸ (IN ���)
-- ALLEN, WARD, MARTIN, BLAKE, CLARK, KING, TURNER, JAMES, MILLER  
SELECT empno , ename , deptno FROM emp
WHERE deptno IN (10,30);



