--打印Hello World
/*
调用存储过程:
1. exec sayhelloworld();

2. begin
       sayhelloworld();
       sayhelloworld();
    end;
    /

*/
create or replace procedure sayhelloworld
as
   --说明部分
begin
   dbms_output.put_line('Hello World');
end;
/