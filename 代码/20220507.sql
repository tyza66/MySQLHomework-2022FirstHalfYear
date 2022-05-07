--��������
CREATE SEQUENCE ������
--������������ ��û��������Ĭ��1��ʼ ����Ϊ1
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

--ɾ������
DROP SEQUENCE seq_test;

/*
����Լ�����ֶβ��ظ����Ҳ�Ϊ�� ����������Լ��������Ҫ���ȶ���Ψһ��
�ǿ�Լ������Ϊ��
ΨһԼ���������ظ�
���Լ������������ָ������
���Լ�����������ָ������ָ������������
PRIMARY KEY
NOT NULL
UNIQUE
CHECK
FOREIGN KEY
*/

DROP TABLE STUDENT_PLUS;

SELECT * FROM student_PLUS;

--����ѧ����Ϊ��
/*
ѧ��  Ψһ��ʶ���ȶ�--> ����Լ��
����  �ǿ�
�Ա�  ���Լ��
��ϵ��ʽ  ΨһԼ��
��� ���Լ��
*/

create table class_info(
  claid number(2) primary key,
  claname varchar2(30) not null
);

--��������֮��ſ���Ϊ�ӱ���Ӷ�Ӧ��Լ��

CREATE table student_plus(
  stuid number(4) primary key,
  stuname varchar2(15) not null,
  stusex char(1) check(stusex='1' or stusex='0'),
  stutel varchar2(15) unique,
  --�ӱ������ֶ�������������ֶ��������ͼ�����Ӧ��һ��
  claid number(2)��
  --��Լ���Ķ��� constraint Լ���� Լ�����ͣ�ҪԼ�����ֶΣ�
  constraint student_classinfo_fk foreign key(claid)
  references class_info(claid)
);

INSERT INTO CLASS_INFO VALUES(1,'��4��');



