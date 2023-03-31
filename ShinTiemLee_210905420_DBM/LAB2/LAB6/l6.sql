-- creating and inserting table

create table studenttable( rollno numeric(3), gpa numeric(4,2));

insert into studenttable values(1, 5.8);
insert into studenttable values (2, 6.5);
insert into studenttable values (3, 3.4); 
insert into studenttable values(4,7.8);
insert into studenttable values (5, 9.5);

--1. Write a PL/SQL block to display the GPA of given student.
set serveroutput on
declare 
pl_gpa studenttable.gpa%type;

begin

select gpa into pl_gpa from studenttable where rollno='&rollno';
dbms_output.put_line('GPA:'||pl_gpa);

end;
/


--2. Write a PL/SQL block to display the letter grade(0-4: F; 4-5: E; 5-6: D; 6-7: C; 
7-8: B; 8-9: A; 9-10: A+} of given student.

set serveroutput on
declare 
pl_gpa studenttable.gpa%type;

begin

select gpa into pl_gpa from studenttable where rollno='&rollno';
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
end;
/



--3. Input the date of issue and date of return for a book. Calculate and display the fine 
with the appropriate message using a PL/SQL block. The fine is charged as per 
the table 8.1:

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
/


--4. Write a PL/SQL block to print the letter grade of all the students(RollNo: 1 - 5).
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

--5. Alter StudentTable by appending an additional column LetterGrade Varchar2(2). 
--Then write a PL/SQL block to update the table with letter grade of each student.

alter table studenttable add lettergrade varchar(2);


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