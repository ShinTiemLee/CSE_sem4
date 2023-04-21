drop view advisor_student;

create view advisor_student as 
select advisor.s_id, advisor.i_id, student.name s_name, instructor.name i_name
from advisor, student, instructor where advisor.s_id = student.id and advisor.i_id = instructor.id;

create or replace trigger e5
instead of delete on advisor_student
begin 
    delete from advisor where s_id = :old.s_id and i_id = :old.i_id;
end;
/

commit; 
--to have a save to rollback to
select * from advisor; 
select * from advisor_student; 
--view old
delete from advisor_student where s_id = 98765 and i_id = 98345;
--delete
select * from advisor; 
--view new
rollback; 
--rollback to original data