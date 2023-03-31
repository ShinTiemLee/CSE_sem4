set serveroutput on
declare 
pl_gpa studenttable.gpa%type;

begin

select gpa into pl_gpa from studenttable where rollno='&rollno';
dbms_output.put_line('GPA:'||pl_gpa);

end;
/