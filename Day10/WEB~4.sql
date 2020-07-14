--����
--	1.
--	MyBoard Table ����
--	  boardno NUMBER, title VARCHAR2(300)

CREATE TABLE myBoard(
    boardno NUMBER,
    title VARCHAR2(300)
);
CREATE SEQUENCE SEQ_MyBoard;

--2.
--AttachFile Table ����
--fileno NUMBER, boardno NUMBER, filename VARCHAR2(200)
--SEQ_AttachFile Sequence ����


CREATE TABLE attachFile(
    fileno NUMBER,
    boardno NUMBER,
    filename VARCHAR2(200)
);
CREATE SEQUENCE SEQ_AttachFile;

--	** �Խñ۰� ÷�������� ���踦 �������� PK,FK�� ������ ����
-- myboard PK
ALTER TABLE myBoard
ADD CONSTRAINT myboard_boardno_pk PRIMARY KEY (boardno);

-- attachfile PK
ALTER TABLE attachFile
ADD CONSTRAINT attachFile_fileno_pk PRIMARY KEY (fileno);

-- attachfile FK
ALTER TABLE attachFile
ADD CONSTRAINT attachfile_boardno_fk FOREIGN KEY (boardno)
    REFERENCES myBoard(boardno);

--	3. 
--	MyBoard TB�� �Խñ� INSERT
--	AttachFile TB�� ÷������ INSERT
--	�Խñ����� : �ȳ��ϼ���
--	÷�����ϸ� : Hello.jpg

INSERT INTO myboard (boardno , title)
		VALUES ( SEQ_MYBOARD.nextval , '�ȳ��ϼ���' );

INSERT INTO attachfile(fileno , boardno , filename)
    VALUES ( SEQ_AttachFile.nextval , SEQ_MYBOARD.currval , 'Hello.jpg');




SELECT * FROM myboard;
SELECT * FROM attachfile;

desc myboard;
desc attachfile;


SELECT m.boardno,title ,fileno , filename
FROM myboard M , attachfile A
WHERE m.boardno = a.boardno(+);


-- ��
CREATE OR REPLACE VIEW board_with_file
AS (
    SELECT m.boardno,title ,fileno , filename
    FROM myboard M , attachfile A
    WHERE m.boardno = a.boardno(+)
);

SELECT * FROM board_with_file
ORDER BY boardno, fileno NULLS LAST;