-- ������ ���� ������ ||
SELECT
    ename || ' is ' || job AS EMPLOYEE
FROM emp;

-- ' ' �� ǥ���� ���� �ȿ��� '�� ����ϰ� ������ ''�� ����Ѵ�.
SELECT -- SMITH's job is CLERK
    ename || '''s job is ' || job AS EMPLOYEE
FROM emp;

-- SQL Functions

-- ���� �� �Լ�
SELECT
    ename , length(ename) LEN -- Single Row
FROM emp;

-- �׷� �Լ�
-- ��ȸ�Ǵ� ����� �� ���� ��Ÿ����.
SELECT count(*) FROM emp; -- Group


-- DUAL ���̺�
SELECT 1 FROM emp; 
SELECT 1+2 FROM emp; 

SELECT 1 FROM dual;
SELECT 1+2 FROM dual; --�׽�Ʈ������ �ؾߵǴµ� ���̺��� ���� ��

--�������� �÷��� �Ѱ��� ������ ���´�.
SELECT 1+2 ���ϱ�, 6*5 ���ϱ�,5-7 ���� FROM dual; 

-- �����Լ�
--  abs()
SELECT abs(-44) FROM dual;
SELECT abs(-5786.457) FROM dual;
SELECT abs(10-15) "���밪 10-15 " FROM dual;
SELECT abs(sal) FROM emp;


