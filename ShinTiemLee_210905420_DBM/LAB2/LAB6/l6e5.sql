set serveroutput on
declare 
pl_gpa studenttable.gpa%type;
roll numeric(2);

begin

for roll in 1..5 loop
	select gpa into pl_gpa from studenttable where rollno=roll;
	if pl_gpa > 9 then
		update studenttable set lettergrade ='A+' where rollno=roll;
	elsif pl_gpa > 8 then
		update studenttable set lettergrade ='A' where rollno=roll;
	elsif pl_gpa > 7 then
		update studenttable set lettergrade ='B' where rollno=roll;
	elsif pl_gpa > 6 then
		update studenttable set lettergrade ='C' where rollno=roll;
	elsif pl_gpa > 5 then
		update studenttable set lettergrade ='D' where rollno=roll;
	elsif pl_gpa > 4 then
		update studenttable set lettergrade ='E' where rollno=roll;
	else 
		update studenttable set lettergrade ='F' where rollno=roll;
	end if;
	dbms_output.new_line();
end loop;
end;
/