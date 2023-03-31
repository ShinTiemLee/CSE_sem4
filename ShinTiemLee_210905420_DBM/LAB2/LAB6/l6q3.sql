set serveroutput on
declare 
iss date;
re date;
fine numeric(4);
interval numeric(4);

begin

iss:='&issueDate';
re:='&returnDate';
interval:=re - iss;

if interval<8 then
	dbms_output.put_line('Fine:NIL');
elsif interval <15 then
	fine:= interval - 7;
	dbms_output.put_line('Fine:'||fine);
elsif interval <31 then
	fine:= interval - 15;
	dbms_output.put_line('Fine:  '||fine*2);
else 
	dbms_output.put_line('Fine:5');
else 
end if;

end;
/