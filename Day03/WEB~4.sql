-- �����Լ� ����

-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
SELECT upper('hELlo') FROM dual;
-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
SELECT lower('heLlo') FROM dual;
-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello  (Initial Capital)
SELECT initcap('hELlo') FROM dual;

SELECT * FROM tabs
WHERE table_name = upper('EMP');  --�׻� �빮�ڷ� ���!

-- 'Alice Bob'�� ���ڿ� ���� -> 9
SELECT length('Alice Bob') FROM dual;
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5
SELECT length('�ȳ��ϼ���') FROM dual;

-- 'Alice Bob' ���ڿ� ����Ʈ �� -> 9
SELECT lengthb('Alice Bob') FROM dual;
-- 'ACE �ȳ��ϼ���'���ڿ� ����Ʈ �� -> 19
SELECT lengthb('ACE �ȳ��ϼ���') FROM dual;
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�) ACE 3 +  1 + �ȳ��ϼ��� 15

-- 'ABCDEFGHI'���� 'D' �� ��ġ -> 4
SELECT instr('ABCDEFGHI','D') FROM dual;
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
SELECT instr('ABCDEFGHI','DEF') FROM dual;
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ -> 0
SELECT instr('ABCDEFGHI','DF') FROM dual; --���ٶ�� �Ҷ��� 0
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ -> 3
SELECT instr('�ȳ��ϼ���','��') FROM dual;
SELECT instrb('�ȳ��ϼ���','��') FROM dual; -- �ѱ��ڴ� 3byte 7���ͽ����̴ϱ� 7��ȯ
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ -> 3 -- ã���� ���������� ó��ã���� ��ȯ
SELECT instr('ABCABCDDD','C') FROM dual;

--'Oracle SQL Developer'���� 5��° �ε��� ������ ���ڿ��� �ڸ���
SELECT substr('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'���� 5��° �ε������� 5���ڷ� �ڸ���
SELECT substr('Oracle SQL Developer',6,5) FROM dual;
--'����Ŭ SQL'���� 2��° �ε������� 5���ڷ� �ڸ���
SELECT substr('����Ŭ SQL',3,5) FROM dual;
SELECT substrb('����Ŭ SQL',3,5) FROM dual; -- ��ĭ���� 
--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���
SELECT substr('�ȳ��ϼ������Ŭ',0,2) FROM dual;
SELECT substr('�ȳ��ϼ������Ŭ',3) FROM dual;

------------------------------------------------------------------------------------
SELECT substr('fk@na.com',1) FROM dual;
SELECT instr('fk@na.com','@') FROM dual;
SELECT replace('fk@na.com','@','��') FROM dual;

SELECT
    substr('�ȳ��ϼ������Ŭ',0,2) || ' is ' || substr('�ȳ��ϼ������Ŭ',6) ���ں��̱�
FROM dual;

