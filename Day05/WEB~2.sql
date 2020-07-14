-- ���� ����

-- KING �� �μ���ȣ
SELECT deptno FROM emp
WHERE ename = upper('king');

-- 10�� �μ��� ���� Ȯ��
SELECT * FROM dept
WHERE deptno =10;

SELECT * FROM dept
WHERE deptno = (
    SELECT deptno FROM emp
    WHERE ename = upper('king'));

-- SELECT D.deptno , dname , loc  --JOIN
SELECT D.* 
FROM emp E , dept D
WHERE E.deptno = D.deptno
    AND ename = upper('king');

-- ��� �ӱݺ��� �޿��� ���� �޴� ����� ��ȸ�ϱ�

-- �߸��� ��� : WHERE ������ GROUP�Լ��� ����� �� ����
SELECT * FROM emp
WHERE sal > avg(sal); 

-- �߸��� ��� : HAVING�� ������ GROUP BY�ʿ���
SELECT * FROM emp
HAVING sal > avg(sal);

--�̷���
SELECT avg(sal) FROM emp; -- ����ӱ� ���ϱ�

--1.
SELECT empno, ename , sal 
FROM emp
WHERE sal >(SELECT avg(sal) FROM emp);

--2.
SELECT empno, ename , sal ,
    (SELECT round(avg(sal),2) FROM emp ) ���
FROM emp
WHERE sal >(SELECT avg(sal) FROM emp);

-- ���� �ֱٿ� �Ի��� ���
SELECT MAX(hiredate) FROM emp;

SELECT empno, ename, hiredate FROM emp
WHERE hiredate = (SELECT MAX(hiredate) FROM emp);

-- �߸��� ���
SELECT empno,ename , hiredate , max(hiredate) FROM emp;

--����!
-- ��ü ��� �ӱݺ��� �μ� �� ����ӱ��� ���� �μ�
-- �÷� : deptno , avg_sal
-- 10 2916.67
-- 20 2258.33
SELECT round(avg(sal),2) FROM emp;-- ��ü���
SELECT round(avg(sal),2) ,deptno FROM emp group by deptno;--�μ��� ���


SELECT deptno ,round(avg(sal),2)"�μ������" ,(SELECT round(avg(sal),2) FROM emp)"��ü���",
      (SELECT dname FROM dept D WHERE D.deptno = E.deptno)�μ�������
FROM emp E
GROUP BY deptno
HAVING avg(sal)>(SELECT round(avg(sal),2) FROM emp)
ORDER BY deptno;

--��Į�� ��������
SELECT 
    empno,ename,deptno,
    (SELECT dname FROM dept D WHERE D.deptno = E.deptno)dname,
    (SELECT loc FROM dept D  WHERE D.deptno = E.deptno)loc
FROM emp E;

-- �μ��� �ο� ���ϱ�
--  40�� �μ��� 0���̶�� ����Ѵ�
-- 1.���������� Ȱ���ؼ� �ۼ��ϱ�
-- 2.JOIN�� �̿��ؼ� �ۼ��ϱ�
-- deptno , dname , cnt_employee

SELECT deptno , count(*)
FROM emp
GROUP BY  deptno;

--1.
SELECT 
    deptno,
    dname
    ,(SELECT count(*) FROM emp E WHERE E.deptno = D.deptno) cnt_employee
FROM dept D;


--2.
SELECT
    E.deptno, dname,
    count(empno) cnt_employee
FROM emp E , dept D
WHERE E.deptno(+) = D.deptno
GROUP BY E.deptno, dname
ORDER BY E.deptno;

--2. ANSI
SELECT
    E.deptno, dname,
    count(empno) cnt_employee
FROM emp E 
RIGHT OUTER JOIN dept D ON E.deptno(+) = D.deptno
--INNER JOIN salgrade ON sal BETWEEN losal AND hisal
GROUP BY E.deptno, dname
ORDER BY E.deptno;


-- ORDER BY ���� �������� ����
SELECT empno,ename ,sal , deptno 
FROM emp E 
ORDER BY (SELECT loc FROM dept D WHERE E.deptno = D.deptno);

--���� ��������
SELECT empno,ename ,sal , E.deptno ,loc
FROM emp E ,dept D
WHERE E.deptno = D.deptno
ORDER BY loc;



-- rownum
--  ��ȸ�Ǵ� ����� �� ��ȣ�� ���̴� Ű����
SELECT rownum , empno ,ename FROM emp;

--SELECT rownum , * FROM emp; �ȉ´�
SELECT rownum ,emp.* FROM emp;
SELECT rownum , E.* FROM emp E;

-- rownum �� �߸��� ����
--      SELECT ������ rownum�� ������ �� ORDER BY���� ������
--      -> ORDER BY�� ������ ���°� rownum�� �ݿ����� �ʴ´�.
SELECT rownum rnum , E.* FROM emp E
ORDER BY sal DESC;

-- ORDER BY ���� �ذ�
SELECT rownum sal_rank , E.* FROM(
    SELECT * FROM emp
    ORDER BY sal DESC , empno
)E
WHERE rownum BETWEEN 1 AND 3;  -- 1���� ã���� �ȳ��´�

--�߸��� ����
--      rownum�� 1������ ���ӵ� ���� �ο��Ѵ�
--      ���������� 1���Ͱ� �ƴ� �߰����� ��ȸ�ϸ� ã�� ����
SELECT rownum sal_rank , E.* FROM(
    SELECT * FROM emp
    ORDER BY sal DESC , empno
)E
WHERE rownum BETWEEN 5 AND 8;

--WHERE �� ���� �ذ�
SELECT * FROM(
    SELECT rownum sal_rank , E.* FROM(
        SELECT * FROM emp
        ORDER BY sal DESC , empno
    )E
) R
WHERE sal_rank BETWEEN 5 AND 8;


--  TOP-N �м�
-- rownumŰ���带 �̿��� Top-N �м�
SELECT * FROM(
    SELECT rownum rnum, TMP.* FROM(
        SELECT * FROM ���̺��--��ȸ�Ϸ��� �������
        ORDER BY �÷��� -- ���ı��� ����
    )TMP
)R
WHERE rnum�� �� ���ǹ�;


-- �Ի糯¥�� ���� ������ 3�� ��ȸ�ϱ�
SELECT * FROM(
    SELECT rownum rnum, TMP.* FROM(
        SELECT * FROM emp--��ȸ�Ϸ��� �������
        ORDER BY hiredate -- ���ı��� ����
    )TMP
)R
WHERE rnum BETWEEN 1 AND 3;