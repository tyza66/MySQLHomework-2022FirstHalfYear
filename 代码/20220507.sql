--��������
CREATE SEQUENCE ������
--������������
INCREMENT BY ����
START WITH ��ʼֵ
MAXVALUE ���ֵ    ��nomaxvalue��

--��������
CREATE SEQUENCE seq_test
increment by 5
start with 2;

--ʹ������  ��ע�⡿��һ��ֵӦ���ڵ�ǰֵ֮��diaoyong
--nextval ��һ��ֵ
--currval ��ǰֵ

--ֻ��ִ����һ��nextval֮�����вſ��Ա���������Ȼ����û�б������
select seq_test.nextval from dual;

--��ѯ���еĵ�ǰֵ
select seq_test.currval from dual;