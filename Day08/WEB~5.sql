-- CHECK
CREATE TABLE cons_06(
--    data NUMBER CHECK( data>=1 AND data <=100) );
    data NUMBER CHECK( data BETWEEN 1 AND 100) );
    
--�ڷ����
SELECT * FROM user_constraints
WHERE table_name = upper('cons_06');

SELECT * FROM user_cons_columns
WHERE constraint_name = upper('SYS_C007031');

--���̺� ���� ��ȸ
DESC cons_01;
DESC cons_06;

--�׽�Ʈ ����
INSERT INTO cons_06
VALUES ( 30 );

INSERT INTO cons_06
VALUES ( 200 ); -- �������� ������ �����. ����!

-- cons_07 ���̺� ����
--  �÷� : data NUMBER

-- ALTER TABLE ������ �̿��Ͽ� data��
-- ������� CHECK �߰��ϱ�
-- 1000,2000,3000,4000 �� �Է� �����ϵ��� �����;
CREATE TABLE cons_07(
    data NUMBER);

DESC cons_07;

SELECT * FROM user_constraints
WHERE table_name = upper('cons_07');

-- �������� �߰�
ALTER TABLE cons_07
ADD CONSTRAINT cons_07_uk
    CHECK(data IN(1000,2000,3000,4000));

-- �������� ����
ALTER TABLE cons_07
DROP CONSTRAINT SYS_C007050;

-- �������� ����
ALTER TABLE cons_07
MODIFY data CHECK(data IN(1000,2000,3000,4000));


-- DEFAULT
CREATE TABLE cons_08(
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10));

-- ������� �ڷ������ DEFAULT ������ ������ ����    
SELECT * FROM user_constraints
WHERE table_name = upper('cons_08');

-- ���̺� �÷� �� ���� �ڷ����
SELECT * FROM user_tab_columns
WHERE table_name = upper('cons_08');

ALTER TABLE cons_08
MODIFY data2 DEFAULT sysdate;

ALTER TABLE cons_08
MODIFY data3 DEFAULT 'HI' NOT NULL;

-- ��������� null�� INSERT�ϸ� DEFAULT�� �������� �ʴ´�.
INSERT INTO cons_08
VALUES ( null , null ,'AA');

SELECT * FROM cons_08;

INSERT INTO cons_08(data1)
VALUES ( 6666 ) ; -- �ٸ��÷��� ���� ���γ����ʾ����� DEFAULT�� ����


-- DEFAULT ���ǻ���
INSERT INTO cons_08; -- �ȵ� , VALUES �� ����
INSERT INTO cons_08 VALUES (); -- �ȵ� , ������ �־����
-- ��� �÷��� DEFAULT�� �ѹ��� ���۵ǰ� �ϴ� ����� ����