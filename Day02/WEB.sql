-- scott/tiger ����...

-- ����ڰ����� ���̺� ��ȸ
-- (tabs �ڷ����)
SELECT * FROM tabs;

-- ���̺��� ����(��Ű��) ������ Ȯ��
DESC emp;

-- ���̺��� ������ Ȯ��
SELECT * FROM emp;

-- �ּ� , Comment
-- ���� �ּ� ����Ű : ctrl + /

-- SELECT ����
-- ��ü �÷� ��ȸ
select * FROM emp;
select * From dept;
select * FROM salgrade;
select * FROM bonus;

SELECT *
FROM bonus;

-- �κ� �÷�(������ �÷�) ��ȸ
SELECT 
    empno , ename ,job 
FROM emp;

-- ��ȸ�Ǵ� �÷��� ��Ī(Alias)�� �����ϱ� 
-- �����Ϳ����� �ǵ����ʰ� ,���϶� �ٲ㼭 ���´�.
SELECT 
    empno AS "���", --�����ȣ
    ename "�̸�" --����̸�
FROM emp;

DESC emp;
SELECT empno ,ename ,job , mgr FROM emp;
SELECT * FROM emp;

-- WHERE �� (������)

-- ��������鸸 ��ȸ�ϱ�
SELECT * FROM emp
WHERE job = 'SALESMAN';

-- ��ü ����� �� �޿��� 2000�� �Ѵ� ���
SELECT * FROM emp
WHERE sal > 2000;

-- �޿��� 2500�� �Ѱ� �����ڰ� �ƴ� ���
SELECT * FROM emp
WHERE sal > 2500 
--   AND job <> 'MANAGER';
   AND NOT(job = 'MANAGER');  -- �� �����̶� ���� ��
   

-- BETWEEN a AND b
-- �����ȣ�� 7700 ~ 7900�� ��� ��ȸ
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;

-- ����̸��� 'ALLEN' ~ 'KING' ������ ��� ��ȸ
SELECT empno , ename FROM emp
 WHERE ename BETWEEN 'ALLEN' AND 'KING';
--WHERE NOT(ename BETWEEN 'ALLEN' AND 'KING');
--WHERE ename NOT BETWEEN 'ALLEN' AND 'KING';

-- IN(list)
SELECT empno , ename FROM emp
WHERE empno IN(7369,7521,7654,7777, 8888,7878);
 
-- NOT IN(list)
SELECT empno , ename FROM emp
WHERE NOT (empno IN(7369,7521,7654,7777, 8888,7878));

SELECT empno , ename FROM emp
WHERE empno NOT IN(7369,7521,7654,7777, 8888,7878);

-- IN(������)
SELECT empno , ename FROM emp
WHERE ename IN( 'SMITH','ALLEN','KING','JANG');

-- LIKE
SELECT empno , ename FROM emp
--WHERE ename LIKE '%R%'; -- �̸��� R�� �����ϴ� ���
--WHERE ename LIKE '_A%'; -- �̸��� �ι�°�� A�� ���
--WHERE ename LIKE '%RD'; -- �̸��� RD�� ������ ���
WHERE ename NOT LIKE '%R%'; --�̸��� R�� �������� �ʴ� ���

-- ���ǻ��� 
-- LIKE�����ڿ� IN�����ڸ� ���� ����ϴ� ������ ����.
SELECT empno,ename FROM emp
--WHERE ename LIKE IN('%R%' , '%L%');  -- LIKE �� IN�� �����ؾ��Ѵ�
WHERE ename LIKE '%R%'
    OR ename LIKE '%L%';

-- ���ľ��� �����(equal)�� �Ҷ�����
-- LIKE�����ڸ� ����ϸ� �ȵȴ�( Full - Scan �߻��Ѵ�.)
SELECT empno , ename FROM emp
--WHERE empno LIKE '7654';
WHERE empno = '7654'; -- ������Ҷ��� ������ = �������

-- IS NULL  , = �����ڴ� ���� �ȉ´�.
SELECT * FROM emp
-- WHERE mgr = null; --��ȸ���� �ʴ´�.
WHERE comm IS NULL;
--WHERE comm IS NOT NULL;


