-- to_number
SELECT
    '123.67' "1",
    to_number('123.67')"2",
    to_number('123.67','99999.99')"3",
--    to_number('123.67','99999.9')"4",�Է��ѵ����ͺ��� ������������ ó������
    to_number('123.67','99999.999')"5"   
FROM dual;

SELECT
    67890 + 11111 "1",
    '67890' + 11111 "2", --���ڿ� ���ڴ� �ڵ�����ȯ�� �̷�����
    to_number('67890') + 11111 "3",
--    '67,890'+11111"4",  ,�� �������� �������� �𸥴� �̷��� to_number
    to_number('67,890')+11111 "5", --���Ĺ��ڷ� ��ȯ�����ϴٴ°� �˷���� ��ȯ �����ش�
    to_number('67,890','99,999') + 11111 "6"
FROM dual;

SELECT
--    '$78,789' + 10000 "1",
    to_number('$78,789','$999,999,999') + 10000 "2"
FROM dual;

-- to_date
SELECT
--    '19/10/7'+5 "1"-- ��¥�� �����ϸ� �ϼ��� �þ��
    to_date('19/10/7')+30 "2"
FROM dual;

SELECT
    '12 1 11' "1",
    to_date('12 1 11') "2",
    to_date('12 1 11','YY MM DD') "3", --��/��/��
    to_date('12 1 11','MM DD YY')"3" --��/��/��
FROM dual;


-- NVL
SELECT * FROM emp;

SELECT empno,ename , NVL(comm,0) COMM
FROM emp
ORDER BY comm DESC , ename;

--NVL2
-- comm�� NULL�̸� salġȯ
-- comm�� NULL�� �ƴϸ� sal+comm�� ġȯ

--NULL �����ʹ� �������� �ʴ� �����ͷ� �����ؼ�
--���� ,�Լ��� ������ ������ ����ϸ� �ƹ��͵� �������� �ʴ´�.
SELECT ename, sal , comm, sal+comm FROM emp;  --NULL�������� ������ع���

SELECT 
    ename,sal, comm, NVL2(comm, sal+comm , sal) pay
FROM emp;


--NULLIF
SELECT
    NULLIF(10,20)"1",
    NULLIF(20,10)"2",
    NULLIF(10,10)"3"
FROM dual;

-- job�÷����� 'SALSEMAN'�� ã�´� -> NULL��ȯ
-- NULL���� NVL�� �̿��� '����' ��ȯ
SELECT empno,ename, job
FROM emp;

SELECT empno,ename, job,
    NULLIF(job,'SALESMAN') N_IF,
    NVL( NULLIF(job,'SALESMAN'),'����')job_kor
FROM emp;


--DECODE
SELECT * FROM dept;

SELECT empno, ename , deptno,
    DECODE( deptno,
        10, 'ȸ����',
        20, '������',
        30, '������',
        40, '���',
        '�μ�����') dname    -- default�� : �μ�����
FROM emp;

-- CASE ����
SELECT empno, ename , deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;

--���� �����ֱ�
SELECT empno, ename , deptno,
    CASE 
        WHEN job=upper('president') THEN '����'  --���������� �о �������� �ٲ�� �����γ�������.
        WHEN deptno=10 THEN 'ȸ����'  -- 
        WHEN deptno=20 THEN '������'
        WHEN deptno=30 THEN '������'
        WHEN deptno=40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;

    