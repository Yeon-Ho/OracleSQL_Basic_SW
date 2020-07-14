-- UPDATE 
SELECT * FROM emp
-- UPDATE emp SET ename = 'Mc' , job = 'Donald'
WHERE empno = 1001;
--commit; Ŀ��, ������ ��������� ���������� ����

-- emp_hire ���̺��� ��ü �������� �Ի����� ����ð����� ����
SELECT * FROM emp_hire;
--UPDATE emp_hire SET HIREDATE = trunc(sysdate);
SELECT to_char(hiredate, 'yyyy/mm/dd hh24:mi:ss') FROM emp_hire;

-- emp_sal�� ����� ���� �޿� 550 �λ�
SELECT * FROM emp_sal;
-- UPDATE emp_sal SET sal = sal+550;


-- MERGE(����Ŭ ���� ����)
CREATE TABLE emp_merge
AS
SELECT empno , ename , sal , deptno FROM emp
WHERE deptno IN(10,20);

SELECT * FROM emp_merge
ORDER BY deptno , empno;

-- emp���̺��� 20,30�μ� ������� ��ȸ(SELECT)
--   emp_merge ���̺�� ������ ����(merge)
-- �̹� ���̺� �����ϴ� �����Ͷ�� sal�� 30% �λ�( UPDATE )
-- ���̺� �������� �ʴ� �����Ͷ�� ����(INSERT)

MERGE INTO emp_merge M
USING (
    SELECT empno , ename , sal , deptno 
    FROM emp
    WHERE deptno IN(20,30) 
    ) E
ON( M.empno = E.empno)
WHEN MATCHED THEN -- �����ϴ� ������ , 20�� �μ�
    UPDATE SET M.sal = M.sal*1.3
--    WHERE E.Sal>1500
WHEN NOT MATCHED THEN -- �������� �ʴ� ������ , 30�� �μ�
    INSERT (M.empno,M.ename,M.sal , M.deptno)
    VALUES (E.empno,E.ename,E.sal , E.deptno);
--    WHERE E.sal>1000;
    
SELECT * FROM emp_merge
ORDER BY deptno , empno;--Ȯ�� ����
    