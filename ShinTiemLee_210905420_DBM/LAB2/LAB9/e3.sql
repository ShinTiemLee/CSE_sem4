create or replace trigger e3
before 
    insert 
on instructor
for each row
declare
sal number;
budg number;
begin
if length(trim(translate(:new.name,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ' '))) > 0 then
    raise_application_error(-20100,'name must contain only alphabets');
else
    if :new.salary < 1 then
        raise_application_error(-20100,'salary must be greater than 0');
    else
        select budget into budg from department where dept_name = :new.dept_name;
        if :new.salary > budg then
            raise_application_error(-20100,'not enough department budget'); 
        end if;
    end if;
end if;
end;
/

commit; 

select * from instructor; 

insert into instructor values('12345','newinstructor','Music',99999);
-- not enough department budget
insert into instructor values('12345','newinstructor12','music',20000);
-- name must contain only alphabets
insert into instructor values('12345','newinstructor','music',-30000);

select * from instructor; 

rollback; 
