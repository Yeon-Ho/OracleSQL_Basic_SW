-- 문자함수 문제

-- 'hELlo' 모두 대문자로 변환 -> HELLO
SELECT upper('hELlo') FROM dual;
-- 'hELlo' 모두 소문자로 변환 -> hello
SELECT lower('heLlo') FROM dual;
-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello  (Initial Capital)
SELECT initcap('hELlo') FROM dual;

SELECT * FROM tabs
WHERE table_name = upper('EMP');  --항상 대문자로 사용!

-- 'Alice Bob'의 문자열 길이 -> 9
SELECT length('Alice Bob') FROM dual;
-- '안녕하세요'의 문자열 길이 -> 5
SELECT length('안녕하세요') FROM dual;

-- 'Alice Bob' 문자열 바이트 수 -> 9
SELECT lengthb('Alice Bob') FROM dual;
-- 'ACE 안녕하세요'문자열 바이트 수 -> 19
SELECT lengthb('ACE 안녕하세요') FROM dual;
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다) ACE 3 +  1 + 안녕하세요 15

-- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
SELECT instr('ABCDEFGHI','D') FROM dual;
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
SELECT instr('ABCDEFGHI','DEF') FROM dual;
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
SELECT instr('ABCDEFGHI','DF') FROM dual; --없다라고 할때는 0
-- '안녕하세요'에서 '하'문자열의 위치 -> 3
SELECT instr('안녕하세요','하') FROM dual;
SELECT instrb('안녕하세요','하') FROM dual; -- 한글자당 3byte 7부터시작이니까 7반환
-- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3 -- 찾은게 여러개여도 처음찾은거 반환
SELECT instr('ABCABCDDD','C') FROM dual;

--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
SELECT substr('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
SELECT substr('Oracle SQL Developer',6,5) FROM dual;
--'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
SELECT substr('오라클 SQL',3,5) FROM dual;
SELECT substrb('오라클 SQL',3,5) FROM dual; -- 빈칸으로 
--'안녕하세요오라클'에서 3번째 부터 자르기
SELECT substr('안녕하세요오라클',0,2) FROM dual;
SELECT substr('안녕하세요오라클',3) FROM dual;

------------------------------------------------------------------------------------
SELECT substr('fk@na.com',1) FROM dual;
SELECT instr('fk@na.com','@') FROM dual;
SELECT replace('fk@na.com','@','오') FROM dual;

SELECT
    substr('안녕하세요오라클',0,2) || ' is ' || substr('안녕하세요오라클',6) 문자붙이기
FROM dual;

