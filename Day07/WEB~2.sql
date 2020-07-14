-- UPDATE 
SELECT * FROM emp
-- UPDATE emp SET ename = 'Mc' , job = 'Donald'
WHERE empno = 1001;
--commit; 커밋, 데이터 변경사항을 영구적으로 적용

-- emp_hire 테이블의 전체 데이터의 입사일을 현재시간으로 변경
SELECT * FROM emp_hire;
--UPDATE emp_hire SET HIREDATE = trunc(sysdate);
SELECT to_char(hiredate, 'yyyy/mm/dd hh24:mi:ss') FROM emp_hire;

-- emp_sal의 사원들 전부 급여 550 인상
SELECT * FROM emp_sal;
-- UPDATE emp_sal SET sal = sal+550;


-- MERGE(오라클 전용 문법)
CREATE TABLE emp_merge
AS
SELECT empno , ename , sal , deptno FROM emp
WHERE deptno IN(10,20);

SELECT * FROM emp_merge
ORDER BY deptno , empno;

-- emp테이블에서 20,30부서 사원들을 조회(SELECT)
--   emp_merge 테이블과 데이터 병합(merge)
-- 이미 테이블에 존재하는 데이터라면 sal만 30% 인상( UPDATE )
-- 테이블에 존재하지 않는 데이터라면 삽입(INSERT)

MERGE INTO emp_merge M
USING (
    SELECT empno , ename , sal , deptno 
    FROM emp
    WHERE deptno IN(20,30) 
    ) E
ON( M.empno = E.empno)
WHEN MATCHED THEN -- 존재하는 데이터 , 20번 부서
    UPDATE SET M.sal = M.sal*1.3
--    WHERE E.Sal>1500
WHEN NOT MATCHED THEN -- 존재하지 않는 데이터 , 30번 부서
    INSERT (M.empno,M.ename,M.sal , M.deptno)
    VALUES (E.empno,E.ename,E.sal , E.deptno);
--    WHERE E.sal>1000;
    
SELECT * FROM emp_merge
ORDER BY deptno , empno;--확인 구문
    