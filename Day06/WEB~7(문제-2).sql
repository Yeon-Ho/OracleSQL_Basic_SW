--1. 2012�� 1�� 3�� ����ȯ�� �� 
-- �����ܰ�(�ڵ�:05xx)�� �����ܰ�(�ڵ�:08xx)�� �̺����İ�(�ڵ�:13xx)
-- ȯ����ȸ
32	��ȯ��
33	���̳�
37	����
42	����
43	�����

SELECT PAT_NAME FROM TREAT T,DOCTOR D ,PATIENT P
WHERE (TRT_YEAR = 2012 AND TRT_DATE = 0103)
    AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE)
    AND (DEP_CODE LIKE '05__' OR DEP_CODE LIKE '08__' OR DEP_CODE LIKE '13__');

--2. 2012�� 1�� 3�� ����ȯ�� �� ���� ����ð��� 09:00 ~ 12:00 �̰�
-- ������� �����ܰ�(�ڵ�:05xx)�� �����ܰ�(�ڵ�:08xx)�� �̺����İ�(�ڵ�:13xx)
-- �� �ƴ� ȯ����ȸ
30	��ȯ��
35	Ȳȯ��
39	��⸮
40	�����

SELECT PAT_NAME FROM TREAT T , DOCTOR D ,PATIENT P
WHERE TRT_YEAR = 2012 AND TRT_DATE = 0103 
    AND TRT_TIME BETWEEN 0900 AND 1200
     AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE)
    AND (DEP_CODE NOT LIKE '05__' AND DEP_CODE NOT LIKE '08__' AND DEP_CODE NOT LIKE '13__');


--3. 2014�� 1�� 1�� ����ȯ�� �� 5�� ���
-- (����ð����� �� ������ ����ȯ�� 5��)

5	�����
19	�캰��
21	������
24	������
27	�ȼ���

SELECT * FROM(
SELECT rownum rnum, PAT_NAME FROM TREAT T , DOCTOR D ,PATIENT P
WHERE TRT_YEAR = 2014 AND TRT_DATE = 0101 
     AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE))
    WHERE rnum BETWEEN 9 AND 13;

