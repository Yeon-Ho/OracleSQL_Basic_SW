-- VARCHAR2(n) : ����

CREATE TABLE type_test_02(
    data VARCHAR2(10) 
    );
DESC type_test_02; 

-- ������ �����غ��� , �������� �����ʹ�~??
-- '1234567890'
-- '123456789012345' --����
-- '���̻�����ĥ�ȱ���' --����
-- '���̻�'

INSERT INTO type_test_02(data)
VALUES ('1234567890');

INSERT INTO type_test_02(data)
VALUES ('123456789012345');-- �ȵ�

INSERT INTO type_test_02(data)
VALUES ('���̻�����ĥ�ȱ���'); -- �ȵ�

INSERT INTO type_test_02(data)
VALUES ('���̻�');

SELECT * FROM type_test_02;-- ��ȸ


CREATE TABLE type_test_03(
    data1 VARCHAR2(10 BYTE), --10 ����Ʈ
    data2 VARCHAR2(10 CHAR) -- 10�� ����
);

INSERT INTO type_test_03(data1,data2)
VALUES('���̻�' , '���̻�����ĥ�ȱ���');

INSERT INTO type_test_03(data1,data2)
VALUES('1234567890' ,'1234567890');

INSERT INTO type_test_03(data1,data2)
VALUES('1234567890' , '12345678901234567890'); -- ����

SELECT * FROM type_test_03;-- ��ȸ