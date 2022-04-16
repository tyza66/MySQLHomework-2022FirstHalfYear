
------------------�Ӳ�ѯ--------------------

--0 ��ѯlast_nameΪAbel �Ĺ���
select salary from employees where last_name = 'Abel';

--1 ˭�Ĺ��ʱ�Abel�ߣ�
select * from employees where salary > 11000;

--()�еĲ�ѯ���Ϊ�Ӳ�ѯ ���Ե���ִ��
--�����Ӳ�ѯ�Ĳ�ѯ ��������ѯ
--һ��sqlʵ�� ���С����� ���Ӳ�ѯ
--�����Ӳ�ѯ
select * from employees 
where salary > (select salary from employees where last_name = 'Abel');

--2 ��ѯ������͵�Ա������Ϣ-�Ӳ�ѯִ��˳��������ѯ֮ǰ
select * from employees where salary = (select min(salary) from employees);

--3 ��ѯ��149��Ա��ͬ���ŵ�����Ա������Ϣ
select * from employees 
where department_id = 149��Ա���Ĳ��ű�� and employee_id <> 149;
--149��Ա���Ĳ��ű��
select department_id from employees where employee_id = 149;
--����
select * from employees 
where department_id = (select department_id from employees where employee_id = 149) 
and employee_id <> 149;

--4 ��ѯ��202��Ա���Ĳ��ž���Ĺ��ʻ��ߵ�Ա����Ϣ
--1����ѯ���ʱ�ָ���� �ߵ�Ա����Ϣ
select * from employees where salary > 202��Ա���Ĳ��ž���Ĺ���
--2����ѯĳ�˹���
select salary from employees where employee_id = 202��Ա���Ĳ��ž�����
--3����ĳ���˵ľ�����
select manager_id from employees where employee_id = 202;

--����
select * from employees 
where salary > (select salary from employees 
                       where employee_id = (select manager_id from employees 
                                                   where employee_id = 202))
                                                   
--5 ��ѯԱ����ţ����������ʣ�Ա����Ĺ����ܺ�(�Ӳ�ѯҲ���Է���select�Ӿ���)
select e.employee_id,e.first_name||e.last_name fullname,
       e.salary,e.salary*(1+nvl(e.commission_pct,0)) fullsalary,
       (select sum(salary*(1+nvl(commission_pct,0))) from employees)
from employees e;

--α��  rownum
select rownum,employee_id,first_name||last_name fullname from employees;
--��ע1��rownum��*������ͬʱ����
select rownum,* from employees;

--6 ��ѯ������ߵ�ǰ5��Ա������Ϣ
select rownum,employee_id,first_name,salary from employees
order by salary desc;
--[���Ȳ�ѯ�������˳�� ��Ϊ �������ִ��]
select rownum,employee_id,first_name,salary from (select * from employees order by salary desc)
where rownum<6;

--��ע2��rownum��������1��ʼ��
--7 ��ѯԱ�����е�6����12������
select rownum,employee_id,first_name,salary from employees 
where rownum between 6 and 12;

select * from (select rownum rn,employee_id,first_name,salary from employees)
where rn between 6 and 12;

--7-1����ѯԱ�����й���������6��10������
select * from (select rownum rn,employee_id,first_name,salary from (select * from employees order by salary desc))
where rn between 6 and 10;

--�����Ӳ�ѯ
8 ��ѯ�����ǲ��ž����Ա����Ϣ
select distinct manager_id from employees;

select * from employees where employee_id in(select distinct manager_id from employees);
9 ��ѯ���в��ǲ��ž����Ա��

select * from employees 
where employee_id not in(select distinct manager_id from employees where manager_id is not null);

select * from employees 
where employee_id not in(select distinct nvl(manager_id,0) from employees);


--10 ��ѯ����60�Ų�����ĳһ��Ա�����ʵ�Ա����Ϣ
select * from employees where salary > 60�Ų�����͹���

select * from employees where salary > (select min(salary) from employees where department_id='60');
--any��ʾ������е�����һ��  in��ʾ ���ڽ����������һ��
select * from employees where salary > any(select salary from employees where department_id='60');

--11 ��ѯ����60�Ų�������Ա�����ʵ�Ա����Ϣ
select * from employees where salary > (select max(salary) from employees where department_id='60');
--all��ʾ������е�ÿһ��
select * from employees where salary > all(select salary from employees where department_id='60');


--12 ��ѯ����Ա������������3�˵Ĳ�����Ϣ

--1,Ա������ ������Ϣ ������ Ա����Ͳ��ű� ===> �����ѯ
select e.*,d.*
from employees e,departments d
where e.department_id = d.department_id;

--2, Ա������������3�˵Ĳ�����Ϣ ====>  ����  ==> �Ȳ�ѯ���в�����Ϣ ����������
select d.*,count(e.employee_id)
from employees e,departments d
where e.department_id = d.department_id
group by d.department_id,d.department_name,d.manager_id,d.location_id;

--3,Ա������������3��

select d.*,count(e.employee_id)
from employees e,departments d
where e.department_id = d.department_id
group by d.department_id,d.department_name,d.manager_id,d.location_id
having count(e.employee_id) >= 3;


select d.department_id,d.department_name,d.manager_id,d.location_id,count(e.employee_id)
from employees e,departments d
where e.department_id = d.department_id
group by d.department_id,d.department_name,d.manager_id,d.location_id
having count(e.employee_id) >= 3;


----------------------����Ӳ�ѯ---------------------

--13 ��ѯԱ����ţ����������ű�ţ����ʣ������Ź��ʵ��ܺ�
select e.employee_id,e.first_name,e.department_id,e.salary,�����Ź��ʵ��ܺ�
from employees e

--�����Ź��ʵ��ܺ�
select sum(salary) from employees where department_id = Ա�����ڵĲ��ű��

--���ϡ�����Ӳ�ѯ���ܵ���ִ�У����Ӳ�ѯ�а�������ѯ������ݡ�
select e.employee_id,e.first_name,e.department_id,
e.salary,(select sum(salary) from employees where department_id =e.department_id)
from employees e

14 ��ѯ���й��ʳ���������ƽ�����ʵ�Ա������Ϣ
