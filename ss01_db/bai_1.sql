create database `student_management`;
use student_management;
CREATE TABLE class (
    class_id INT primary key auto_increment,
    `name` VARCHAR(50)
);
insert into class(name)
values ('C0823G1');
CREATE TABLE teacher (
    teacher_id INT primary key auto_increment,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50),
    class_id int,
    foreign key(class_id) references class(class_id)
);
insert into teacher(name,age,country,class_id)
values ('Jame',28,'Quảng Trị',1),
('Alan',30,'Huế',1),
('Walker',32,'Đà Nẵng',1);
select *
from teacher;
