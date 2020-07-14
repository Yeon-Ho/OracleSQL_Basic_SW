--COUNT
SELECT * FROM emp;
SELECT count(*)cnt FROM emp;

SELECT empno FROM emp;
SELECT count(empno) cnt_ename FROM emp;

SELECT mgr FROM emp; --12개의 데이터가 있지만 null값을 하나 가지고있다.
SELECT count(mgr) FROM emp; --그래서 count쓰면 null값은 제외한다.

SELECT comm FROM emp ORDER BY comm; -- 0도 값을 가지고있다고 생각
SELECT count(comm) FROM emp;

SELECT * FROM emp;
SELECT 1 FROM emp; 
SELECT count(*) FROM emp;
SELECT count(1) FROM emp; --굳이 이렇게 쓸필요없다.

-- SUM 
SELECT sum(sal) tot_sal FROm emp;

-- AVG
SELECT round(avg(sal),2) avg_sal FROM emp;

-- MAX
SELECT max(sal) max_sal FROM emp;

--MIN
SELECT min(sal) min_sal FROM emp;

SELECT max(ename) FROM emp; -- 사전순서 

SELECT
    max(hiredate),
    min(hiredate)
FROM emp;                   -- 날짜도

SELECT * FROM emp
ORDER BY deptno;

-- 전체 sal에 대한 합계
SELECT sum(sal) FROM emp;

-- 부서별 급여 합계
SELECT 
    deptno,
    sum(sal)
FROM emp  
GROUP BY deptno 
ORDER BY deptno; 

-- 부서별 인원수
SELECT
    deptno,
    count(*) cnt
FROM emp
GROUP BY deptno;

SELECT
    deptno,
    job
FROM emp
ORDER BY deptno,job;

-- 부서별 + 직무별 사원 수
SELECT
    deptno,
    job,
    count(*) cnt  -- 30번부서에 SALESMAN 인원 4명
FROM emp
GROUP BY deptno , job 
ORDER BY deptno , job; 

--의미없는 코드 (ename)
SELECT
    deptno,job, ename,
    count(*) cnt  -- 30번부서에 SALESMAN 인원 4명
FROM emp
GROUP BY deptno , job ,ename -- 그룹바이를쓰려면 컬럼수와 같아야 댄다
ORDER BY deptno , job;

