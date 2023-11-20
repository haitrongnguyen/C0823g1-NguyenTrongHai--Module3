-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where credit in
(select max(credit)
from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.*
from subject
join mask
on subject.sub_id = mask.sub_id
where mask.mask in
(select max(mask.mask)
from mask);

--  Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*,
avg(ifnull(mask.mask,0))
from student
left join mask
on student.student_id = mask.student_id
group by student_id
order by avg(mask.mask) desc;

