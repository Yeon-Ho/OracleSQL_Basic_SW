-- CHAR(n) : ���� ���� ����
CREATE TABLE type_test_04(
    data1 CHAR,
    data2 CHAR(20),
    data3 CHAR(30 CHAR) );

DESC type_test_04;

INSERT INTO type_test_04
VALUES('Y','1234567890','���̻�����ĥ�ȱ���');

SELECT * FROM type_test_04;-- ��ȸ 