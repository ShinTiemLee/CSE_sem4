create or replace trigger e2
before 
	update of salary 
on instructor
for each row
begin
insert into old_data_instructor values (:old.id, :old.name, :old.dept_name, :old.salary);
end;
/

-- to test --

commit; 
--to have a save to rollback to
select * from instructor where id = 12121; 
--view old
update instructor set salary = salary * 1.5 where id = 12121; 
--update
select * from instructor where id = 12121; 
--view after updating
select * from old_data_instructor; 
--see output from trigger
rollback;