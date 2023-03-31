/*
4. Find all students who take the course with Course-id: CS101 and if he/ she has 
less than 30 total credit (tot-cred), deregister the student from that course. (Delete 
the entry in Takes table)
*/

set serveroutput on;
declare
	cursor c is (select * from takes where course_id='CS-101');
	stu takes%rowtype;
	cred student.tot_cred%type;
begin
	for stu in c loop
		select tot_cred into cred from student where id=stu.id;
		if cred<30 then
			delete from takes where id=stu.id;
			dbms_output.put_line('removed');
		end if;
	end loop;
end;
/