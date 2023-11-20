insert into customer(c_name,c_age)
values ('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50);

insert into `order`(c_id,o_date)
values (1,'2006/03/21'),
(2,'2006/3/23'),
(1,'2006/3/16');

insert into product(p_name,p_price)
values ('May giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into order_detail(o_id,p_id,od_qty)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select o_id,o_date,o_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select customer.c_name, group_concat(product.p_name)
from order_detail 
join `order` 
join product
join customer
on order_detail.o_id = `order`.o_id 
and order_detail.p_id = product.p_id 
and `order`.c_id = customer.c_id
group by customer.c_name;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select c_name
from customer 
left join `order`
on customer.c_id = `order`.c_id
where `order`.c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)

select `order`.o_id , `order`.o_date,
 sum(product.p_price * order_detail.od_qty)
from `order`
join order_detail
join product
on `order`.o_id = order_detail.o_id
and order_detail.p_id = product.p_id
group by `order`.o_id;


