--Thêm Tên DATAbase 
go
create table NhanHang_SP(
	Id_Nh int identity(1,1)   primary key,
	TenNhanHang nvarchar(100)  ,
);
go
create table size_SP(
	Id_Sz int identity(1,1)   primary key ,
	Size varchar(10)  ,
);
go
create table color_SP(
	Id_Mau int identity(1,1)   primary key,
	color nvarchar(100)  
);
go
create table ChatLieu_SP(
	Id_Cl int identity(1,1)   primary key,
	ChatLieu nvarchar(100)
);
go

create table KhachHang(
	Id_KhachHang int identity(1,1) primary key,
	HoTen nvarchar(50),
	SDT nvarchar(10),
);
create table roles(
	Id_role int identity(1,1) primary key,
	chucVu nvarchar(50),
);
go
create table sanPham(
	IdSanPham int identity(1,1) primary key,
	TenSP nvarchar(50)  ,
	Gia money  ,
	MoTa nvarchar(200) ,
	soLuong int  ,
	Id_NhanHang int not null  references NhanHang_SP(Id_Nh),
	Id_ChatLieu int not null  references ChatLieu_SP(Id_Cl),
	Id_Size int references size_SP(Id_Sz),
	Id_Color int  references color_SP(Id_Mau),
	Hinh nvarchar(max),
);
Create table NhanVien(
	Id_NVien int identity(1,1) primary key,
	Id_role int not null references roles(Id_role),
	HoTen nvarchar(50),
	NgaySinh date,
	Email nvarchar(250),
	SDT nvarchar(13),
	DiaChi nvarchar(100),
	Taikhoan nvarchar(20),
	Matkhau nvarchar(20),
);

go

create table HoaDon(--không--
    Id_HoaDon int identity(1,1) primary key,
	so int,
	TrangThai bit default(0),
	NgayTao date default getdate(),
);

go
create table HoaDonChiTiet (--không--
    Id_HDCT int identity(1,1) primary key,
	TenCuaHang nvarchar(max) default(N'Cửa Hàng ....'),
	Hotline nvarchar(10) default('1900.5999'),
	Id_SanPham int not null references sanPham(IdSanPham),
	TenSP nvarchar(max),
	SoLuong int,
	Size varchar(5),
	Color nvarchar(max),
    DonGia money,
	ChietKhau money,
	Id_NhanVien int not null references NhanVien(Id_NVien),
	Id_HoaDon int not null references HoaDon(Id_HoaDon),
    TrangThai bit default(0),
	NgayTao date default getdate(),
	TongTien Money,
);
go
create table DoiTra(--không--
	Id_DoiTra int identity(1,1) primary key,
	Id_NhanVien int not null references NhanVien(Id_NVien), 
	Id_KhachHang int not null references KhachHang(Id_KhachHang),
	Id_SanPham int not null references sanPham(IdSanPham),
	Id_HDCT int not null references HoaDonChiTiet(Id_HDCT),
	Id_HoaDon int not null references HoaDon(Id_HoaDon),
	TenSP nvarchar(max),
	SoLuong int,
    DonGia money,
	TrangThai bit default(0),
	NgayTao date default getdate(),
	TongTien Money,
);


insert into size_SP values
('XS'),
('S'),
('M'),
('L'),
('Xl'),
('XXL'),
('3XL')

insert into color_SP values
(N'Xanh'),
(N'Đỏ'),
(N'Tím'),
(N'Vàng'),
(N'Hồng pastel'),
(N'Hồng Đậm'),
(N'Nâu'),
(N'Đen'),
(N'Đỏ Đô'),
(N'Xanh Coban'),
(N'Xanh Navy'),
(N'Xanh Chuối'),
(N'Xám'),
(N'Be'),
(N'Xanh Rêu'),
(N'Cam')

insert into NhanHang_SP values
(N'Julido'),
(N'levents'),
(N'ADNV'),
(N'BBR'),
(N'Thome')

insert into ChatLieu_SP values
(N'3158'),
(N'Cotton 100%'),
(N'Lanh'),
(N'KaKi')


insert into KhachHang values
(N'Phạm Văn Toàn','0974559897'),
(N'Phạm Văn Toàn','0865344586'),
(N'Mai Xuân Trung','0382946315')

insert into roles values
('admin'),
('Nv'),
('Kho')

insert into NhanVien values
(1,N'Phạm Văn A','2000-02-5','nguyenvana@gmail.com','0147258369',N'Hà Nội','admin','1'),
(2,N'Phạm Văn B','2000-12-02','nguyenvanb@gmail.com','0258369147',N'Nam Định','nv1','1'),
(3,N'Phạm Văn C','2000-06-28','nguyenvanc@gmail.com','0321654987',N'Bắc Ninh','kho1','1'),
(2,N'Phạm Văn D','2000-8-10','nguyenvand@gmail.com','0753159264',N'Thái Bình','nv2','1')

insert into sanPham values 
(N'Áo Phông Trơn','150000',N'Áo Phông mang phong cách hiện đại, đơn giản','100',1,1,null,null,null),
(N'Áo Phông Hoạ Tiết','99000',N'Áo Phông mang phong cách HipHop','56',2,2,null,null,null),
(N'Áo Phông Thể Thao','125000',N'Áo Phông mang phong cách năng động, trẻ trung','50',3,3,null,null,null),
(N'Áo Phông Thời Trang','159000',N'Áo Phông mang phong cách Thể thao, năng động','25',4,4,null,null,null)

select * from sanPham