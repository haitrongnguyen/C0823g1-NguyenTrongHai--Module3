insert into class(class_name,startdate,status)
values
 ('A1','2008-12-20',1),
('A2','2008-12-21',1),
('B3',current_date(),0);

drop table class;

set sql_safe_updates = 0;

set sql_safe_updates = 1;

select *
from class
where class_name like 'a1';

delete from class;

truncate class;

insert into student(student_name,adress,phone,status,class_id)
values ('Hung','Ha Noi','0912113113',1,1),
('Hoa','Hai Phong','',1,1),
('Manh','HCM','0912113113',0,2);