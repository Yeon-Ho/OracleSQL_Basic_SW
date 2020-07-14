--1. 2014년 1월 2일 내원환자 전체 정보조회
--   환자번호, 환자이름, 생년월일, 성별, 진료의사명, 진료과명
-- 스칼라 서브쿼리로 표현

SELECT    T.PAT_CODE 환자번호 
    ,(SELECT PAT_NAME FROM patient P WHERE p.pat_code=T.pat_code) 환자이름 
    ,(SELECT pat_birth FROM patient P WHERE p.pat_code=T.pat_code) 생년월일
    ,(SELECT pat_gender FROM patient P WHERE p.pat_code=T.pat_code) 성별
    ,(SELECT DOC_NAME FROM DOCTOR D WHERE D.DOC_CODE = T.DOC_CODE)"의사이름"
    ,(SELECT DEP_NAME FROM department F WHERE F.dep_code = P.dep_code) "진료과명"
FROM TREAT T , DOCTOR P 
WHERE TRT_YEAR = '2014' AND TRT_DATE = '0102'
    AND t.doc_code = p.doc_code
    ORDER BY T.PAT_CODE;
    

--2.2014년 1월 2일 내원환자 중 부서테이블을 WHERE 절 SubQuery를 
--사용하여 조회
--   환자번호, 환자이름, 생년월일, 성별, 진료의사명, 진료과명

-- 단 외과계열 환자만조회('02xx')
-- where절 subquery

SELECT T.PAT_CODE 환자번호,PAT_NAME 환자이름,P.pat_birth 생년월일
    ,P.PAT_GENDER 성별, d.doc_name 의사이름 , de.dep_name 진료과이름
FROM TREAT T 
INNER JOIN patient P
    ON t.pat_code = p.pat_code
INNER JOIN DOCTOR D
    ON t.doc_code = d.doc_code
INNER JOIN department DE
    ON d.dep_code = de.dep_code
WHERE TRT_YEAR IN (2014)
    AND TRT_DATE IN(0102)
    AND d.dep_code IN( SELECT dep_code FROM department WHERE dep_code LIKE '02__')
    ORDER BY T.PAT_CODE;