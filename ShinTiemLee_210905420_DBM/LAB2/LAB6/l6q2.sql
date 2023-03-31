set serveroutput on
declare 
pl_gpa studenttable.gpa%type;

begin

select gpa into pl_gpa from studenttable where rollno='&rollno';
if pl_gpa > '9' then
	dbms_output.put_line('Grade:A+');
elsif pl_gpa > 8 then
	dbms_output.put_line('Grade:A');
elsif pl_gpa > 7 then
	dbms_output.put_line('Grade:B');
elsif pl_gpa > 6 then
	dbms_output.put_line('Grade:C');
elsif pl_gpa > 5 then
	dbms_output.put_line('Grade:D');
elsif pl_gpa > 4 then
	dbms_output.put_line('Grade:E');
else 
	dbms_output.put_line('Grade:F');
end if;
end;
/