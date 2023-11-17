insert into class(class_name, start_date, `status`)
values ('A1','2008/12/20',1),
('A2','2008/12/22',1),
('A1',current_date(),0);

insert into student(student_name,address,phone,`status`,class_id)
values ('Hung','Ha Noi','0912113113',1,1),
('Hoa','Hai Phong','0912113113',1,1),
('Manh','HCM','0912113113',0,2);

insert into `subject`(sub_name,credit,`status`)
values ('CF',5,1),
('C',6,1),
('HDJ',5,1),
('RDBMS',10,1);

insert into mask(sub_id,student_id,mask,exam_times)
values (1,1,8,1),
(1,2,10,2),
(2,1,12,1);
