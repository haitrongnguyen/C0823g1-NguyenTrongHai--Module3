alter table quan_li
add is_delete bit default 0;

alter table quan_li
drop is_delete;

update quan_li
set is_delete = 1
where id = 1;

select *
from quan_li
where is_delete = 0;