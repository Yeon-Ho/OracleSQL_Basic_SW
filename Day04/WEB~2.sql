--COUNT
SELECT * FROM emp;
SELECT count(*)cnt FROM emp;

SELECT empno FROM emp;
SELECT count(empno) cnt_ename FROM emp;

SELECT mgr FROM emp; --12���� �����Ͱ� ������ null���� �ϳ� �������ִ�.
SELECT count(mgr) FROM emp; --�׷��� count���� null���� �����Ѵ�.

SELECT comm FROM emp ORDER BY comm; -- 0�� ���� �������ִٰ� ����
SELECT count(comm) FROM emp;

SELECT * FROM emp;
SELECT 1 FROM emp; 
SELECT count(*) FROM emp;
SELECT count(1) FROM emp; --���� �̷��� ���ʿ����.

-- SUM 
SELECT sum(sal) tot_sal FROm emp;

-- AVG
SELECT round(avg(sal),2) avg_sal FROM emp;

-- MAX
SELECT max(sal) max_sal FROM emp;

--MIN
SELECT min(sal) min_sal FROM emp;

SELECT max(ename) FROM emp; -- �������� 

SELECT
    max(hiredate),
    min(hiredate)
FROM emp;                   -- ��¥��

SELECT * FROM emp
ORDER BY deptno;

-- ��ü sal�� ���� �հ�
SELECT sum(sal) FROM emp;

-- �μ��� �޿� �հ�
SELECT 
    deptno,
    sum(sal)
FROM emp  
GROUP BY deptno 
ORDER BY deptno; 

-- �μ��� �ο���
SELECT
    deptno,
    count(*) cnt
FROM emp
GROUP BY deptno;

SELECT
    deptno,
    job
FROM emp
ORDER BY deptno,job;

-- �μ��� + ������ ��� ��
SELECT
    deptno,
    job,
    count(*) cnt  -- 30���μ��� SALESMAN �ο� 4��
FROM emp
GROUP BY deptno , job 
ORDER BY deptno , job; 

--�ǹ̾��� �ڵ� (ename)
SELECT
    deptno,job, ename,
    count(*) cnt  -- 30���μ��� SALESMAN �ο� 4��
FROM emp
GROUP BY deptno , job ,ename -- �׷���̸������� �÷����� ���ƾ� ���
ORDER BY deptno , job;

