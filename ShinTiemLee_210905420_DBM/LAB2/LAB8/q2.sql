set serveroutput on
declare 
	dept instructor.dept_name%type;
begin
	dept:='&dept';
	e2(dept);
end;
/