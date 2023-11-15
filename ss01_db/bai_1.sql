create database `student_management`;
use student_management;
CREATE TABLE class (
    id INT,
    `name` VARCHAR(50)
);
CREATE TABLE teacher (
    id INT,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);