--2020-03-26
SELECT * FROM emp;
SELECT * FROM dept;

-- ī�׽þ� �� , CROSS JOIN
SELECT * FROM emp,dept; --ī�׽þ� ��
--CROSS JOIN
SELECT * FROM emp
CROSS JOIN dept;--ī�׽þ� ��

-- NATURAL JOIN
SELECT * FROM emp
NATURAL JOIN dept
ORDER BY deptno,empno;

------------------------OUTER JOIN------------------------------------------

-- OUTER JOIN(����Ŭ ���뱸��)
SELECT empno , ename , D.deptno,dname
FROM emp E , dept D
WHERE E.deptno (+) = D.deptno --(+): �ƿ��� ���� ������(�������� ���ڰ� ������ �ʿ� �߰��Ѵ�)
ORDER BY deptno , empno;

-- ANSI ǥ�ر���,OUTER JOIN , ANSI�� FROM���� ���̺� �ϳ����;ߵ�
SELECT empno , ename , D.deptno,dname
FROM emp E 
RIGHT OUTER JOIN dept D  -- ������ ���̺� �ݴ���� ����
    ON E.deptno = D.deptno -- ���� ���� 
ORDER BY deptno , empno;



-- OUTER JOIN(����Ŭ ���뱸��)
SELECT empno , ename , D.deptno,dname
FROM  dept D , emp E 
WHERE D.deptno =  E.deptno (+) --(+): �ƿ��� ���� ������(�������� ���ڰ� ������ �ʿ� �߰��Ѵ�)
 ORDER BY deptno , empno;

-- ANSI ǥ�ر���,OUTER JOIN 
SELECT empno , ename , D.deptno,dname
FROM  dept D 
LEFT OUTER JOIN emp E  -- ANSI�� �ƿ������� �Ϸ��� ON �ʿ��� '='�� ���� ���������̺� �ݴ���� LEFT/RIGHT ����.
ON D.deptno =  E.deptno
ORDER BY deptno , empno;


-- SELF JOIN ���� OUTER JOIN (����Ŭ����)
SELECT
    E.empno, E.ename , E.mgr , M.ename �Ŵ����̸�
FROM emp E , emp M
WHERE E.mgr = M.empno(+); --KING�� �Ŵ����� �����ϱ� �Ŵ����÷��� M�̴ϱ�

-- SELF JOIN ���� OUTER JOIN (ANSI)
SELECT
    E.empno, E.ename , E.mgr , M.ename MGR_NAME
FROM emp E 
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno;
    
-- FULL OUTER JOIN(�����غ����� �ؿ�)
CREATE TABLE test1 ( no NUMBER ); --���̺� ����
CREATE TABLE test2 ( no NUMBER ); --���̺� ����    

DELETE test1; -- ���̺� ������ ��ü����

INSERT INTO test1 VALUES ( 10 ); --������ ����
INSERT INTO test1 VALUES ( 20 );
INSERT INTO test1 VALUES ( 30 );
SELECT * FROM test1;

DELETE test2; -- ���̺� ������ ��ü����

INSERT INTO test2 VALUES ( 10 ); --������ ����
INSERT INTO test2 VALUES ( 20 );
INSERT INTO test2 VALUES ( 40 );
SELECT * FROM test2;


SELECT * FROM test1,test2
--WHERE test1.no = test2.no;-- INNER JOIN , EQUI JOIN , ��������
--WHERE test1.no(+) = test2.no; -- RIGHT OUTER JOIN
WHERE test1.no = test2.no(+); -- LEFT OUTER JOIN
--WHERE test1.no(+) = test2.no(+); -- ������� �ʴ´�.


SELECT * FROM test1
FULL OUTER JOIN test2 -- FULL OUTER JOIN
    ON test1.no = test2.no 
ORDER BY test1.no;
