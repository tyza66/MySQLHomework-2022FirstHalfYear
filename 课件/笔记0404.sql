--last_day()��ʾָ�����������µ����һ��
select last_day(sysdate) from dual;

--round����,Ĭ���������뵽��
select round(sysdate) from dual;
select round(sysdate+1/2) from dual;
--round(����,���ڵ�λ)
select round(sysdate,'month') from dual;
select round(sysdate+12,'month') from dual;
--�������뵽��
select round(sysdate,'year') from dual;
select round(add_months(sysdate,3),'year') from dual;

--trunc����,�÷�ͬ��
select trunc(sysdate) from dual;
select trunc(sysdate,'month') from dual;
select trunc(sysdate,'year') from dual;



--ת������:�ַ������֣�����

--�ַ�������֮�����ʽת��
select '5'+2 from dual;
--����������֮���޷�ת��

--�ַ������ڵ�ת��
--to_char(����,'ģ��')������ת��Ϊ�ַ���
select to_char(sysdate,'yyyy-mm-dd') from dual;
--�����գ�ʱ����
select to_char(sysdate,'yyyy.mm.dd hh:mi:ss') from dual;
--fm��ʾȥ����Ӱ���0,hh24��ʾ24Сʱ�ƣ�am��ʾ��ʾ�����磬day��ʾ���ڼ�
select to_char(sysdate,'fmyyyy-mm-dd hh24:mi:ss am day') from dual;

--to_date(�ַ���,'ģ��')  �ַ�����ʽ��ģ���ʽ����һ��
select to_date('1990-04-04','yyyy-mm-dd') from dual;

--��ѯ95����ǰ��ְ��Ա��
select * from employees where hire_date < to_date('1995-1-1','yyyy-mm-dd');

--��ϰ
--��ѯ7�»���8����ְ��Ա��
select * from employees where to_char(hire_date,'mm') in(7,8);

--��ѯ17����ְ��Ա��
select to_char(sysdate,'dd') from dual;

select * from employees where to_char(hire_date,'dd') = 17;


--ͨ�ú���
--ͨ�ú���--��ֵ������
--nvl��ֵ1,ֵ2��  ��ֵ1Ϊ�� �򷵻�ֵ2����֮����ֵ1
select nvl(commission_pct,0) from employees;
--nvl2��ֵ1��ֵ2��ֵ3��  ��ֵ1Ϊ�� �򷵻�ֵ3����֮����ֵ2
select nvl2(commission_pct,'��',0) from employees;
--nullif��ֵ1��ֵ2�� �ж���ֵ1 <> ֵ2���򷵻�ֵ1�����򷵻ؿ�
select nullif(3,3) from dual;
select nullif(3,4) from dual;



--���к��� ��n��1
