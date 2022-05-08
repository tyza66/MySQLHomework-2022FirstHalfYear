-----------------------------����----------------------------
--���ж��� �� �ṩһϵ�в��ظ������֣������������Զ����������ֶΡ�
select * from student_plus;

--��������
create sequence ������
--�����������á���û������ ��Ĭ��1��ʼ ����Ϊ1��
increment by ����
start with ��ʼֵ
maxvalue ���ֵ   ��nomaxvalue��

--��������
create sequence seq_test
increment by 5
start with 2;

--ʹ������  ��ע�� nextvalӦ����currvalʹ��֮ǰ ����  ����currval�޷�ʹ��
--nextval ��һ��ֵ
--currval ��ǰֵ

--��ѯ���е���һ��ֵ
select seq_test.nextval from dual;
--��ѯ���еĵ�ǰֵ
select seq_test.currval from dual;

--ɾ������
drop sequence ������

drop sequence seq_test;


---------------------------------Լ��--------------------------------
/*
primary key ����Լ�����ֶβ��ظ����Ҳ�Ϊ�գ�����������Լ�����ֶ� Ҫ�� �ȶ���Ψһ��
not null �ǿ�Լ������Ϊ��
unique ΨһԼ���������ظ�
check ���Լ������������ָ������
foreign key ���Լ�����������ָ������ָ������������
*/

drop table student_plus;
/*
�Դ���ѧ����Ϊ��
ѧ��  Ψһ��ʶ���ȶ�--> ����Լ��
����  �ǿ� 
�Ա�    ���Լ��
��ϵ��ʽ   ΨһԼ��
���   ���Լ��
*/

--����  �༶��Ϣ��  ��(��)�������յı�

create table class_info(
       claid number(2) primary key,
       claname varchar2(30) not null
);

--���������  �ſ���Ϊ��(��)�� ��Ӷ�ӦԼ��
create table student_plus(
     -- �ֶ���  ��������(����) �м�Լ��
     stuid number(4) primary key,
     stuname varchar2(15) not null,
     stusex char(1) check(stusex='1' or stusex='0'),
     stutel varchar2(15) unique,
     --�ӱ������ֶ� �� ����������ֶ� �������ͼ� ����Ӧ��һ��
     claid number(2),
     --��Լ���Ķ��� �� constraint Լ���� Լ������(ҪԼ�����ֶ�)
     constraint student_classinfo_fk foreign key(claid)
     --�������Լ���ο��� ������� �������ֶ�
     references  class_info(claid)
);

--�����༶����  
create sequence class_info_seq;
select class_info_seq.nextval from dual;
--������� ��������ӱ�
insert into class_info values(1,'��4��');
--����Լ��Ч��
insert into class_info values(class_info_seq.nextval,'��5��');
--�ǿ�Լ��Ч��
insert into class_info values(class_info_seq.nextval,null);
commit;
select * from class_info

--����ӱ�����





select * from student_plus;


