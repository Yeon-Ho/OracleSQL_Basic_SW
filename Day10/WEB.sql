-- 인덱스 , INDEX

-- 인덱스 자료사전
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

-- 인덱스 컬럼 자료사전
SELECT * FROM user_ind_columns
WHERE TABLE_NAME = upper('emp');

-- 인덱스 조회 , salgrade테이블
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade'); --조회없음
--내부구조 확인
SELECT * FROM salgrade;

--인덱스 생성 , NONUNIQUE(중복값허용)
CREATE INDEX idx_salgrade
ON salgrade( grade );-- NONUNIQUE(중복값허용)

-- 다시 인덱스 조회
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade'); 

-- 인덱스가 중복되는 값으로 데이터 삽입
INSERT INTO salgrade VALUES ( 1 , 10000 , 15000);

-- 확인
SELECT * FROM salgrade;

-- 인덱스 재생성 구문
ALTER INDEX idx_salgrade REBUILD;

-- 인덱스 삭제
DROP INDEX idx_salgrade;


-- UNIQUE 인덱스 생성 , 이미 중복값이 있어서 안댄다
CREATE UNIQUE INDEX idx_salgrade ON salgrade( grade );
-- 이미 중복값이 있어서 안댄다

SELECT * FROM salgrade
WHERE grade = 5 AND losal = 10000;

-- 업데이트로 5의중복값중 하나를 변경!
UPDATE salgrade set grade = 6
WHERE grade = 5 AND losal = 10000;

-- UNIQUE 인덱스 생성 , 중복데이터 없어서 가능!
CREATE UNIQUE INDEX idx_salgrade ON salgrade( grade );

-- 자료사전 조회
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('salgrade');


--삽입 불가능 
INSERT INTO salgrade VALUES ( 4 ,10202 ,111005);

-- emp테이블 부서별 조회
SELECT * FROM emp
WHERE deptno = 30;

-- NONUNIQUE 인덱스 생성
CREATE INDEX idx_empdept ON emp (deptno);

-- 자료사전 조회
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

-- 부서 내 이름으로 조회
SELECT * FROM emp
WHERE deptno = 10
    AND ename = 'MILLER';

-- 복합 컬럼 인덱스 ( COMPOSITE UNIQUE INDEX)
CREATE UNIQUE INDEX idx_emp_depno_ename
ON emp ( deptno , ename );

-- 자료사전 확인
SELECT * FROM user_indexes
WHERE TABLE_NAME = upper('emp');

SELECT * FROM user_ind_columns
WHERE TABLE_NAME = upper('emp')
ORDER BY INDEX_NAME , COLUMN_POSITION;


