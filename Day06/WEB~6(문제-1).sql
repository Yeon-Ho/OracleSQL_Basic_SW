--1. ������ ������ �������� ���� ȯ�� ��ȸ
4	��ȯ��2
5	�����
6	��â��
7	��ȯ��3
--����
SELECT * FROM PATIENT
WHERE PAT_NAME LIKE '��%' AND PAT_GENDER ='M' ;
--T
SELECT * FROM PATIENT
WHERE substr(PAT_NAME,0,1) = '��' AND PAT_GENDER='M';

--2. ������ ������ �������� ���� ȯ���� 1979����� �ƴ� ��ȸ
5	�����
6	��â��
--����
SELECT * FROM PATIENT
WHERE PAT_GENDER ='M' AND PAT_NAME LIKE '��%' 
    AND PAT_BIRTH NOT BETWEEN 19790101 AND 19791231;
--T
SELECT * FROM PATIENT
WHERE PAT_GENDER = 'M'
    AND substr(PAT_NAME,0,1) = '��'
    AND substr(PAT_BIRTH,0,4) != 1979;


--3. ��������� 1980��� ���� 1989��� ���� ȯ�� �� ���ڸ� ��ȸ
1	��ȯ��1
3	��ȯ��
23	�輺��
24	������
25	������
42	����
-- ���� , T ��ġ
SELECT * FROM PATIENT
WHERE PAT_GENDER ='F' 
    AND PAT_BIRTH BETWEEN 19800101 AND 19891231;


--4. ȯ���̸��� 4���̸� '����'���� ������ ȯ�� �� ��������� 2004��� ���� ȯ�ڸ� ��ȸ
13	���ÿ���
--����
SELECT * FROM PATIENT
WHERE PAT_GENDER ='M' AND PAT_NAME LIKE '__����'
    AND PAT_BIRTH BETWEEN 20040101 AND 20041231;


--5. 2000��� ���� �� �̸� �� �α��ڰ� 'ȯ��'�� ������ �ʴ� ȯ����ȸ
28	�ѾƸ�
SELECT * FROM PATIENT
WHERE PAT_GENDER ='F' AND PAT_NAME NOT LIKE '__ȯ��'
    AND PAT_BIRTH BETWEEN 20000101 AND 20001231;


--6. ȯ���̸��� 4���λ�� �߿� �޴��� ��ȣ�� ��ϵǾ����� ���� ȯ����ȸ
4	��ȯ��2
7	��ȯ��3
45	Ȳ�����
SELECT * FROM PATIENT
WHERE PAT_NAME LIKE '____'
    AND PAT_TEL IS NULL;