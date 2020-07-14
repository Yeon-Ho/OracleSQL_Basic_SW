-- 삭제
-- 테이블 삭제
DROP table commentTb;
DROP table filetb;
DROP table board;
DROP table board_cate;
DROP table userTb;
DROP table report;
DROP table grade;


-- 회원테이블
CREATE TABLE userTb(
    userno NUMBER NOT NULL,
    userid VARCHAR2(50) NOT NULL,
    userpw VARCHAR2(100) NOT NULL,
    gender VARCHAR2(1),
    email VARCHAR2(100),
    phone VARCHAR2(11),
    grade NUMBER NOT NULL,
    report NUMBER NOT NULL
);
--테이블 정보 조회
DESC userTb;
-- PK
ALTER TABLE userTb
ADD CONSTRAINT userTb_userno_pk PRIMARY KEY (userno);
-------------------------------------------------------------------
--회원등급테이블
CREATE TABLE grade(
    grade NUMBER NOT NULL,
    gradename VARCHAR2(100) NOT NULL
);
--PK
ALTER TABLE grade
ADD CONSTRAINT grade_grade_pk PRIMARY KEY (grade);

-------------------------------------------------------------------
-- 회원 신고 테이블
CREATE TABLE report(
    report NUMBER NOT NULL,
    report_dat DATE NOT NULL,
    reprot_reason VARCHAR2(500) NOT NULL
);
--PK
ALTER TABLE report
ADD CONSTRAINT report_report_pk PRIMARY KEY (report);
-------------------------------------------------------------------

-- 게시판종류 테이블
CREATE TABLE board_cate(
    cateno NUMBER NOT NULL,
    cate_name VARCHAR2(100) NOT NULL,
    cate_date DATE NOT NULL
);
--PK
ALTER TABLE board_cate
ADD CONSTRAINT board_cate_cateno_pk PRIMARY KEY (cateno);
-------------------------------------------------------------------
-- 게시판 테이블
CREATE TABLE board(
    boardno NUMBER NOT NULL,
    cateno NUMBER NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    insert_dat DATE NOT NULL,
    update_dat DATE NOT NULL,
    hit NUMBER NOT NULL,
    has_file VARCHAR2(1) NOT NULL,
    userno NUMBER NOT NULL
);
--PK
ALTER TABLE board
ADD CONSTRAINT board_boardno_pk PRIMARY KEY (boardno);
-------------------------------------------------------------------
-- 첨부파일 테이블
CREATE TABLE filetb(
    fileno NUMBER NOT NULL,
    boardno NUMBER NOT NULL,
    filename VARCHAR2(500) NOT NULL,
    filepath VARCHAR2(500) NOT NULL,
    filesize NUMBER ,
    filetype VARCHAR2(20)
);
--PK
ALTER TABLE filetb
ADD CONSTRAINT filetb_fileno_pk PRIMARY KEY (fileno);

-------------------------------------------------------------------
-- 댓글 테이블
CREATE TABLE commentTb(
    commentno NUMBER NOT NULL,
    boardno NUMBER NOT NULL,
    userno NUMBER NOT NULL,
    content VARCHAR2(500),
    insert_dat DATE NOT NULL
);
--PK
ALTER TABLE commentTb
ADD CONSTRAINT commentTb_commentno_pk PRIMARY KEY (commentno);

-------------------------------------------------------------------
-- FK회원테이블
ALTER TABLE userTb
ADD CONSTRAINT userTb_grade_fk
    FOREIGN KEY ( grade )  --자기 테이블 FK
        REFERENCES grade( grade ); -- 참조 테이블 PK
-- FK회원테이블
ALTER TABLE userTb
ADD CONSTRAINT userTb_report_fk
    FOREIGN KEY ( report )  --자기 테이블 FK
        REFERENCES report( report ); -- 참조 테이블 PK
--FK게시판 테이블
ALTER TABLE board
ADD CONSTRAINT board_cateno_fk
    FOREIGN KEY ( cateno )  --자기 테이블 FK
        REFERENCES board_cate( cateno ); -- 참조 테이블 PK
--FK게시판 테이블
ALTER TABLE board
ADD CONSTRAINT board_userno_fk
    FOREIGN KEY ( userno )  --자기 테이블 FK
        REFERENCES userTb( userno ); -- 참조 테이블 PK
--FK첨부파일 테이블
ALTER TABLE filetb
ADD CONSTRAINT filetb_boardno_fk
    FOREIGN KEY ( boardno )  --자기 테이블 FK
        REFERENCES board( boardno ); -- 참조 테이블 PK
--FK댓글 테이블
ALTER TABLE commentTb
ADD CONSTRAINT commentTb_boardno_fk
    FOREIGN KEY ( boardno )  --자기 테이블 FK
        REFERENCES board( boardno ); -- 참조 테이블 PK
--FK댓글 테이블
ALTER TABLE commentTb
ADD CONSTRAINT commentTb_userno_fk
    FOREIGN KEY ( userno )  --자기 테이블 FK
        REFERENCES userTb( userno ); -- 참조 테이블 PK

------------------------------------------------------------

-- PK 있는지 확인
--SELECT * FROM user_constraints
--WHERE table_name = upper('grade'); 

-- 컬럼명 바꾸기
--ALTER TABLE grade RENAME COLUMN 등급명 TO gradename;
