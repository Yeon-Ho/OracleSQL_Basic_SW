-- scott/tiger 접속...

-- 사용자계정의 테이블 조회
-- (tabs 자료사전)
SELECT * FROM tabs;

-- 테이블의 구조(스키마) 간단히 확인
DESC emp;

-- 데이블의 데이터 확인
SELECT * FROM emp;

-- 주석 , Comment
-- 한줄 주석 단축키 : ctrl + /

-- SELECT 구문
-- 전체 컬럼 조회
select * FROM emp;
select * From dept;
select * FROM salgrade;
select * FROM bonus;

SELECT *
FROM bonus;

-- 부분 컬럼(지정한 컬럼) 조회
SELECT 
    empno , ename ,job 
FROM emp;

-- 조회되는 컬럼명에 별칭(Alias)을 적용하기 
-- 데이터원본은 건들지않고 ,보일때 바꿔서 나온다.
SELECT 
    empno AS "사번", --사원번호
    ename "이름" --사원이름
FROM emp;

DESC emp;
SELECT empno ,ename ,job , mgr FROM emp;
SELECT * FROM emp;

-- WHERE 절 (조건절)

-- 영업사원들만 조회하기
SELECT * FROM emp
WHERE job = 'SALESMAN';

-- 전체 사원들 중 급여가 2000이 넘는 사원
SELECT * FROM emp
WHERE sal > 2000;

-- 급여가 2500이 넘고 관리자가 아닌 사원
SELECT * FROM emp
WHERE sal > 2500 
--   AND job <> 'MANAGER';
   AND NOT(job = 'MANAGER');  -- 위 문장이랑 같은 말
   

-- BETWEEN a AND b
-- 사원번호가 7700 ~ 7900인 사원 조회
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;

-- 사원이름이 'ALLEN' ~ 'KING' 사이인 사원 조회
SELECT empno , ename FROM emp
 WHERE ename BETWEEN 'ALLEN' AND 'KING';
--WHERE NOT(ename BETWEEN 'ALLEN' AND 'KING');
--WHERE ename NOT BETWEEN 'ALLEN' AND 'KING';

-- IN(list)
SELECT empno , ename FROM emp
WHERE empno IN(7369,7521,7654,7777, 8888,7878);
 
-- NOT IN(list)
SELECT empno , ename FROM emp
WHERE NOT (empno IN(7369,7521,7654,7777, 8888,7878));

SELECT empno , ename FROM emp
WHERE empno NOT IN(7369,7521,7654,7777, 8888,7878);

-- IN(문자형)
SELECT empno , ename FROM emp
WHERE ename IN( 'SMITH','ALLEN','KING','JANG');

-- LIKE
SELECT empno , ename FROM emp
--WHERE ename LIKE '%R%'; -- 이름에 R을 포함하는 사원
--WHERE ename LIKE '_A%'; -- 이름의 두번째가 A인 사원
--WHERE ename LIKE '%RD'; -- 이름이 RD로 끝나는 사원
WHERE ename NOT LIKE '%R%'; --이름에 R을 포함하지 않는 사원

-- 주의사항 
-- LIKE연산자와 IN연산자를 같이 사용하는 문법은 없다.
SELECT empno,ename FROM emp
--WHERE ename LIKE IN('%R%' , '%L%');  -- LIKE 와 IN은 따로해야한다
WHERE ename LIKE '%R%'
    OR ename LIKE '%L%';

-- 서식없이 동등비교(equal)를 할때에는
-- LIKE연산자를 사용하면 안된다( Full - Scan 발생한다.)
SELECT empno , ename FROM emp
--WHERE empno LIKE '7654';
WHERE empno = '7654'; -- 동등비교할때는 무조건 = 사용하자

-- IS NULL  , = 연산자는 쓰면 안됀다.
SELECT * FROM emp
-- WHERE mgr = null; --조회되지 않는다.
WHERE comm IS NULL;
--WHERE comm IS NOT NULL;


