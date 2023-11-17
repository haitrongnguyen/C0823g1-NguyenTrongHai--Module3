select *
from nhan_vien
where substring_index(ho_ten,' ',-1) like 'H%'
or substring_index(ho_ten,' ',-1) like 'T%'
or substring_index(ho_ten,' ',-1) like 'K%';

select *
from khach_hang
where datediff(now(),ngay_sinh) >= 18 * 365
and dia_chi like "%Đà Nẵng" 
or dia_chi like '%Quảng Trị';




