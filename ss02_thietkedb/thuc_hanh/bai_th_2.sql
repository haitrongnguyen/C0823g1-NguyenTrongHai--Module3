create table hocsinh(
ma_hs varchar(20) primary key,
ten_hs varchar(50),
ngaysinh datetime,
lop varchar(20),
gt varchar(20)
);

create table giaovien(
ma_gv varchar(20) primary key,
ten_gv varchar(50),
sdt varchar(20)
);

create table monhoc(
ma_mh varchar(20) primary key,
ten_mh varchar(50),
ma_gv varchar(20),
foreign key(ma_gv) references giaovien(ma_gv)
);

create table bangdiem(
ma_hs varchar(20) ,
ma_mh varchar(20) ,
diem_thi int,
ngay_kt datetime,
primary key(ma_hs,ma_mh),
foreign key(ma_hs) references hocsinh(ma_hs),
foreign key(ma_mh) references monhoc(ma_mh)
);

