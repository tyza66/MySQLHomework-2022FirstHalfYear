--��ҵ
select * from EMPLOYEES t;
select * from regions ;
select * from countries;
select * from locations;   
select * from departments;
select * from jobs   ;
select * from job_history;
select * from job_grades;

--ɾ������
delete from job_grades;

--RDBMS ��ϵ�����ݿ����ϵͳ  
--SQL �ṹ����ѯ����
/*
SQL���
-DQL(���ݲ�ѯ����)
-DML(���ݲ�������)
-DDL(���ݶ�������)
-TCL(�����������)
-DCL(���ݿ�������)

SQL��׼
1992
1999  -���廯left outer join
*/

--������ѯ
--1����ѯ�����ֶ�
select * from employees;

--2����ѯָ���ֶ�
select employee_id from employees;

--3����Ա�����ѯ���в���id    distinct-ȥ�������ظ�������
select distinct department_id from employees;

--4����Ա�����ѯ����Ա����employee_id��first_name,salary
select employee_id��first_name,salary from employees;

--5����ѯ����Ա����н20���н�� ����ʹ�������������
select employee_id��first_name,salary,salary+20 from employees;

--6����ѯ����Ա������������
select first_name,last_name from employees;

--7��  ||�����ֶ����ֶεĺϲ���
select first_name || last_name from employees;
--8��  || ���ֶ����ַ���������   �ַ���ʹ�õ�����''
select first_name || '��' || last_name from employees;
--9��  ���ֶ������  �ո� �� as
select first_name || '��' || last_name fullname  from employees;
select first_name || '��' || last_name as fullname  from employees;
--10��˫����"" ǿ��ʹ��ָ����Сд��ʾ
select first_name || '��' || last_name as "fullname" from employees;

--11����ѯ�����Զ��������ļ�¼ where�Ӿ� ����
--�Ƚ������ >  <  >=  <=  =   <>
--��ѯ���ʸ���2000��Ա����Ϣ
select * from employees where salary > 4000;

--12����ѯ���� commission_pct(��Ч�ٷֱ�) ����0.2 ����
--null��ֵ�����κε������� �����Ϊ��
select * from employees where commission_pct < 0.2;
--null��ֵ�����κεļ����� �����null
select commission_pct+0.1 from employees;

--13����ѯ������ְ������1998��֮ǰ��Ա����Ϣ
--���ڱȽ� ע��Ĭ�ϵ����ڸ�ʽ'DD-MM-YYYY'
select * from employees where hire_date < '1-1��-1998';

--14���߼������  and  or  not
--��ѯ60���� ���ʸ���4000��Ա����Ϣ
select * from employees where department_id = 60 and salary > 4000;

--15������Ƚ������
--1��������ֵ֮�䣨�����߽磩   between ���� and ����
--��ѯ������ 4000--10000֮���Ա����Ϣ
select * from employees where salary between 4000 and 10000;
--2) ���� ֵ�б��е�һ��  in(ֵ�б�)
--��ѯ90��60��50���ŵ�����Ա����Ϣ
select * from employees where department_id in(90,60,50);

--3) �ж��Ƿ�Ϊ��  is null
select * from employees where commission_pct is null;
--4) ģ����ѯ  like  ���ͨ���
-- %��ʾ 0��������1�������ַ�
--��ѯ first_name ��'S'��ͷ��Ա����Ϣ
select * from employees where first_name like 'S%';
-- _��ʾ1�������ַ�
--��ѯ first_name ��'S'��ͷ,����Ϊ6���ֵ�Ա����Ϣ
select * from employees where first_name like 'S_____';
--����ϰ��
--��ѯ���� first_name�к���'e'��Ա����Ϣ
select * from employees where first_name like '%e%';

--16,����Ƚ������ �� �߼���
select * from employees where salary not between 4000 and 10000;
select * from employees where department_id not in(90,60,50);
select * from employees where first_name not like '%e%';

select * from employees where commission_pct is not null;

--17������order by   desc  asc(�ɲ�д)
--��ѯ����Ա����Ϣ��Ҫ���չ��ʽ�������  desc ����
select * from employees order by salary desc;

--������Ա���������� ���ʽ�����������ͬ������ ��ְ���ڽ�������
select * from employees order by salary desc,hire_date desc;

--����� dual
select 3+5 from dual;
select substr('abcdefghijklmn',3,4) from dual;
select ascii('��') from dual;
