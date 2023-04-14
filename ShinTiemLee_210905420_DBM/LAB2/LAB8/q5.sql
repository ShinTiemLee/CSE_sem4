set serveroutput on
declare 
	n number;
begin
	n:='&n';
	n:=e5(n);
	dbms_output.put_line(n);
end;
/