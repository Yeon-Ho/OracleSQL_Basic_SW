-- NUMBER
CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5)
);
DESC type_test_01;

-- data1 : NUMBER
INSERT INTO type_test_01 (data1)
VALUES ( 1111111111222222222233333333334444444444 );
INSERT INTO type_test_01 (data1)
VALUES ( 11111111112222222222333333333344444444445555555555 );

SELECT data1 FROM type_test_01;--��ȸ


-- data2 : NUMBER(10)
INSERT INTO type_test_01 (data2)
VALUES ( 12345 );

--INSERT INTO type_test_01 (data2)
--VALUES ( 12345678901234567890 ); -- ���� ,�ȵ� 10�ڸ��� �Ѿ

INSERT INTO type_test_01 (data2)
VALUES ( 1234.5678 );-- �Ҽ��� ���� �ݿø�

SELECT data2 FROM type_test_01; -- ��ȸ


-- data3 : NUMBER(5,2)
INSERT INTO type_test_01(data3)
VALUES ( 23.56 );

INSERT INTO type_test_01(data3)
VALUES ( 23.5678 ); -- �Ҽ��� 3��¥�� �ݿø� �ȴ�.

INSERT INTO type_test_01(data3)
VALUES ( 1234.56 ); -- ���� , ������ �ڸ� �ʹ� ����

INSERT INTO type_test_01(data3)
VALUES ( 34.5 ); -- �� �Ҽ���2�ڸ��� ä���� �ʾƵ��ȴ�.

SELECT data3 FROM type_test_01 WHERE data3 IS NOT NULL; -- ��ȸ


-- data4 : NUMBER(4,5) - 0.0xxxx 
INSERT INTO type_test_01(data4)
VALUES ( 1234 ); -- �ȵ�  , ���� �Է� �Ұ�

INSERT INTO type_test_01(data4)
VALUES ( 0.1234 ); -- �ȵ� , �Ҽ��� ù°�ڸ��� 0�̾���Ѵ�.

INSERT INTO type_test_01(data4)
VALUES ( 0.012 ); -- ����, �Ҽ���4�ڸ��� ��ä���ʿ�� ����.

INSERT INTO type_test_01(data4)
VALUES ( 0.0123456789 ); -- ���� , �Ѵ� �ڸ� �ݿø� �ȴ�.

SELECT data4 FROM type_test_01 WHERE data4 IS NOT NULL; -- ��ȸ

--SELECT * FROM type_test_01;-- ��ü ��ȸ