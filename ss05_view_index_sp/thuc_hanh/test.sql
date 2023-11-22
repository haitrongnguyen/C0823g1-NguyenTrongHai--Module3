DELIMITER //
create procedure check_lop1(in value1 int, out value2 varchar(50))
begin
set value2 = (select quan_li.name  from quan_li where id = value1);
end;
// delimiter ;

call check_lop1(1, @isPresent);
select @isPresent;

