create or replace
function e5 (n number)
return number as
res number;
begin
	res:=n*n;
	return res;
end;
/
