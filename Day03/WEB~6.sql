-- to_char(datetime)
SELECT
--    sysdate
--    to_char(sysdate,'SCC'), -- ����
--    to_char( to_date('369/1/7'),'SCC')

--    to_char( sysdate, 'YEAR'), --���� �⵵
--    to_char( sysdate, 'year'),
--    to_char( sysdate, 'Year')

--    to_char( sysdate, 'YYYY'), --���� �⵵
--    to_char( sysdate, 'YY'), -- �ڿ����ڸ�
--    to_char( sysdate, 'YYY'), -- �ڿ������� 3�ڸ�
--    to_char( sysdate, 'Y') -- �ڿ������� 1�ڸ�
--    to_char(sysdate,'YYYYY') -- YYYY Y 
    
--    to_char(sysdate , 'MM'),    -- ���� ��
--    to_char(sysdate , 'MONTH'), -- ���� ��
--    to_char(sysdate , 'MON')    -- ���� �� ���

--    to_char(sysdate , 'Q') --�б� 

--    to_char(sysdate , 'DD'), --�� ���� �ϼ�
--    to_char(sysdate , 'D'),--�� ���� �ϼ� , ���� �Ͽ���1~�����6
--    to_char(sysdate , 'DDD') -- ��(365)���� �ϼ�

--    to_char(sysdate , 'DAY'), -- ����
--    to_char(sysdate , 'DY') -- ���Ͼ���

--    to_char(sysdate , 'HH'),-- 12�ð� ���� �ð�
--    to_char(sysdate , 'HH12'),-- 12�ð� ���� �ð�
--    to_char(sysdate , 'HH24')-- 24�ð� ���� �ð�

--    to_char(sysdate ,'MI') -- ��    

--    to_char(sysdate,'SS')--��

--    to_char(sysdate,'AM'), -- ����/����
--    to_char(sysdate,'PM'),
--    to_char(sysdate,'A.M.'),
--    to_char(sysdate,'P.M.')

    to_char(sysdate,'FF') -- �и��� sysdate Ÿ���� �ȉ´�!!

FROM dual;


-- 2�б⿡ �Ի��� �����
SELECT * FROM emp
WHERE to_char(hiredate , 'Q')=2;
--WHERE hiredate >= '81/07/01' AND hiredate < '81/10/01';

SELECT systimestamp ,sysdate FROM dual;

SELECT 
    to_char(systimestamp,'FF'),
    to_char(systimestamp,'FF1'), --10���� 1��
    to_char(systimestamp,'FF2'),  --100���� 1�� (�ڸ���)
    to_char(systimestamp,'FF3')--1000���� 1��
FROM dual;

SELECT
    to_char(sysdate, 'YYYY/MM/DD DAY HH24:MI:SS')
FROM dual;
