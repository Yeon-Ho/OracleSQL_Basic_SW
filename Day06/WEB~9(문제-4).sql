--1. 2014�� 1�� 2�� ����ȯ�� ��ü ������ȸ
--   ȯ�ڹ�ȣ, ȯ���̸�, �������, ����, �����ǻ��, �������
-- ��Į�� ���������� ǥ��

SELECT    T.PAT_CODE ȯ�ڹ�ȣ 
    ,(SELECT PAT_NAME FROM patient P WHERE p.pat_code=T.pat_code) ȯ���̸� 
    ,(SELECT pat_birth FROM patient P WHERE p.pat_code=T.pat_code) �������
    ,(SELECT pat_gender FROM patient P WHERE p.pat_code=T.pat_code) ����
    ,(SELECT DOC_NAME FROM DOCTOR D WHERE D.DOC_CODE = T.DOC_CODE)"�ǻ��̸�"
    ,(SELECT DEP_NAME FROM department F WHERE F.dep_code = P.dep_code) "�������"
FROM TREAT T , DOCTOR P 
WHERE TRT_YEAR = '2014' AND TRT_DATE = '0102'
    AND t.doc_code = p.doc_code
    ORDER BY T.PAT_CODE;
    

--2.2014�� 1�� 2�� ����ȯ�� �� �μ����̺��� WHERE �� SubQuery�� 
--����Ͽ� ��ȸ
--   ȯ�ڹ�ȣ, ȯ���̸�, �������, ����, �����ǻ��, �������

-- �� �ܰ��迭 ȯ�ڸ���ȸ('02xx')
-- where�� subquery

SELECT T.PAT_CODE ȯ�ڹ�ȣ,PAT_NAME ȯ���̸�,P.pat_birth �������
    ,P.PAT_GENDER ����, d.doc_name �ǻ��̸� , de.dep_name ������̸�
FROM TREAT T 
INNER JOIN patient P
    ON t.pat_code = p.pat_code
INNER JOIN DOCTOR D
    ON t.doc_code = d.doc_code
INNER JOIN department DE
    ON d.dep_code = de.dep_code
WHERE TRT_YEAR IN (2014)
    AND TRT_DATE IN(0102)
    AND d.dep_code IN( SELECT dep_code FROM department WHERE dep_code LIKE '02__')
    ORDER BY T.PAT_CODE;