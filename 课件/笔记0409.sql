--8 ��ѯ���ʳ���8000Ա����ţ����������ű�ţ��������ƣ�ְ���ţ�ְ�����ƣ��������飩

select e.employee_id,e.first_name,d.department_id,d.department_name,j.job_id,j.job_title
from employees e,departments d,jobs j
where e.department_id = d.department_id and e.job_id = j.job_id and e.salary > 8000;


--9 ��ѯ���в��ŵı�ţ����ŵ����ƣ����ž���ID�����ž��������
select d.department_id,d.department_name,d.manager_id,manager.first_name 
from departments d,employees manager
where d.manager_id = manager.employee_id;

select * from employees;
select * from departments;

--10 ��ѯÿ��Ա���ı�ţ����������ʣ����ʼ��𣨲���ֵ����
select * from job_grades;

select e.employee_id,e.first_name,e.salary,jg.grade_level
from employees e,job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal;

--11 ��ѯԱ����ţ����������ű�ţ��������ƣ������ӣ�û�в��ŵ�Ա��Ҳ���أ�

--1999��׼�����廯��
left outer join 

--û�в��ŵ�Ա��Ҳ����--> Ա������Ϣ���� --> ������Ա����
--��������
select e.employee_id,e.first_name,d.department_id,d.department_name
from employees e left outer join  departments d
on e.department_id = d.department_id;
--��������
select e.employee_id,e.first_name,d.department_id,d.department_name
from  departments d right outer join  employees e
on e.department_id = d.department_id;

--12 ��ѯԱ����ţ����������ű�ţ��������ƣ������ӣ�û��Ա���Ĳ���Ҳ���أ�
--�������� left outer join
select e.employee_id,e.first_name,d.department_id,d.department_name
from  departments d left outer join employees e
on e.department_id = d.department_id;
--��������  right join   ��outer��ʡ��
select e.employee_id,e.first_name,d.department_id,d.department_name
from  employees e  right join  departments d
on e.department_id = d.department_id;

--ȫ������ full outer join
select e.employee_id,e.first_name,d.department_id,d.department_name
from  employees e  full outer join  departments d
on e.department_id = d.department_id;

--������ inner join
select e.employee_id,e.first_name,d.department_id,d.department_name
from  employees e  inner join  departments d
on e.department_id = d.department_id;

--�漯cross join
select e.employee_id,e.first_name,d.department_id,d.department_name
from  employees e  cross join  departments d;

--13 ��ѯ���в��ŵı�ţ����ŵ����ƣ����ž���ID�����ž����������û�о���Ĳ���Ҳ���أ�
--û�о���Ĳ���Ҳ����-->������Ϣ����-->�����Ӳ��ű�
select d.department_id,d.department_name,d.manager_id,manager.first_name 
from departments d left outer join employees manager
on d.manager_id = manager.employee_id;

--�����ӣ�������ͬ�ı����ӣ�

--14 ��ѯԱ����ţ�������Ա�������ߵı�ţ�Ա�������ߵ������������ӣ�
select e.employee_id,e.first_name,e.manager_id,m.employee_id 
from employees e,employees m
where e.manager_id = m.employee_id;

--15 ��ѯԱ����ţ�������Ա�������ߵı�ţ�Ա�������ߵ�������û�й����ߵ�Ա��Ҳ���أ�
select e.employee_id,e.first_name,e.manager_id,m.employee_id 
from employees e left outer join employees m
on e.manager_id = m.employee_id;

/*
��������
�ѿ�����--->�����ӡ���ֵ���ӣ�����ֵ���ӡ�
--->�����ӡ����⣬���⣬ȫ�⡿
--->�����ӡ�����һ���ı����ӡ�
*/

-------------------------------------------------����----------------------------------------------
--���к���
/*���  max
��С  min
ƽ��  avg
�ܺ�  sum
����  count
*/
select * from employees

--��ѯ ����Ա���Ĺ���ƽ��ֵ,���ֵ����Сֵ���ܺͣ�����
select avg(salary),max(salary),min(salary),sum(salary),count(salary) from employees;


--1 ��ѯÿ�����ŵı�ţ��ò���Ա�����ʵ��ܺ�  �ȷ���
select department_id,sum(salary)
from employees
group by department_id
having department_id is not null;

--2 ��ѯÿ�����ŵ���߹���
select department_id,max(salary)
from employees
group by department_id
having department_id is not null;
--3 ��ѯÿ�����ŵ�ƽ������
select department_id,avg(salary)
from employees
group by department_id
having department_id is not null;

--4 ��ѯ������߹��ʳ���10000�Ĳ�������
--�����ַ���󣬽���ֱ�Ӳ�ѯ�����������ֶλ�ۺϺ�����
select d.department_name,max(e.salary)
from employees e,departments d
--����ǰ���ˣ�������ʹ�þۺϺ�������ʱδִ�У�
where e.department_id = d.department_id
group by d.department_name
--��������
having max(e.salary)>10000;

--5 ��ѯ����ƽ�����ʳ���13000�Ĳ���
select department_id,avg(salary)
from employees
group by department_id
having avg(salary) > 13000;


/*
sql��ѯ������д˳����ִ��˳��
              ��д˳��   ִ��˳��
select           1          7
distinct         2          8
from             3          1
join             4          3
on               5          2
where            6          4
group by         7          5-->ִ�оۺϺ���
having           8          6
order by         9          9
*/

--**1 ����ͳ�Ƹ������¹���>500��Ա����ƽ������
select  department_id,avg(salary)
from employees
where salary>500 and department_id is not null
group by department_id;
2 ͳ�Ƹ�������ƽ�����ʴ���1700�Ĳ��� 

3 �������80�еõ���ཱ���Ա������

4 ���ÿ��ְλ��Ա��������͹��� 

5 �г�Ա������ÿ�����ŵ�Ա�������Ͳ���no

--**6 ����ͳ��ÿ�������£�ÿ��ְλ��ƽ������ҲҪ��û������ˣ����ܹ���(��������)
--�ۺϺ���Ĭ�ϲ������nullֵ
select commission_pct from employees;
select sum(commission_pct) from employees;
select avg(commission_pct) from employees;

select department_id,job_id,avg(nvl(commission_pct,0)*salary),sum(salary*(1+nvl(commission_pct,0)))
from employees
where department_id is not null
--������Զ���ֶ�
group by department_id,job_id;

7 �г�Ա������ÿ�����ŵ�Ա������Ա�����������3�����Ͳ������� 
