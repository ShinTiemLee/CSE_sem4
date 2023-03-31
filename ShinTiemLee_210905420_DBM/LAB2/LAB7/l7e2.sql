/*
2. Write a PL/SQL block that will display the ID, name, dept_name and tot_cred of 
the first 10 students with lowest total credit.
*/

set serveroutput on
declare
	i numeric(2);
	cursor c is select * from student order by tot_cred asc;
	pl_stu student%rowtype;
begin
	open c;
		for i in 1..10 loop
			fetch c into pl_stu;
			dbms_output.put_line(pl_stu.id||' '||pl_stu.name||' '||pl_stu.dept_name||' '||pl_stu.tot_cred);
		end loop;
	close c;
end;
/



