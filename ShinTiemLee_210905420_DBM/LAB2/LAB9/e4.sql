create or replace trigger e4 
before
	update or delete
on client_master
for each row
begin
case
when updating then
	update auditclient set name=:OLD.name, bal_due=:OLD.bal_due , operation='update',userid=1, opdate=current_date where client_no=1;
when deleting then
	update auditclient set name=:OLD.name, bal_due=:OLD.bal_due , operation='delete',userid=1, opdate=current_date where client_no=1;
end case;
end;
/


--insert into client_master values(1,'ronald','KA,udupi',500.5);
--insert into auditclient values(1,'ronald',500.5,'insert',1,current_date);
--update client_master set bal_due=1000 where client_no=1;