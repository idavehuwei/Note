--查询并打印7839的姓名和薪水
set serveroutput on
declare
  --定义记录型变量：代表一行
  emp_rec emp%rowtype;
begin
  select * into emp_rec from emp where empno=7839;
  
  dbms_output.put_line(emp_rec.ename||'的薪水是'||emp_rec.sal);
end;
/