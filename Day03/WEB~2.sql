-- ���� �Լ� ����

-- 12.523 -> �Ҽ������� �ݿø�
SELECT round(12.523,0) FROM dual;
-- -12.723 -> �Ҽ������� �ݿø�
SELECT round(-12.723,0) FROM dual;
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
SELECT round(12.567,2) FROM dual;
-- 12345 -> 1�� �ڸ����� �ݿø�
SELECT round(12345,-1) FROM dual;
-- 56789 -> 10�� �ڸ����� �ݿø�
SELECT round(56789 ,-2) FROM dual;

-- 12.456 -> �Ҽ������� ����
SELECT trunc(12.456,0) FROM dual;
-- 12.456 -> �Ҽ��� 3°�ڸ����� ����
SELECT  trunc(12.456,2)FROM dual;
-- 12345 -> 1���ڸ����� ����
SELECT trunc(12345,-1) FROM dual;
-- 56789 -> 10���ڸ����� ����
SELECT trunc(56789,-2) FROM dual;

-- 13�� 8�� ���� ������
SELECT mod(13,8) FROM dual;

-- 12.345 �ø� -> 13
SELECT ceil(12.345) FROM dual;
-- -12.567 �ø� -> -12
SELECT Ceil(-12.567) FROM dual;
-- 12.567 ���� -> 12
SELECT floor(12.567) FROM dual;
-- 12.123 ���� -> 12
SELECT floor(12.123) FROM dual;
-- -12.567 ���� -> -13
SELECT floor(-12.567) FROM dual;
-- -12.123 ���� -> -13
SELECT floor(-12.123) FROM dual;

-- 3�� 4���� -> 81
SELECT power(3,4) FROM dual;
-- 3�� -1 ���� -> 0.33333333333
SELECT power(3,-1) FROM dual;

-- 9�� ������ -> 3
SELECT sqrt(9)FROM dual;
-- 11�� ������ -> 3.3166...
SELECT sqrt(11)FROM dual;

-- ����� 1 ,������-1 , 0�̸� 0 ��ȯ
SELECT sign(12) FROM dual;