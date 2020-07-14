--1. 2012년 1월 3일 내원환자 중 
-- 정형외과(코드:05xx)와 성형외과(코드:08xx)와 이비인후과(코드:13xx)
-- 환자조회
32	박환자
33	권이나
37	강성
42	지유
43	허민지

SELECT PAT_NAME FROM TREAT T,DOCTOR D ,PATIENT P
WHERE (TRT_YEAR = 2012 AND TRT_DATE = 0103)
    AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE)
    AND (DEP_CODE LIKE '05__' OR DEP_CODE LIKE '08__' OR DEP_CODE LIKE '13__');

--2. 2012년 1월 3일 내원환자 중 내원 진료시간이 09:00 ~ 12:00 이고
-- 진료과가 정형외과(코드:05xx)와 성형외과(코드:08xx)와 이비인후과(코드:13xx)
-- 가 아닌 환자조회
30	권환자
35	황환자
39	고기리
40	유희애

SELECT PAT_NAME FROM TREAT T , DOCTOR D ,PATIENT P
WHERE TRT_YEAR = 2012 AND TRT_DATE = 0103 
    AND TRT_TIME BETWEEN 0900 AND 1200
     AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE)
    AND (DEP_CODE NOT LIKE '05__' AND DEP_CODE NOT LIKE '08__' AND DEP_CODE NOT LIKE '13__');


--3. 2014년 1월 1일 내원환자 중 5명만 출력
-- (진료시간순서 상 마지막 진료환자 5명)

5	오대식
19	우별희
21	송주희
24	차은비
27	안성댁

SELECT * FROM(
SELECT rownum rnum, PAT_NAME FROM TREAT T , DOCTOR D ,PATIENT P
WHERE TRT_YEAR = 2014 AND TRT_DATE = 0101 
     AND (T.DOC_CODE = D.DOC_CODE)
    AND (P.PAT_CODE = T.PAT_CODE))
    WHERE rnum BETWEEN 9 AND 13;

