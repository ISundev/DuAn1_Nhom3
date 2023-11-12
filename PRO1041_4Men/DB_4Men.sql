
USE ASMJAVA3
GO
Drop database DuAn1_4Men
go
Create database DuAn1_4Men
go
Use DuAn1_4Men
go
------------TaiKhoan--------------------------------------------------
Create table TaiKhoan(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenDangNhap varchar(30),
	MatKhau varchar(15),
	VaiTro nvarchar(20),
	TrangThai BIT
)
-----
Insert into TaiKhoan(TenDangNhap,MatKhau,VaiTro,TrangThai) values('NV0001','1',N'Nhân Viên',0)
select * from TaiKhoan
-----

--------------NhanVien---------------
Create table NhanVien(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	MaNV varchar(30),
	HoTen nvarchar(40),
	GioiTinh nvarchar(10),
	NgaySinh date,
	DiaChi nvarchar(60),
	SDT varchar(15),
	Email varchar(30),
	TrangThai BIT	
)
--------
Insert into NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,Email,TrangThai) 
values('DEFCA3BB-BE3B-40BC-956E-471E7B88E554','NV0001',N'Lương Tuấn Đạt',N'Nam','2004-11-14',
N'Huyện Thanh Sơn tỉnh Phú Thọ','0974567728','Datltph32151@gmail.com',0)
select * from NhanVien
--------
--------Key------

Create table NhanVien_TaiKhoan(
	IDTaiKhoan VARCHAR(50) not null,
	IDNhanVien VARCHAR(50) not null
)



----------KhachHang
Create table KhachHang(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	MaKH varchar(30),
	HoTen nvarchar(40),
	NgaySinh date,
	GioiTinh nvarchar(10),
	DiaChi nvarchar(60),
	SDT varchar(15),
	Email varchar(30)
)

---------
Insert into KhachHang(MaKH,HoTen,NgaySinh,DiaChi,SDT,Email) 
values('KH0001',N'Lương Tuấn Đạt','2004-11-14',N'Huyện Thanh Sơn tỉnh Phú Thọ','0974567728','Datltph32151@gmail.com')
select * from KhachHang
----------


------LoaiGiamGia------
Create table LoaiGG(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenLoai nvarchar(40)
)
---------
insert into LoaiGG(TenLoai) values (N'Giảm giá theo số tiền')
insert into LoaiGG(TenLoai) values (N'Giảm giá theo %')
select * from LoaiGG
---------
-------GiamGia-------
Create table GiamGia(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDLoaiGG VARCHAR(50),
	MaGG varchar(30),
	Ten nvarchar(40),
	GiaTri float,
	NgayBatDau date,
	NgayHetHan date,
	GhiChu nvarchar(60),
	TrangThai BIT,
	FOREIGN KEY(IDLoaiGG) REFERENCES LoaiGG(ID)
)
-------

-------




-------PhuongThucThanhToan-------
Create table PhuongThucThanhToan(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenPTTT nvarchar(30)
)
-------HoaDon------------
Create table HoaDon(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDGG VARCHAR(50),
	IDNV VARCHAR(50),
	IDKH VARCHAR(50),
	IDPTTT VARCHAR(50),
	MaHD varchar(30),
	TongTienGiam float,
	ThoiGianTao date,
	ThoiGianThanhToan date,
	TongThanhToan float,
	TrangThai BIT,
	FOREIGN KEY(IDGG) REFERENCES GiamGia(ID),
	FOREIGN KEY(IDNV) REFERENCES NhanVien(ID),
	FOREIGN KEY(IDKH) REFERENCES KhachHang(ID),
	FOREIGN KEY(IDPTTT) REFERENCES PhuongThucThanhToan(ID)
)






--------SanPham-----

Create table SanPham(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	MaSP varchar(15),
	TenSP nvarchar(30),
	TrangThai BIT
)
-------ThuocTinhSanPham-------
Create table ThuongHieu(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenTH nvarchar(30)
)
Create table XuatXu(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenXX nvarchar(30)
)
Create table MauSac(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenMS nvarchar(30)
)
Create table ChatLieu(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenCL nvarchar(30)
)
Create table PhanLoai(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	TenPL nvarchar(30)
)

--------SanPhamChiTiet---------
Create table SanPhamChiTiet(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDCL VARCHAR(50),
	IDPL VARCHAR(50),
	IDTH VARCHAR(50),
	IDXX VARCHAR(50),
	IDMS VARCHAR(50),
	KhoiLuong float,
	Anh varchar(300),
	SoLuong int,
	MoTa nvarchar(100),
	KichThuoc varchar(15),
	Gia float,
	FOREIGN KEY(IDCL) REFERENCES ChatLieu(ID),
	FOREIGN KEY(IDPL) REFERENCES PhanLoai(ID),
	FOREIGN KEY(IDTH) REFERENCES ThuongHieu(ID),
	FOREIGN KEY(IDXX) REFERENCES XuatXu(ID),
	FOREIGN KEY(IDMS) REFERENCES MauSac(ID),
)
--------SanPham_SanPhamChiTiet-----------
Create table SanPham_SanPhamChiTiet(
	IDSanPham VARCHAR(50) not null,
	IDSanPhamChiTiet VARCHAR(50) not null
)

Create table HoaDonChiTiet(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDHD VARCHAR(50),
	IDSPCT VARCHAR(50),
	SoLuongSP int,
	GiaTien float,
	TongTienMua float,
	GhiChu nvarchar(60),
	FOREIGN KEY(IDHD) REFERENCES HoaDon(ID),
	FOREIGN KEY(IDSPCT) REFERENCES SanPhamChiTiet(ID)
)
--------DoiHang-------
Create table DoiHang(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDHD VARCHAR(50),
	IDKH VARCHAR(50),
	IDNV VARCHAR(50),
	ThoiGianDoi date,
	TrangThai BIT,
	FOREIGN KEY(IDHD) REFERENCES HoaDon(ID),
	FOREIGN KEY(IDKH) REFERENCES KhachHang(ID),
	FOREIGN KEY(IDNV) REFERENCES NhanVien(ID)
)


--------DoiHangChiTiet-------
Create table DoiHangChiTiet(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDDH VARCHAR(50),
	IDHDCT VARCHAR(50),
	IDSPCT VARCHAR(50),
	SoLuongDoi int,
	GiaDoi float,
	FOREIGN KEY(IDDH) REFERENCES DoiHang(ID),
	FOREIGN KEY(IDHDCT) REFERENCES HoaDonChiTiet(ID),
	FOREIGN KEY(IDSPCT) REFERENCES SanPhamChiTiet(ID)
)

--------PhieuDoi-------
Create table PhieuDoi(
	ID VARCHAR(50) PRIMARY KEY DEFAULT NEWID(),
	IDDH VARCHAR(50),
	MaPD varchar(15),
	TenPD nvarchar,
	ThoiGianDoi date,
	SoTien float,
	GhiChu nvarchar(60),
	FOREIGN KEY(IDDH) REFERENCES DoiHang(ID)
)