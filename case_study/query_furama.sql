-- task 2

select *
from nhan_vien
where substring_index(ho_ten,' ',-1) like 'H%'
or substring_index(ho_ten,' ',-1) like 'T%'
or substring_index(ho_ten,' ',-1) like 'K%'
and char_length(nhan_vien.ho_ten) <= 15;

-- task 3
select *
from khach_hang
where datediff(now(),ngay_sinh) >= 18 * 365
and dia_chi like "%Đà Nẵng" 
or dia_chi like '%Quảng Trị';

-- task 4
select khach_hang.ho_ten, loai_khach.ten_loai_khach, count(*) as so_lan_dat_phong
from khach_hang
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach = 'Dinamond'
group by khach_hang.ho_ten, loai_khach.ten_loai_khach
order by so_lan_dat_phong;

-- task 6
select dv.ma_dich_vu, dv.ten_dich_vu, ldv.ten_loai_dich_vu, dv.dien_tich, dv.chi_phi_thue
from dich_vu dv
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where hd.ngay_lam_hop_dong >= '2021-04-01'
group by dv.ma_dich_vu;

-- task 7
select * from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021;
select
	dich_vu.ma_dich_vu as "Mã dịch vụ",
    dich_vu.ten_dich_vu as "Tên dịch vụ",
    dich_vu.dien_tich as "Diện tích",
    dich_vu.so_nguoi_toi_da as "Số người tối đa",
    dich_vu.chi_phi_thue as "Chi phí thuê",
    loai_dich_vu.ten_loai_dich_vu as "Loại dich vụ"
from dich_vu
	inner join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
    left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where
	hop_dong.ma_dich_vu is null
group by 
	dich_vu.ma_dich_vu;

-- Task 8

SELECT 
    khach_hang.ho_ten
FROM
    khach_hang
ORDER BY ho_ten;

SELECT 
    khach_hang.ho_ten
FROM
    khach_hang
ORDER BY ho_ten;

    
-- Task 9
select month(hd.ngay_lam_hop_dong) as `thang`, count(hd.ma_khach_hang) as `so_khach_hang`
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- Task 10
SELECT 
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    hop_dong.tien_dat_coc,
    SUM(IFNULL(hop_dong_chi_tiet.so_luong, 0)) AS so_luong_dich_vu_di_kem
FROM
    hop_dong
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;








