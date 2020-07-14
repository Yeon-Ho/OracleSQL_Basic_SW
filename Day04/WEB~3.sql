-- ��ȸ �÷�(����)
-- deptno , dname , cnt , tot_sal , avg_sal

-- dname -> �ѱ۷�
-- cnt , tot_sal, avg_sal -> �μ��� ���
-- avg_sal -> �Ҽ��� 2�ڸ�����

SELECT 
    deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname,
    count(*)cnt,
    sum(sal)tot_sal,
    round(avg(sal),2)avg_sal
FROM emp
GROUP BY deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END 
ORDER BY deptno;

-- WHERE������ �׷��Լ��� ����� �� ����.
SELECT 
    deptno,
    round(avg(sal),2)avg_sal
FROM emp
--WHERE avg(sal)>2000   --
GROUP BY deptno 
HAVING avg(sal) > 2000  -- WHERE ��� HAVING ���� ����ؾ��Ѵ�.
ORDER BY deptno;
