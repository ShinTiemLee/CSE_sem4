/*
1. The HRD manager has decided to raise the salary of all the Instructors in a given 
department number by 5%. Whenever, any such raise is given to the instructor, a 
record for the same is maintained in the salary_raise table. It includes the Instuctor 
Id, the date when the raise was given and the actual raise amount. Write a PL/SQL 
block to update the salary of each Instructor and insert a record in the salary_raise 
table.
salary_raise(Instructor_Id, Raise_date, Raise_amt)
*/

set serveroutput on
declare
	dept varchar(20);
	cursor c is (select * from instructor);	
	pl_instr instructor%ROWTYPE;
	sal numeric(8,2);
begin
	dept:='&dept';
	open c;
		loop
			fetch c into pl_instr;
				if (pl_instr.dept_name=dept) then
				sal:=pl_instr.salary*0.05;
				insert into salary_raise values(pl_instr.ID,CURRENT_DATE,sal);
				update instructor set salary =1.05*salary where id=pl_instr.ID;
				dbms_output.put_line('instructor_id '||pl_instr.id||' updated');
				end if;
				exit when c%NOTFOUND;
		end loop;
	close c;
end;
/













