--1. 성별이 남자인 오씨성을 가진 환자 조회
4	오환자2
5	오대식
6	오창규
7	오환자3
--내꺼
SELECT * FROM PATIENT
WHERE PAT_NAME LIKE '오%' AND PAT_GENDER ='M' ;
--T
SELECT * FROM PATIENT
WHERE substr(PAT_NAME,0,1) = '오' AND PAT_GENDER='M';

--2. 성별이 남자인 오씨성을 가진 환자중 1979년생이 아닌 조회
5	오대식
6	오창규
--내꺼
SELECT * FROM PATIENT
WHERE PAT_GENDER ='M' AND PAT_NAME LIKE '오%' 
    AND PAT_BIRTH NOT BETWEEN 19790101 AND 19791231;
--T
SELECT * FROM PATIENT
WHERE PAT_GENDER = 'M'
    AND substr(PAT_NAME,0,1) = '오'
    AND substr(PAT_BIRTH,0,4) != 1979;


--3. 생년월일이 1980년생 부터 1989년생 까지 환자 중 여자만 조회
1	오환자1
3	박환자
23	김성희
24	차은비
25	차은희
42	지유
-- 내꺼 , T 일치
SELECT * FROM PATIENT
WHERE PAT_GENDER ='F' 
    AND PAT_BIRTH BETWEEN 19800101 AND 19891231;


--4. 환자이름이 4자이며 '오성'으로 끝나는 환자 중 생년월일이 2004년생 남자 환자만 조회
13	남궁오성
--내꺼
SELECT * FROM PATIENT
WHERE PAT_GENDER ='M' AND PAT_NAME LIKE '__오성'
    AND PAT_BIRTH BETWEEN 20040101 AND 20041231;


--5. 2000년생 여자 중 이름 뒤 두글자가 '환자'로 끝나지 않는 환자조회
28	한아름
SELECT * FROM PATIENT
WHERE PAT_GENDER ='F' AND PAT_NAME NOT LIKE '__환자'
    AND PAT_BIRTH BETWEEN 20000101 AND 20001231;


--6. 환자이름이 4자인사람 중에 휴대폰 번호가 등록되어있지 않은 환자조회
4	오환자2
7	오환자3
45	황보희라
SELECT * FROM PATIENT
WHERE PAT_NAME LIKE '____'
    AND PAT_TEL IS NULL;