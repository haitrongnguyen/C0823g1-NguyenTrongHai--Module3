create database test;
use test;

create table quan_li(
id int,
name varchar(50),
lop varchar(20)
);

alter table quan_li add constraint pk primary key(id);

insert into quan_li(id ,name, lop )
values (1,'Hải','10'),
(2,'Hải','10'),
(3,'Hải','10'),
(4,'Hải','10');

update quan_li
set name = 'hoa'
where id = 2;

delete from quan_li
where id = 3;