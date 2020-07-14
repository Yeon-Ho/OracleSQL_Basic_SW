--1. 2013년 1월 25일 내원한 환자중 다음의 정보조회
-- 진료과명, 진료의사명, 접수시간, 환자번호, 환자이름, 생년월일, 성별
--(진료과, 진료의, 접수시간으로 내림차순 정렬)

SELECT DEP_NAME"진료과이름",DOC_NAME "의사이름"
    ,TRT_RECEIPT"접수시간",T.PAT_CODE"환자번호"
    ,PAT_NAME"환자이름",PAT_BIRTH"생년월일",PAT_GENDER"성별"
FROM TREAT T ,DOCTOR D, department E ,PATIENT P
WHERE  T.TRT_YEAR=2013 
    AND T.TRT_DATE=0125
    AND t.doc_code=d.doc_code
    AND D.dep_code=E.dep_code
    AND P.PAT_CODE=T.PAT_CODE
ORDER BY DEP_NAME ASC, DOC_NAME ASC , TRT_RECEIPT DESC ;


--2. 2013년 12월 25일 내원한 환자의 다음 정보조회
--내원일자, 환자번호, 환자이름, 생년월일, 성별
--*단 2014년 이후로 입원했던적이 있다면 입원일자, 입원시간도 출력
--(진료시간 기준 정렬)
-- OUTER JOIN (+)
SELECT TRT_DATE "내원일자",T.PAT_CODE"환자번호",PAT_NAME"환자이름"
    ,PAT_BIRTH"생년월일",PAT_GENDER"성별",INP_YEAR , INP_DATE ,INP_TIME
FROM TREAT T, PATIENT P,(SELECT * FROM INPATIENT WHERE INP_YEAR >=2014) I
        WHERE T.TRT_YEAR='2013' AND T.TRT_DATE='1225'
        AND T.pat_CODE = P.PAt_code
        AND I.pat_CODE(+) = p.pat_code
        ORDER BY T.TRT_TIME;


-- 3. 1번을 ANSI 코드로 작성하시오

SELECT DEP_NAME"진료과이름",DOC_NAME "의사이름"
    ,TRT_RECEIPT"접수시간",T.PAT_CODE"환자번호"
    ,PAT_NAME"환자이름",PAT_BIRTH"생년월일",PAT_GENDER"성별"
FROM TREAT T 
INNER JOIN DOCTOR D
    ON t.doc_code=d.doc_code
INNER JOIN department E
    ON D.dep_code=E.dep_code
INNER JOIN PATIENT P
    ON P.PAT_CODE=T.PAT_CODE
WHERE  T.TRT_YEAR=2013 AND T.TRT_DATE=0125
ORDER BY DEP_NAME ASC, DOC_NAME ASC , TRT_RECEIPT DESC ;



-- 4. 2번을 ANSI 코드로 작성하시오
SELECT TRT_DATE "내원일자",T.PAT_CODE"환자번호",PAT_NAME"환자이름"
    ,PAT_BIRTH"생년월일",PAT_GENDER"성별",INP_YEAR , INP_DATE ,INP_TIME

FROM TREAT T
INNER JOIN PATIENT P
    ON T.pat_CODE = P.PAt_code
LEFT OUTER JOIN(SELECT * FROM INPATIENT WHERE INP_YEAR >=2014) I
    ON  I.pat_CODE = p.pat_code
WHERE T.TRT_YEAR='2013' AND T.TRT_DATE='1225'
ORDER BY T.TRT_TIME;
