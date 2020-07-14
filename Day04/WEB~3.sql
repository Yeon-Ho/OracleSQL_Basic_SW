-- 조회 컬럼(문제)
-- deptno , dname , cnt , tot_sal , avg_sal

-- dname -> 한글로
-- cnt , tot_sal, avg_sal -> 부서별 통계
-- avg_sal -> 소수점 2자리까지

SELECT 
    deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname,
    count(*)cnt,
    sum(sal)tot_sal,
    round(avg(sal),2)avg_sal
FROM emp
GROUP BY deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END 
ORDER BY deptno;

-- WHERE절에는 그룹함수를 사용할 수 없다.
SELECT 
    deptno,
    round(avg(sal),2)avg_sal
FROM emp
--WHERE avg(sal)>2000   --
GROUP BY deptno 
HAVING avg(sal) > 2000  -- WHERE 대신 HAVING 절을 사용해야한다.
ORDER BY deptno;
