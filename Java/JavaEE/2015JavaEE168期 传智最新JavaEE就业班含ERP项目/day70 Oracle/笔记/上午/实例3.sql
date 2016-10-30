/*
SQL语句
部门：select deptno from dept; --> 循环
部门中员工的薪水：select sal from emp where deptno=??  --> 循环


变量：1. 初始值  2. 最终如何得到
每个段的人数
count1 number; count2 number; count3 number;
部门的工资总额
saltotal number := 0;
1. select sum(sal) into salTotal from emp where deptno=??
2. 累加
*/
set serveroutput on
declare
  --部门
  cursor cdept is select deptno from dept;
  pdeptno dept.deptno%type;
  
  --部门中员工的薪水
  cursor cemp(dno number) is select sal from emp where deptno=dno;
  psal emp.sal%type;
  --每个段的人数
  count1 number; count2 number; count3 number;
  --部门的工资总额
  saltotal number := 0;
begin
  --打开部门
  open cdept;
  loop
    --取一个部门
    fetch cdept into pdeptno;
    exit when cdept%notfound;
    
    --初始化
    count1:=0;count2:=0;count3:=0;
    --部门的工资总额
    select sum(sal) into salTotal from emp where deptno=pdeptno;
    
    --取部门中员工的薪水
    open cemp(pdeptno);
    loop
      -- 取一个员工的薪水
      fetch cemp into psal;
      exit when cemp%notfound;
      
      --判断
      if psal < 3000 then count1:=count1+1;
        elsif psal>=3000 and psal<6000 then count2:=count2 + 1;
        else count3:=count3+1;
      end if;
    end loop;
    close cemp;
  
    --保存当前的结果
    insert into msg values(pdeptno,count1,count2,count3,nvl(salTotal,0));
  
  end loop;
  close cdept;
  
  commit;
  dbms_output.put_line('完成');


end;
/
  
  
  
  
  
  
  
  
  