create database `student_management`;
use student_management;
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);
insert into class(name)
values ('C0823G1');
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
insert into teacher(name,age,country,class_id)
values ('Jame',28,'Quảng Trị',1),
('Alan',30,'Huế',1),
('Walker',32,'Đà Nẵng',1);
SELECT 
    *
FROM
    teacher;
