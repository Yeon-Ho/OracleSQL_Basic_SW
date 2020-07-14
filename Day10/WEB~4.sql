--문제
--	1.
--	MyBoard Table 생성
--	  boardno NUMBER, title VARCHAR2(300)

CREATE TABLE myBoard(
    boardno NUMBER,
    title VARCHAR2(300)
);
CREATE SEQUENCE SEQ_MyBoard;

--2.
--AttachFile Table 생성
--fileno NUMBER, boardno NUMBER, filename VARCHAR2(200)
--SEQ_AttachFile Sequence 생성


CREATE TABLE attachFile(
    fileno NUMBER,
    boardno NUMBER,
    filename VARCHAR2(200)
);
CREATE SEQUENCE SEQ_AttachFile;

--	** 게시글과 첨부파일이 관계를 가지도록 PK,FK를 적절히 설정
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
--	MyBoard TB에 게시글 INSERT
--	AttachFile TB에 첨부파일 INSERT
--	게시글제목 : 안녕하세요
--	첨부파일명 : Hello.jpg

INSERT INTO myboard (boardno , title)
		VALUES ( SEQ_MYBOARD.nextval , '안녕하세요' );

INSERT INTO attachfile(fileno , boardno , filename)
    VALUES ( SEQ_AttachFile.nextval , SEQ_MYBOARD.currval , 'Hello.jpg');




SELECT * FROM myboard;
SELECT * FROM attachfile;

desc myboard;
desc attachfile;


SELECT m.boardno,title ,fileno , filename
FROM myboard M , attachfile A
WHERE m.boardno = a.boardno(+);


-- 뷰
CREATE OR REPLACE VIEW board_with_file
AS (
    SELECT m.boardno,title ,fileno , filename
    FROM myboard M , attachfile A
    WHERE m.boardno = a.boardno(+)
);

SELECT * FROM board_with_file
ORDER BY boardno, fileno NULLS LAST;