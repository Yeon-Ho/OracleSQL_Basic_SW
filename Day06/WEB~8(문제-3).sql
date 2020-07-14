--1. 2013�� 1�� 25�� ������ ȯ���� ������ ������ȸ
-- �������, �����ǻ��, �����ð�, ȯ�ڹ�ȣ, ȯ���̸�, �������, ����
--(�����, ������, �����ð����� �������� ����)

SELECT DEP_NAME"������̸�",DOC_NAME "�ǻ��̸�"
    ,TRT_RECEIPT"�����ð�",T.PAT_CODE"ȯ�ڹ�ȣ"
    ,PAT_NAME"ȯ���̸�",PAT_BIRTH"�������",PAT_GENDER"����"
FROM TREAT T ,DOCTOR D, department E ,PATIENT P
WHERE  T.TRT_YEAR=2013 
    AND T.TRT_DATE=0125
    AND t.doc_code=d.doc_code
    AND D.dep_code=E.dep_code
    AND P.PAT_CODE=T.PAT_CODE
ORDER BY DEP_NAME ASC, DOC_NAME ASC , TRT_RECEIPT DESC ;


--2. 2013�� 12�� 25�� ������ ȯ���� ���� ������ȸ
--��������, ȯ�ڹ�ȣ, ȯ���̸�, �������, ����
--*�� 2014�� ���ķ� �Կ��ߴ����� �ִٸ� �Կ�����, �Կ��ð��� ���
--(����ð� ���� ����)
-- OUTER JOIN (+)
SELECT TRT_DATE "��������",T.PAT_CODE"ȯ�ڹ�ȣ",PAT_NAME"ȯ���̸�"
    ,PAT_BIRTH"�������",PAT_GENDER"����",INP_YEAR , INP_DATE ,INP_TIME
FROM TREAT T, PATIENT P,(SELECT * FROM INPATIENT WHERE INP_YEAR >=2014) I
        WHERE T.TRT_YEAR='2013' AND T.TRT_DATE='1225'
        AND T.pat_CODE = P.PAt_code
        AND I.pat_CODE(+) = p.pat_code
        ORDER BY T.TRT_TIME;


-- 3. 1���� ANSI �ڵ�� �ۼ��Ͻÿ�

SELECT DEP_NAME"������̸�",DOC_NAME "�ǻ��̸�"
    ,TRT_RECEIPT"�����ð�",T.PAT_CODE"ȯ�ڹ�ȣ"
    ,PAT_NAME"ȯ���̸�",PAT_BIRTH"�������",PAT_GENDER"����"
FROM TREAT T 
INNER JOIN DOCTOR D
    ON t.doc_code=d.doc_code
INNER JOIN department E
    ON D.dep_code=E.dep_code
INNER JOIN PATIENT P
    ON P.PAT_CODE=T.PAT_CODE
WHERE  T.TRT_YEAR=2013 AND T.TRT_DATE=0125
ORDER BY DEP_NAME ASC, DOC_NAME ASC , TRT_RECEIPT DESC ;



-- 4. 2���� ANSI �ڵ�� �ۼ��Ͻÿ�
SELECT TRT_DATE "��������",T.PAT_CODE"ȯ�ڹ�ȣ",PAT_NAME"ȯ���̸�"
    ,PAT_BIRTH"�������",PAT_GENDER"����",INP_YEAR , INP_DATE ,INP_TIME

FROM TREAT T
INNER JOIN PATIENT P
    ON T.pat_CODE = P.PAt_code
LEFT OUTER JOIN(SELECT * FROM INPATIENT WHERE INP_YEAR >=2014) I
    ON  I.pat_CODE = p.pat_code
WHERE T.TRT_YEAR='2013' AND T.TRT_DATE='1225'
ORDER BY T.TRT_TIME;
