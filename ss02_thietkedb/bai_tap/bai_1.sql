create database quan_li_xuat_nhap;
use quan_li_xuat_nhap;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table vat_tu(
ma_vtu int primary key auto_increment,
ten_vtu varchar(50)
);

create table phieu_nhap(
so_phieu_nhap int primary key auto_increment,
ngay_nhap date
);

create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(50),
dia_chi varchar(50)
);


create table don_dh(
so_dh int primary key auto_increment,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table so_dt(
ma_ncc int,
so_dt varchar(20),
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table phieu_xuat_vat_tu(
don_gia_xuat long,
so_luong_xuat int,
so_phieu_xuat int,
ma_vtu int,
foreign key(so_phieu_xuat) references phieu_xuat(so_px),
foreign key(ma_vtu) references vat_tu(ma_vtu),
primary key(so_phieu_xuat,ma_vtu)
);

create table phieu_nhap_vat_tu(
don_gia_nhap long,
so_luong_nhap int,
so_phieu_nhap int,
ma_vtu int,
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key(ma_vtu) references vat_tu(ma_vtu),
primary key(so_phieu_nhap,ma_vtu)
);

create table chi_tiet_dat_hang(
ma_vat_tu int,
so_dh int,
foreign key(ma_vat_tu) references vat_tu(ma_vtu),
foreign key(so_dh) references don_dh(so_dh),
primary key(ma_vat_tu,so_dh)
);