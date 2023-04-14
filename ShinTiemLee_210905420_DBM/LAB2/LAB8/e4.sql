create or replace 
procedure e4(dept instructor.dept_name%TYPE) is
	i1 student.name%type;
	i1 teaches.course_id%type;
	cursor c1 is select name from student where dept_name=dept;
	cursor c2 is (select course_id from teaches natural join instructor where dept_name=dept);
begin
	for i1 in c1
	loop
		dbms_output.put_line('');
		dbms_output.put_line(i1.name);
	end loop;
	for i2 in c2
	loop
		dbms_output.put_line('');
		dbms_output.put_line(i2.course_id);
	end loop;
end;
/
