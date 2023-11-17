select *
from student
inner join class
on student.class_id = class.class_id;

select *
from student
left join class
on student.class_id = class.class_id;

select *
from student
where student_name like '%hai' or student_name like '%huynh';

select *
from student
where student_name like 'nguyen%';

select count(student_point) as 'so luong',
student_point
from student
group by student_point;

select count(student_point),
student_point
from student
where student_point>5
group by student_point;

select count(student_point),
student_point
from student
where student_point>5
group by student_point
having count(student_point)>=2;

select student.student_name,class.class_name
from student
left join class 
on student.class_id = class.class_id
where class_name = 'c1121g1';
