create database demo;
use demo;

create table products(id int primary key auto_increment,
product_code varchar(20),
product_name varchar(50),
product_price bigint,
product_amount int,
product_description varchar(50),
product_status bit,
is_delete bit default 0);

insert into products(
product_code,
product_name,
product_price,
product_amount,
product_description,
product_status)
values ('p01','quat',50000,5,'quat',1),
('p02','quat',50000,5,'quat',0),
('p03','quat',50000,5,'quat',1),
('p04','quat',50000,5,'quat',1);

alter table products add unique index idx_products(product_code);

alter table products drop index idx_products;

alter table products add index idx_products_2(product_name,product_price);

alter table products drop index idx_products_2;

explain select * from products where product_code = 'p01';

explain select * from products where product_name = 'quat' and product_price = 2;

create view product_view as
select products.product_code,
products.product_name,
products.product_price,
products.product_status
from products;

select * from product_view;

update product_view
set product_name = 'tv'
where product_code = 'p01';

drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure product_procedure()
begin
select * from products;
end //
delimiter ;

call product_procedure();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(in product_code varchar(20),
in product_name varchar(50) ,
in product_price bigint,
in product_amount int,
in product_description varchar(50),
in product_status bit)
begin
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values (product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;

call add_new_product('p06','dien thoai',2000,1,'dien thoai',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product_by_id(in id int,
in product_code varchar(20),
in product_name varchar(50),
in product_price bigint,
in product_amount int,
in product_description varchar(50),
in product_status bit)
begin
-- insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
-- values (product_code,product_name,product_price,product_amount,product_description,product_status);
update products
set product_code = product_code,
product_name = product_name,
product_price = product_price,
product_amount=product_amount,
product_description = product_description,
product_status = product_status
where products.id = id;
end //
delimiter ;

call update_product_by_id(3,'p11','may tinh',100000,5,'may tinh',1);

set sql_safe_updates = 0;
set sql_safe_updates = 1;

call product_procedure();

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_by_id(in id int)
begin
delete from products
where products.id = id;
end //
delimiter ;

call delete_product_by_id(1);

call product_procedure();





