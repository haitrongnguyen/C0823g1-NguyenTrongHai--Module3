create table student(
id int primary key auto_increment,
`name` varchar(50),
birthday date,
gender bit,
class_id int,
foreign key(class_id) references class(class_id)
);
create table class(
class_id int primary key auto_increment,
`name` varchar(50)
);