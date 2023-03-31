set serveroutput on
declare 
pl_gpa studenttable.gpa%type;
roll numeric(2);

begin

for roll in 1..5 loop
	select gpa into pl_gpa from studenttable where rollno=roll;
	if pl_gpa > 9 then
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
	dbms_output.new_line();
end loop;
end;
/