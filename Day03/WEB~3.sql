-- 문자함수
-- length()
SELECT
    length('Apple') len1 ,
    length('안녕') len2 ,
    length('Hello 오라클') len3
FROM dual;

-- lengthb()  b는 byte의 약자  ,한글은 한글자당 3byte
SELECT
    lengthb('Apple') len1 ,
    lengthb('안녕') len2 ,
    lengthb('Hello 오라클') len3
FROM dual;

-- 캐릭터셋(인코딩) 확인
SELECT * FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';

