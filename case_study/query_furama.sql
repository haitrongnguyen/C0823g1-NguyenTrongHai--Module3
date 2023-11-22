-- task 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *
from nhan_vien
where ho_ten like 'H%'
or ho_ten like 'T%'
or ho_ten like 'K%'
and char_length(nhan_vien.ho_ten) <= 15;

-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where datediff(curdate(),ngay_sinh)/365 between 18 and 50
and dia_chi like '%Đà Nẵng' 
or dia_chi like '%Quảng Trị';

-- task 4 	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang,khach_hang.ho_ten, loai_khach.ten_loai_khach, count(*) as so_lan_dat_phong
from khach_hang
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach = 'Dinamond'
group by khach_hang.ma_khach_hang -- khach_hang.ho_ten, loai_khach.ten_loai_khach
order by so_lan_dat_phong;

-- task 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
select khach_hang.ma_khach_hang, 
khach_hang.ho_ten, 
khach_hang.ma_loai_khach,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong, 
dich_vu.ten_dich_vu, 
hop_dong.ngay_lam_hop_dong, 
hop_dong.ngay_ket_thuc, 
sum(chi_phi_thue + ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0))
from khach_hang
join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.ma_loai_khach,loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc
order by khach_hang.ma_khach_hang;

-- task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,
dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from hop_dong
right join dich_vu
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
right join loai_dich_vu
on dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
where hop_dong.ngay_lam_hop_dong > '20210331'
group by hop_dong.ma_dich_vu;

-- task 7	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,
dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where year(hop_dong.ngay_lam_hop_dong) = 2020 
and hop_dong.ma_dich_vu not in
(select hop_dong.ma_dich_vu
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021)
group by dich_vu.ma_dich_vu; 

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich,
dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where year(hop_dong.ngay_lam_hop_dong) = 2020
and hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(hop_dong.ngay_lam_hop_dong) = 2021)
group by dich_vu.ma_dich_vu;

-- Task 8 Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select ho_ten
from khach_hang
group by ho_ten;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

select distinct ho_ten
from khach_hang;


    
-- Task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong),
count(hop_dong.ma_khach_hang)
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by month(hop_dong.ngay_lam_hop_dong)
order by month(hop_dong.ngay_lam_hop_dong);

-- Task 10	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc,
sum(ifnull(hop_dong_chi_tiet.so_luong,0))
from hop_dong
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
right join hop_dong_chi_tiet
on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join khach_hang
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = 'Dinamond'
and khach_hang.dia_chi like '% Vinh'
or khach_hang.dia_chi like '% Quảng Ngãi';

-- task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai,
dich_vu.ten_dich_vu, hop_dong.tien_dat_coc, sum(ifnull(hop_dong_chi_tiet.so_luong,0))
from hop_dong
left join nhan_vien
on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
left join khach_hang
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where month(hop_dong.ngay_lam_hop_dong) in (10,11,12)
and year(hop_dong.ngay_lam_hop_dong) = 2020
and hop_dong.ngay_lam_hop_dong not between '20210101' and '20210630'
-- month(hop_dong.ngay_lam_hop_dong) not in (1,2,3,4,5,6)
-- and year(hop_dong.ngay_lam_hop_dong) <> 2021
group by hop_dong.ma_hop_dong;

-- task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem,sum(hop_dong_chi_tiet.so_luong) as 'so lan dat'
from hop_dong_chi_tiet
left join dich_vu_di_kem
on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) =
(select sum(hop_dong_chi_tiet.so_luong)
from hop_dong_chi_tiet
left join dich_vu_di_kem
on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
order by sum(hop_dong_chi_tiet.so_luong) desc
limit 1);

-- task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, 
-- ten_dich_vu_di_kem, so_lan_su_dung  (được tính dựa trên việc count các ma_dich_vu_di_kem).
SET 
sql_mode = 0;
SET 
sql_mode = 1;
-- select hop_dong_chi_tiet.ma_hop_dong,dich_vu.ma_dich_vu,dich_vu_di_kem.ten_dich_vu_di_kem, count(dich_vu_di_kem.ma_dich_vu_di_kem)
-- from hop_dong_chi_tiet
-- left join dich_vu_di_kem
-- on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
-- join hop_dong
-- on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
-- left join dich_vu
-- on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
-- group by hop_dong_chi_tiet.ma_dich_vu_di_kem
-- having count(dich_vu_di_kem.ma_dich_vu_di_kem) = 1;

select hop_dong_chi_tiet.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu,dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.ma_dich_vu_di_kem)
from hop_dong_chi_tiet
join hop_dong
on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join dich_vu_di_kem
on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
group by dich_vu_di_kem.ten_dich_vu_di_kem
having count(hop_dong_chi_tiet.ma_dich_vu_di_kem) = 1;



-- task 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.ma_trinh_do, nhan_vien.ma_bo_phan,
nhan_vien.so_dien_thoai, nhan_vien.dia_chi, count(hop_dong.ma_nhan_vien) as 'so hop dong da ki'
from nhan_vien
left join trinh_do
on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
left join bo_phan
on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
right join hop_dong
on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
group by nhan_vien.ma_nhan_vien
having count(hop_dong.ma_nhan_vien) <= 3;

-- task 16	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;
SET sql_safe_updates = 1;

delete from nhan_vien
where nhan_vien.ma_nhan_vien not in
(select hop_dong.ma_nhan_vien
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021);


-- task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ

SET 
sql_mode = 0;
SET 
sql_mode = 1;

select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia)
from khach_hang
left join loai_khach
on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong) = 2021 
and loai_khach.ten_loai_khach = 'Platinium'
group by khach_hang.ma_khach_hang
having sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) > 10000000;

-- task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

SET SQL_SAFE_UPDATES=0;
SET SQL_SAFE_UPDATES=1;
SET FOREIGN_KEY_CHECKS=0; 
SET FOREIGN_KEY_CHECKS=1; 

delete from khach_hang
where khach_hang.ma_khach_hang in
(select hop_dong.ma_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) < 2021);

-- task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem in
(select hop_dong_chi_tiet.ma_dich_vu_di_kem
from hop_dong_chi_tiet
join hop_dong
on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) > 10);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nhan_vien.ma_nhan_vien,
nhan_vien.ho_ten,
nhan_vien.email,
nhan_vien.so_dien_thoai,
nhan_vien.ngay_sinh,
nhan_vien.dia_chi
from nhan_vien
union
select khach_hang.ma_khach_hang,
khach_hang.ho_ten,
khach_hang.email,
khach_hang.so_dien_thoai,
khach_hang.ngay_sinh,
khach_hang.dia_chi
from khach_hang;















