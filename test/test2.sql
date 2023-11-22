alter table class
add mo_ta varchar(50);

alter table class
change mo_ta mo_ta1 varchar(50);

alter table class
drop column mo_ta1;

select substring_index('anh và em',' ',-2);