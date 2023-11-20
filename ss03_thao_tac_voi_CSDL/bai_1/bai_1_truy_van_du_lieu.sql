select student_name
from student
where substring_index(student_name,' ',-1) like 'h%';

select *
from class
where month(start_date) = '12';

select *
from subject
where credit between 3 and 5;

set sql_safe_updates = 0;
update student
set class_id = 2
where student_name = 'Hung';
set sql_safe_updates = 1;

select student_name, sub_name, mask
from mask join student 
join `subject`
where mask.sub_id = subject.sub_id 
and mask.student_id = student.student_id
order by mask desc, student_name;

