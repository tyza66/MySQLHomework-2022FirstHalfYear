--2 ��ѯÿ��Ա�����������ʣ�����ʵ�����ʣ�����+����
select first_name,salary,commission_pct,salary*(1+commission_pct) as newsalary from employees;
--ͨ�ú���--��ֵ������
--nvl��ֵ1,ֵ2��  ��ֵ1Ϊ�� �򷵻�ֵ2����֮����ֵ1
select first_name,salary,nvl(commission_pct,0),salary*(1+nvl(commission_pct,0)) as newsalary from employees;

--escape������
--17 ��ѯjob_id ������5���ַ�Ϊ���»��ߵ�Ա����Ϣ
select * from employees where job_id like '%/_____' escape '/';
--18 ��ѯlast_name�а���%��Ա����Ϣ
select * from employees where last_name like '%#%%'escape '#';


------------------------------------------------���ú���-----------------------------------------------------

--һ�����к��� ��1��1 һһ��Ӧ

--1,�ַ�����
--lower��ĸתСд
select lower('HELLO') from dual;
--upper��ĸת��д
select upper('world') from dual;
--initcap����ĸ��д������Сд
select initcap('HELLO') from dual;
--length�����ַ�������
select length('dhwudheu') from dual;

--concat ƴ���ַ�����һ�ν���ƴ�������ַ�����
select concat('hello','world') from dual;
--��ƴ��3���������ַ���������Ҫ����Ƕ��
select concat(concat('hello','world'),'!!!') from dual;

--substr(�ַ���,��ȡ��ʼλ��)��ȡ�ַ���
--�ַ�λ�ô�1��ʼ����
select substr('yangjianfei',5) from dual;
--substr(�ַ���,��ȡ��ʼλ��,��ȡ�ĳ���)
select substr('yangjianfei',5,4) from dual;
--��ʼλ����Ϊ�����������������
select substr('yangjianfei',-7,4) from dual;
--��ȡ���Ȳ���Ϊ����
select substr('yangjianfei',-7,-4) from dual;

--instr(�ַ���,�����Ӵ�)�����ַ���  
--���Ӵ����� ������ҿ�ʼ���ң������Ӵ���һ�γ��ֵ���ʼλ��
select instr('songdechaodedededede','de') from dual;
--���Ӵ������ڣ��򷵻�0
select instr('songdechao','yangjianfei') from dual;

--instr(�ַ���,�����Ӵ�,��ʼλ��)
select instr('wuhaoyuan','wu',3) from dual;
--����ʼλ��Ϊ����������ʼλ�ô��������������ҷ���Ҳ�Ǵ��ҵ���
select instr('wuhaoyuan','wu',-3) from dual;

--instr(�ַ���,�����Ӵ�,��ʼλ��,�ڼ��γ���)
select instr('zhangbobozi','bo',1,2) from dual;
--����ʼλ��Ϊ����������ʼλ�ô��������������ҷ���Ҳ�Ǵ��ҵ���
select instr('zhangbobozi','bo',-1,2) from dual;

--lpad(�ַ���,�̶�����,�����ַ�)�����
select lpad('zhangzhenyu',18,'#') from dual;
--rpad�����
select rpad('mengruirui',18,'$') from dual;

--replace(�ַ���,�����ַ���,�滻�ַ���)�滻
select replace('woxihuantongyuzhu','tongyuzhu','fuyumeng') from dual;
--replace(�ַ���,�����ַ���)�Ѳ����ַ���ɾ��
select replace('woxihuantongyuzhu','tongyuzhu') from dual;
--replace() �滻�ǰ����в��ҵ��Ӵ� ���滻��
select replace('wotaoyanfuyumeng,woyetaoyantongyuzhu','taoyan','xihuan') from dual;

--chr ������ת�ַ�
select chr(77) from dual;
--ascii ����һ���ַ�ת����
select ascii('³') from dual;
select ascii('��') from dual;
select ascii('��') from dual;

select ascii('��') from dual;
select ascii('��') from dual;


--'&input'��ʾ�û������ַ���
select '&input' from dual;

--trimȥ���ַ�����ǰ��ո�
select trim('     haiyou  wushiwu  fenzhong  xiake   ') from dual;

--��ϰ
--��ѯԱ���պ���������ȵ�Ա��
select * from employees where length(first_name) = length(last_name);

--��ѯlast_name��s��β��Ա��������like��

--instr���� �ж�s���ֵ�λ���ǲ������һ��
select * from employees where instr(last_name,'s',-1)=length(last_name);
--substr���� ȡ�����һ����ĸ��s�Ƚ�
select * from employees where substr(last_name,-1)='s';

--��ѯ���е�Ա���պ�����������¸�ʽS.King
--����ʵ��
select first_name from employees;
select substr(first_name,1,1) from employees;
select concat(substr(first_name,1,1),'.') from employees;
select concat(concat(substr(first_name,1,1),'.'),last_name) from employees;

-- ||ʵ���ַ�ƴ��
select substr(first_name,1,1) || '.' || last_name from employees;

--��ѯ���еĵ绰���룬�ѷָ������㡱��Ϊ��-��֮�������
select replace(phone_number,'.','-') from employees;

--�û�����һ�������ţ���ѯ�˱�ŵ�Ա��
select * from employees where employee_id = '&input';

--�û�����һ���ؼ��֣���ѯlast_name�����˹ؼ��ֵ�Ա��������LIKE��
select * from employees where instr(last_name,'s')<>0;

--��ѧ����

--round(����)��������,Ĭ�ϱ���������λ
select round(3.1415926) from dual;
--round(����,С��λ��)
select round(3.1415926,2) from dual;
--��С��λ��Ϊ����������С����ǰ��λ��
select round(31415.26,-2) from dual;

--trunc()�ضϺ���,�﷨ͬ��
select trunc(3.9999999) from dual;
select trunc(3.9999999,2) from dual;
select trunc(39999.999,-2) from dual;
select trunc(-39999.999,-2) from dual;

--floor(����) ���ز����ڱ�����������������ȡ����
select floor(3.99999) from dual;  --3
select floor(-3.11111) from dual; -- -4

--ceil(����) ����ȡ��
select ceil(3.000000001) from dual;
select ceil(-2.99999999) from dual;

--mod(������,����) ��ģ,������
select mod(22,7) from dual;

--���ں���
--sysdate ��ʾ��ǰϵͳʱ��
select sysdate from dual;
--����ʱ���ǿ��Խ��мӼ������(��λ����)
select sysdate+3 from dual;
--��25����֮���ʱ��
select sysdate+(1/24/60)*25 from dual;

--��������Ա����ְ������
select trunc(sysdate-hire_date) from employees;

--months_between(����1������2)�����������������ٸ���
select months_between(sysdate,hire_date) from employees;

--add_months(���ڣ�n)��ָ�����ڼӼ������
select add_months(sysdate,1) from dual;
select add_months(sysdate,-1) from dual;

--next_day(���ڣ����ڼ�)��һ����������ڼ�������
select next_day(sysdate,'������') from dual;
select next_day(sysdate,'������') from dual;
--���� 1-7 �ֱ���� ����--����
select next_day(sysdate,5) from dual;

--last_day()


--ת������
--ͨ�ú���
--ͨ�ú���--��ֵ������
--nvl��ֵ1,ֵ2��  ��ֵ1Ϊ�� �򷵻�ֵ2����֮����ֵ1




--���к��� ��n��1
