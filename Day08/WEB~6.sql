 -- PRIMARY KEY(�÷�����) �÷����� �̸�����
 CREATE TABLE cons_09(
    no NUMBER CONSTRAINT cons_09_pk PRIMARY KEY,
    data VARCHAR2(20) NOT NULL
 );

-- �̸� ���� �����̸Ӹ�Ű(�÷�����)
 CREATE TABLE cons_10(
    no NUMBER PRIMARY KEY,  
    data VARCHAR2(20) NOT NULL
 );
 
 -- �������� �̸��� �����̸Ӹ�Ű ����(�÷�����)
 CREATE TABLE cons_11(
    no NUMBER,
    data VARCHAR2(20) NOT NULL,
    CONSTRAINT cons_11_pk PRIMARY KEY(no)
 );

-- ���̺� ����� ALTER�� (���̺���)
CREATE TABLE cons_12(
    no NUMBER,
    data VARCHAR2(20) NOT NULL
 );
ALTER TABLE cons_12
ADD CONSTRAINT cons_12_pk PRIMARY KEY (no);


SELECT * FROM user_constraints
WHERE table_name = upper('cons_13');


-- ����Ű , PRIMARY KEY�� �������� �÷����� �����ϱ�
CREATE TABLE cons_13(
    trade_date DATE,
    trade_no NUMBER);

-- �÷� ��� �����̸Ӹ�Ű�� ����
ALTER TABLE cons_13
ADD CONSTRAINT cons_13_pk
    PRIMARY KEY(trade_date, trade_no);

-- �����̸Ӹ�Ű ����
ALTER TABLE cons_13
DROP CONSTRAINT cons_13_pk;
