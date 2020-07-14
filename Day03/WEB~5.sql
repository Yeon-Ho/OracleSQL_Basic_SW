-- �е� , Padding

-- ���ڸ� ǥ���ϱ� ���ؼ� ������ Ȯ���ϰ� ,
-- �� ������ ���ڸ� ä���ְ� �� ������ ������ ������ ���ڷ� ä���.

-- LEFT PADDING : lpad()
SELECT lpad('SQL',10) FROM dual;
SELECT lpad(ename, 10) FROM emp;

SELECT lpad('SQL',10,'*') FROM dual;
SELECT lpad(ename, 10,'*') FROM emp;
SELECT lpad(ename, 10,'*-') FROM emp;

SELECT lpad('ABCDEFGH', 5) FROM dual; --������ 5����µ� ���̻� �������� ©����.

-- RIGHT PADDING : rpad()
SELECT rpad('SQL',10) FROM dual;
SELECT rpad('SQL',10,'*') FROM dual;
SELECT rpad('SQL',10,'*-') FROM dual;


-- TRIM (��Ƴ���)
--  �������� �� ���ܿ� �ִ� ' '(���� ,����)�� �����ϴ� �Լ�

SELECT '   SQL   ',
    ltrim('   SQL   '),
    rtrim('   SQL   '),
    trim('   SQL   ') --���� �� ����¥����
FROM dual;


-- ��¥ �Լ�, DATETIME
SELECT sysdate FROM dual; -- sysdate �� ��ǻ�Ͱ� �������ִ� ���� ��¥
 
-- ��¥�ð� Ÿ���� -> ����Ÿ��(���� ����)
SELECT 
    to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') now
FROM dual;

-- MONTHS_BETWEEN : ���� �� ����
SELECT
    months_between('20-01-01','20-02-01') "A",
   round( months_between('20/02/15','20/02/01'),2) "B",
    round( months_between(sysdate,'20/02/01'),2) "C"
FROM dual;

-- next_day : ������ ������ �ٰ����� ��¥ ���ϱ�
SELECT
    next_day(sysdate ,'��'),
    next_day(sysdate,'�ݿ���')
FROM dual;

-- trunc(datetime) �Լ� , �ð��� ����(00��00��00��)�� �����
SELECT
    sysdate ,
    to_char(sysdate,'YYYY/MM/DD HH24:MI:SS ') now,
    to_char( trunc(sysdate),'YYYY/MM/DD HH24:MI:SS'),
    to_char( trunc(sysdate),'yy/mm/DD HH24:MI:SS;')
FROM dual;

-- �Ʒ� ������ ���̴� ����� ������
-- �ð��� ���ԵǾ��־ ���� �ٸ� ���� ������.
SELECT
    sysdate,
    trunc(sysdate)
FROM dual;



-- to_char(number)
-- to_char(number,fmt) : ���Ĺ��ڸ� �̿��� ��ȯ

SELECT
    12345 "0",
    to_char(12345) "1",-- '12345'
    length( to_char(12345))"3",
    length(12345)"4", -- �ڵ�����ȯ �ַ� ���ڿͼ��� ���̿� �Ͼ��.
    to_char(12345,'99') "5",
    to_char(12345,'9999999999') "6",
    to_char(12345,'0000000000') "7",--0���γ������� ä�� ��ĭ������ִ°��� +��-������
    to_char(12345,'9990000000') "8"
FROM dual;

SELECT
    to_char(12345.6789)"1",
    to_char(12345.6789,'99999.9')"2", -- �Ҽ����� �ݿø� �ع�����.
    to_char(12345.6789,'9999999.99')"3", --�Ǽ��� ������ ���°��� ��ĭ����
    to_char(12345.6789,'9,999,999.99')"4",
    to_char(12345.6,'9,999,999.999')"5" --�Ҽ����� ������ ������ 0���� ä���.
FROM dual;

SELECT
    to_char(12345)"1",
    to_char(12345,'$99,999,999')"2",
    to_char(12345,'$999')"3",
    trim(to_char(12345,'L99,999,999'))"4" -- LOCALE
FROM dual;
