-- �����Լ�
-- length()
SELECT
    length('Apple') len1 ,
    length('�ȳ�') len2 ,
    length('Hello ����Ŭ') len3
FROM dual;

-- lengthb()  b�� byte�� ����  ,�ѱ��� �ѱ��ڴ� 3byte
SELECT
    lengthb('Apple') len1 ,
    lengthb('�ȳ�') len2 ,
    lengthb('Hello ����Ŭ') len3
FROM dual;

-- ĳ���ͼ�(���ڵ�) Ȯ��
SELECT * FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

