--7-1��ѯԱ�����й���������6��10������
select * from (select rownum rn,employee_id,first_name,salary from (select * from employees order by salary desc)) where rn between 6 and 10;

-- ��ѯ����60�Ų����κ�һ��Ա�����ʵ�Ա����Ϣ����min�������any��
select * from employees where salary>(select m from (select department_id,max(salary) m from employees group by department_id) where department_id=60);

-- 
