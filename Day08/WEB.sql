--2020-03-31
-- DATE
CREATE TABLE type_test_05(
    data DATE
);

INSERT INTO type_test_05
VALUES (sysdate); -- �ð� ���� trunc�Լ� ����������� ����ϱ�

INSERT INTO type_test_05
VALUES ('2020/11/21'); -- �ڵ�����ȯ

-- �⵵�� ������ ����� ������ �ܵ����� ���Ұ�
INSERT INTO type_test_05
VALUES ('-2020/11/21'); -- �⵵�� ������ ����� ������ �ܵ����� ���Ұ�

-- to_date �� ���� s �� ��¥�� ���Ե� ��ȣ�� �ν��Ѵ�.
INSERT INTO type_test_05
VALUES (to_date('-2020/11/21','syyyy/mm/dd'));--���Ĺ��ڿ� s ���̱�


SELECT * FROM type_test_05; --��ȸ

-- to_char������ ��ȸ 
SELECT to_char(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05;


INSERT INTO type_test_05
VALUES (to_date('12/7/9','yy/mm/dd') ); -- 2012�⵵
INSERT INTO type_test_05
VALUES (to_date('12/7/9','rr/mm/dd') ); -- ����!

-- �⵵ 2000������� , 1900 �⵵���� 
INSERT INTO type_test_05
VALUES (to_date('94/7/9','yy/mm/dd') ); -- 2094�⵵
INSERT INTO type_test_05
VALUES (to_date('94/7/9','rr/mm/dd') ); -- 1994�⵵

INSERT INTO type_test_05
VALUES (to_date('83/2/1','rr/mm/dd') ); -- 1983�⵵
INSERT INTO type_test_05
VALUES (to_date('83/2/1','yy/mm/dd') ); -- 2083�⵵


SELECT * FROM type_test_05; --��ȸ
SELECT to_char(data,'yyyy/mm/dd') FROM type_test_05; --��ȸ.
