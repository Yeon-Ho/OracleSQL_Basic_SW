-- FOREIGN KEY

 --PK가있는지 확인
SELECT * FROM user_constraints
WHERE table_name = upper('cons_12'); 

-- PK가 적용된 컬럼 확인
SELECT * FROM user_cons_columns
WHERE table_name = upper('cons_12');

CREATE TABLE cons_14(
    num NUMBER,
    data VARCHAR2(50),
    CONSTRAINT cons_14_FK   
        FOREIGN KEY ( num )  --자기 테이블 FK
        REFERENCES cons_12( no ) -- 참조 테이블 PK
);


CREATE TABLE cons_15(
    num NUMBER,
    data VARCHAR2(50)
);
ALTER TABLE cons_15
ADD CONSTRAINT cons_15_fk  
        FOREIGN KEY ( num )  --자기 테이블 FK
        REFERENCES cons_12( no ); -- 참조 테이블 PK


SELECT * FROM emp;
SELECT * FROM dept;
--DELETE dept;-- emp가 참조하고 있는 키가 있어서 삭제 불가!(2)
--DELETE emp;(1)
--UPDATE emp SET deptno = null; null로 만들어버리기 (1)

