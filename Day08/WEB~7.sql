-- FOREIGN KEY

 --PK���ִ��� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = upper('cons_12'); 

-- PK�� ����� �÷� Ȯ��
SELECT * FROM user_cons_columns
WHERE table_name = upper('cons_12');

CREATE TABLE cons_14(
    num NUMBER,
    data VARCHAR2(50),
    CONSTRAINT cons_14_FK   
        FOREIGN KEY ( num )  --�ڱ� ���̺� FK
        REFERENCES cons_12( no ) -- ���� ���̺� PK
);


CREATE TABLE cons_15(
    num NUMBER,
    data VARCHAR2(50)
);
ALTER TABLE cons_15
ADD CONSTRAINT cons_15_fk  
        FOREIGN KEY ( num )  --�ڱ� ���̺� FK
        REFERENCES cons_12( no ); -- ���� ���̺� PK


SELECT * FROM emp;
SELECT * FROM dept;
--DELETE dept;-- emp�� �����ϰ� �ִ� Ű�� �־ ���� �Ұ�!(2)
--DELETE emp;(1)
--UPDATE emp SET deptno = null; null�� ���������� (1)

