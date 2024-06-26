create database QLBHGiacMoSuaViet
go
use QLBHGiacMoSuaViet
go

--TẠO BẢNG CHỨC VỤ
create table ChucVu
(
	MaCV	nchar(5)		NOT NULL, 
	TenCV	nvarchar(100)	NOT NULL,
	constraint pk_MaCV_ChucVu primary key(MaCV)
)
go 

--TẠO BẢNG NHÂN VIÊN
create table NhanVien
(
	MaNV		nchar(5)		NOT NULL, 
	HoNV		nvarchar(100)	NOT NULL,
	TenNV		nvarchar(50)	NOT NULL,
	GioiTinhNV	nvarchar(10)	NOT NULL, 
	NgSinhNV	datetime		NOT NULL,
	DiachiNV	nvarchar(100)	NOT NULL,
	SdtNV		nchar(10)		NOT NULL,
	CCCDNV		nchar(12)		NOT NULL,
	EmailNV		nvarchar(50)	NOT NULL,	
	MaCV		nchar(5)		NOT NULL,
	constraint pk_MaNV_NhanVien primary key (MaNV),
	constraint fk_MaCV_NhanVien 
	foreign key(MaCV) references ChucVu(MaCV)	
)
alter table NhanVien
add constraint ck_GioiTinh_NhanVien check(GioiTinhNV in('Nam',N'Nữ'))

go 
--TẠO BẢNG LOẠI SẢN PHẨM
create table LoaiSanPham
(
	MaLoaiSP	nchar(4)		NOT NULL, 
	TenLoaiSP	nvarchar(100)	NOT NULL,
	constraint pk_MaLoaiSP_LoaiSanPham 
	primary key (MaLoaiSP)
)
go
--TẠO BẢNG SẢN PHẨM
create table SanPham
(
	MaSP		nchar(5)		NOT NULL,
	TenSP		nvarchar(100)	NOT NULL,
	SoLuongTon	int				NOT NULL,
	DonViTinh	nvarchar(10)	NOT NULL,
	DgBan		float			NOT NULL,
	DgNhap		float			NOT NULL,
	MaLoaiSP	nchar(4)		NOT NULL,
	constraint pk_MaSP_SanPham primary key(MaSP) ,
	constraint fk_MaLoaiSP_SanPham
	foreign key(MaLoaiSP)references LoaiSanPham(MaLoaiSP)
)
go 
--TẠO BẢNG NHÓM KHÁCH HÀNG
create table NhomKhachHang
(
	MaNhomKH	nchar(4)		NOT NULL,
	TenNhomKH	nvarchar(100)	NOT NULL,
	constraint pk_MaNhomKH_NhomKhachHang 
	primary key (MaNhomKH)
)
--TẠO BẢNG KHÁCH HÀNG
create table KhachHang
(
	MaKH		nchar(5)		NOT NULL,
	HoKH		nvarchar(100)	NOT NULL,
	TenKH		nvarchar(50)	NOT NULL,
	GioiTinhKH	nvarchar(10),  
	NgSinhKH	datetime,
	DiaChiKH	nvarchar(100), 
	SdtKH		nchar(10), 
	CCCDKH		nchar(12),
	EmailKH		nvarchar(50),
	MaNhomKH	nchar(4)		NOT NULL,
	constraint pk_MaKH_KhachHang primary key(MaKH) ,
	constraint fk_MaNhomKH_KhachHang 
	foreign key(MaNhomKH)references NhomKhachHang(MaNhomKH)
)
alter table KhachHang
add constraint ck_GioiTinh_KhachHang check(GioiTinhKH in('Nam',N'Nữ'))

go
--TẠO BẢNG HÓA ĐƠN
create table HoaDon
(
	MaHD		nchar(5)	NOT NULL,
	MaNV		nchar(5)	NOT NULL,
	MaKH		nchar(5)	NOT NULL,
	NgayBanHang datetime	NOT NULL,
	PTTT		nvarchar(20) NOT NULL,
	constraint pk_MaHD_HoaDon primary key (MaHD),
	constraint fk_MaNV_HoaDon 
	foreign key(MaNV) references NhanVien(MaNV),
	constraint fk_MaKH_HoaDon 
	foreign key(MaKH)references KhachHang(MaKH)
)
go 
--TẠO BẢNG CHI TIẾT HÓA ĐƠN
create table ChiTietHoaDon
(
	MaHD	nchar(5)	NOT NULL,
	MaSP	nchar (5)	NOT NULL,
	SLBan	int			NOT NULL,
	DgBan	float		NOT NULL,
	primary key(MaHD, MaSP),
	constraint fk_MaHD_ChiTietHoaDon 
	foreign key(MaHD) references HoaDon(MaHD),
	constraint fk_MaSP_ChiTietHoaDon 
	foreign key(MaSP)references SanPham(MaSP)
)
go 

--TẠO BẢNG PHIẾU NHẬP KHO
create table PhieuNhapKho
(
	MaPhieuNK		nchar(5)		NOT NULL,
	NgayNK			datetime,
	NgayDH			datetime,	
	MaNV			nchar(5)		NOT NULL,
	Constraint PK_PhieuNhapKho 
	Primary Key (MaPhieuNK),
	Constraint FK_PhieuNhapKho_NhanVien 
	Foreign Key (MaNV) references NhanVien (MaNV)	
)

--TẠO BẢNG CHI TIẾT PHIẾU NHẬP KHO
create table CTPhieuNhapKho
(
	MaPhieuNK	nchar(5)		NOT NULL,	
	MaSP		nchar(5)		NOT NULL,
	SoLuongNhap	int				NOT NULL,	
	DgNhap		float			NOT NULL,
	Constraint PK_CTPhieuNhapKho_MaNK_MaMH 
	Primary Key (MaPhieuNK, MaSP),
	Constraint FK_CTPhieuNhapKho_PhieuNhapKho 
	Foreign Key (MaPhieuNK) references PhieuNhapKho (MaPhieuNK),
	Constraint FK_CTPhieuNhapKho_SanPham 
	Foreign Key (MaSP) references SanPham(MaSP)
)

insert into ChucVu
values 
	('CV001',N'Nhân viên thu ngân'),
	('CV002',N'Nhân viên tư vấn'),
	('CV003',N'Nhân viên kho'),
	('CV004',N'Nhân viên trưởng ca'),
	('CV005',N'Trưởng cửa hàng')

insert into NhanVien
values
	('NV001',N'Nguyễn Anh',N'Thư',N'Nữ',convert (datetime,'5/4/1997'),N'Lô C, phòng 28, chung cư Thanh Đa','092987987','213487659323',N'thunguyent@gmail.com','CV001'),
	('NV002',N'Nguyễn Minh',N'An',N'Nam',convert (datetime,'04/07/2002'),N'255 Trần Hưng Đạo','092678546','231475869001',N'minhan@gmail.com','CV002'),
	('NV003',N'Nguyễn Bá',N'Điền',N'Nam',convert (datetime,'12/12/1995'),N'12 Nguyễn Trãi','086241325','123357835790',N'diennguyen@gmail.com','CV003'),
	('NV004',N'Trần Thị',N'Minh',N'Nữ',convert (datetime,'2/11/1996'),N'33 Hùng Vương','093567922','332214562100',N'minhminh@gmail.com','CV001'),
	('NV005',N'Nguyễn Trúc',N'Quỳnh',N'Nữ',convert (datetime,'09/09/1999'),N'30/1 Trần Phú','091152311','315214562152',N'quynh23@gmail.com','CV004'),
	('NV006',N'Lê Ngọc',N'Ánh',N'Nữ',convert (datetime,'11/07/1990'),N'178/97 An Dương Vương','091234234','223567619123',N'ngocanhn@gmail.com','CV005'),
	('NV007',N'Phạm Thị Anh',N'Thư',N'Nữ',convert (datetime,'12/03/1999'),N'369 Thủ Khoa Huân','091198367','333647890112',N'anhthu@gmail.com','CV001'),
	('NV008',N'Huỳnh Trọng Bảo',N'Như',N'Nữ',convert (datetime,'10/10/1997'),N'12 Tuyên Quang','086812987','352907679122',N'baonhu@gmail.com','CV002'),
	('NV009',N'Huỳnh Huy',N'Đức',N'Nam',convert (datetime,'12/01/1997'),N'67 Kỳ Đồng','090984561','443488629382',N'duchuy@gmail.com','CV001'),
	('NV010',N'Nguyễn Lan',N'Anh',N'Nữ',convert (datetime,'3/12/1996'),N'313 Lê Lợi','093518723','612487659123',N'anhlan@gmail.com','CV003'),
	('NV011',N'Nguyễn Thị Tuyết',N'Nhi',N'Nữ',convert (datetime,'01/09/1997'),N'33 Phan Bội Châu','084312451','213487659323',N'nhinguyen@gmail.com','CV003'),
	('NV012',N'Nguyễn Anh',N'Đức',N'Nam',convert (datetime,'03/12/1995'),N'551 Phan Chu Trinh','088993457','551378129042',N'anhduc@gmail.com','CV001'),
	('NV013',N'Lê Văn',N'Vũ',N'Nam',convert (datetime,'12/10/1995'),N'11/2 Hải Thượng Lan Ông','086814982','782124676103',N'vanvule@gmail.com','CV001'),
	('NV014',N'Ngô Tấn',N'Tài',N'Nam',convert (datetime,'08/02/1994'),N'119 Từ Văn Tư','089012331','614367518900',N'ngotantai@gmail.com','CV002'),
	('NV015',N'Nguyễn Thị',N'Xinh',N'Nữ',convert (datetime,'05/04/1992'),N'123/36 Phạm Văn Đồng','092267431','763447659120',N'nguyenxinh@gmail.com','CV002'),
	('NV016',N'Trần Quốc',N'Việt',N'Nam',convert (datetime,'05/04/1993'),N'10 Nguyễn Tất Thành','091926500','813288654323',N'quocviet11@gmail.com','CV002'),
	('NV017',N'Ngô Ngọc',N'Ánh',N'Nữ',convert (datetime,'12/09/1994'),N'62 Ngô Quyền','092276517','290143217811',N'ngocanhhi@gmail.com','CV004'),
	('NV018',N'Lê Tuyết',N'Anh',N'Nữ',convert (datetime,'09/03/1993'),N'411 Phan Đình Giót','090978123','563247809812',N'tuyetanhh@gmail.com','CV003'),
	('NV019',N'Phạm Quốc',N'Bảo',N'Nam',convert (datetime,'04/12/1992'),N'21 Võ Thị Sáu','098121347','137709213443',N'baonam@gmail.com','CV002'),
	('NV020',N'Lê Quỳnh',N'Như',N'Nữ',convert (datetime,'03/06/1999'),N'144 Lê Văn Việt','099187134','220678915677',N'quynhnhu@gmail.com','CV004')

insert into LoaiSanPham
values 
	('LSP1',N'Sữa'),
	('LSP2',N'Sữa chua'),
	('LSP3',N'Nước trái cây'),
	('LSP4',N'Kem'),
	('LSP5',N'Sữa bột'),
	('LSP6',N'Sữa đặc')
	
insert into SanPham
values
	('SP001',N'Sữa tươi nguyên chất thanh trùng Nhãn hiệu Vinamilk 100% Sữa tươi',200,N'Lốc',32000,29000,'LSP1'),
	('SP002',N'Sữa tươi thanh trùng có đường Nhãn hiệu Vinamilk 100% Sữa tươi',190,N'Lốc',32500,29500,'LSP1'),
	('SP003',N'Sữa tươi tiệt trùng có đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',195,N'Lốc',32700,29700,'LSP1'),
	('SP004',N'Sữa tươi tiệt trùng ít đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',182,N'Lốc',32700,29700,'LSP1'),
	('SP005',N'Sữa tươi tiệt trùng rất ít đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',145,N'Lốc',32700,29700,'LSP1'),
	('SP006',N'Sữa tươi tiệt trùng không đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',160,N'Lốc',32700,29700,'LSP1'),
	('SP007',N'Sữa tươi tiệt trùng Socola Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',120,N'Lốc',33000,30000,'LSP1'),
	('SP008',N'Sữa tươi tiệt trùng hương dâu Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%',133,N'Lốc',33000,30000,'LSP1'),
	('SP009',N'Sữa tươi nguyên chất tách béo tiệt trùng Nhãn hiệu Vinamilk 100% sữa tươi',210,N'Lốc',34000,32000,'LSP1'),
	('SP010',N'Sữa bột nguyên kem có đường - Vinamilk Dinh dưỡng',195,N'Hộp',32000,295000,'LSP5'),
	('SP011',N'Sữa uống dinh dưỡng - Dielac Grow Plus (xanh)',122,N'Hộp',250000,225000,'LSP1'),
	('SP012',N'Sữa Uống Dinh Dưỡng - Dielac Grow Plus - có Tổ Yến',165,N'Hộp',37200,355000,'LSP1'),
	('SP013',N'Sữa Đậu Nành Hạnh Nhân - Vinamilk',195,N'Lốc',40000,38000,'LSP1'),
	('SP014',N'Sữa chua uống men sống - Probi',220,N'Lốc',25000,23700,'LSP2'),
	('SP015',N'Sữa chua uống men sống hương dâu - Probi',235,N'Lốc',25000,23700,'LSP2'),
	('SP016',N'Sữa chua uống men sống hương dưa gang - Probi',198,N'Lốc',25000,23700,'LSP2'),
	('SP017',N'Sữa chua uống men sống hương việt quất - Probi',195,N'Lốc',32000,30200,'LSP2'),
	('SP018',N'Sữa chua uống tiệt trùng nha đam - Vinamilk Yomilk',180,N'Lốc',30000,27700,'LSP2'),
	('SP019',N'Sữa chua uống tiệt trùng lựu đỏ - Vinamilk Yomilk',90,N'Lốc',30000,27700,'LSP2'),
	('SP020',N'Sữa chua uống tiệt trùng hương cam - Vinamilk Yomilk',115,N'Lốc',30000,27700,'LSP2'),
	('SP021',N'Sữa chua uống tiệt trùng hương dâu - Vinamilk Yomilk',123,N'Lốc',27000,25700,'LSP2'),
	('SP022',N'Sữa chua ít đường - Vinamilk',210,N'Lốc',24000,22500,'LSP2'),
	('SP023',N'Sữa chua có đường - Vinamilk',200,N'Lốc',24000,22500,'LSP2'),
	('SP024',N'Sữa chua không đường - Vinamilk',192,N'Lốc',24000,22500,'LSP2'),
	('SP025',N'Sữa chua nha đam - Vinamilk',195,N'Lốc',28500,26300,'LSP2'),
	('SP026',N'Sữa Đậu Nành - Vinamilk Gấp Đôi Canxi',162,N'Lốc',28500,26000,'LSP1'),
	('SP027',N'Sữa Đậu Nành không đường - Vinamilk Gấp Đôi Canxi',155,N'Lốc',28500,30000,'LSP1'),
	('SP028',N'Sữa Đậu Nành ít đường - Vinamilk Gấp Đôi Canxi',155,N'Lốc',28500,30000,'LSP1'),
	('SP029',N'Sữa Đậu Nành rất ít đường - Vinamilk Gấp Đôi Canxi',155,N'Lốc',28500,30000,'LSP1'),
	('SP030',N'Sữa đặc có đường bổ sung dầu thực vật',162,N'Lốc',28500,30000,'LSP6'),
	('SP031',N'Nước cam ép - Nhãn hiệu Vfresh',153,N'Hộp',38600,36000,'LSP3'),
	('SP032',N'Nước nho ép - Nhãn hiệu Vfresh',162,N'Hộp',38500,35500,'LSP3'),
	('SP033',N'Nước đào (42% đào ép) - Nhãn hiệu Vfresh',200,N'Hộp',40000,37500,'LSP3'),
	('SP034',N'Nước ổi (25% ổi ép) - Nhãn hiệu Vfresh',177,N'Hộp',45300,42000,'LSP3'),
	('SP035',N'NƯỚC ÉP LỰU TÁO - VFRESH',160,N'Hộp',36600,34500,'LSP3'),
	('SP036',N'Kem Ốc Quế Dâu Nam Việt Quất - Delight',126,N'Cây',18500,16000,'LSP4'),
	('SP037',N'Kem Ốc Quế Sôcôla Đậu Phộng - Delight',132,N'Cây',18500,16000,'LSP4'),
	('SP038',N'Kem vani - Vinamilk',182,N'Hộp',51500,48000,'LSP4'),
	('SP039',N'Kem đậu xanh - Vinamilk',99,N'Hộp',51000,46500,'LSP4'),
	('SP040',N'Kem sôcôla - Vinamilk',110,N'Hộp',51000,46500,'LSP4')

insert into NhomKhachHang
values
	('KHVP',N'Khách hàng VIP'),
	('KHTR',N'Khách hàng trung thành'),
	('KHTT',N'Khách hàng thân thiết'),
	('KHTN',N'Khách hàng tiềm năng'),
	('KHML',N'Khách hàng mua lẻ')

insert into KhachHang
values 
	('KH001',N'Nguyễn Duy',N'Mạnh',N'Nam',convert (datetime,'09/02/2000'),N'21 Nguyễn Trãi','094321566','321526712143','manhnguyen@gmail.com','KHTT'),
	('KH002',N'Võ Khánh',N'Dung',N'Nữ',convert (datetime,'10/16/2001'),N'1765A Bình Dương','083978224','107210045211','khanhdung@gmail.com','KHML'),
	('KH003',N'Lê Phương Trà',N'Vy',N'Nữ',convert (datetime,'08/01/2000'),N'18 Lam Sơn','083950423','312158789120','travy@gmail.com','KHVP'),
	('KH004',N'Trần Minh',N'Hạnh',N'Nữ',convert (datetime,'02/07/1999'),N'313 Thủ Khoa Huân','091567902','656679123521','minhhanh@gmail.com','KHML'),
	('KH005',N'Nguyễn Phan Thảo',N'Nguyên',N'Nữ',convert (datetime,'07/07/1997'),N'68 Hồ Xuân Hương','091139717','783267119012','thaonguyen@gmail.com','KHTN'),
	('KH006',N'Phạm Nguyễn Phúc',N'Thịnh',N'Nữ',convert (datetime,'11/08/1998'),N'900 Kha Vạn Cân','096278122','528813299002','phucthinh@gmail.com','KHTN'),
	('KH007',N'Ngô Thiên',N'An',N'Nữ',convert (datetime,'11/22/1992'),N'12 Phan Đình Giót','099265334','468815237299','thienan@gmail.com','KHTT'),
	('KH008',N'Trần Trung',N'Kiên',N'Nam',convert (datetime,'10/30/2000'),N'31 Nguyễn Hội','091462358','225173809266','trungkien22@gmail.com','KHTT'),
	('KH009',N'Nguyễn Ngọc Minh',N'Thư',N'Nữ',convert (datetime,'10/4/2000'),N'41 đường số 19','083841456','154500127805','minthu@gmail.com','KHTT'),
	('KH010',N'Nguyễn Duy',N'Khải',N'Nam',convert (datetime,'06/12/2000'),N'22/1 Nguyễn Thái Học','064387821','400113255121','duykhai@gmail.com','KHTN'),
	('KH011',N'Võ Khánh',N'Như',N'Nữ',convert (datetime,'04/15/2003'),N'92 Nguyễn Hữu Cảnh','082212331','475945001032','khanhnhu@gmail.com','KHTT'),
	('KH012',N'Triệu Nguyễn Thủy',N'Tiên',N'Nữ',convert (datetime,'04/20/1986'),'61/3 Võ Thị Sáu','094456121','310456247889','ttien@gmail.com','KHTN'),
	('KH013',N'Nguyễn Triệu',N'Duy',N'Nam',convert (datetime,'05/24/1997'),N'78 Lê Văn Việt','083945526','300951116722','trieuduy@gmail.com','KHTN'),
	('KH014',N'Nguyễn Thị Thảo',N'Linh',N'Nữ',convert (datetime,'12/11/1977'),N'41B Nguyễn Tất Thành','090985333','227356901123',null,'KHVP'),
	('KH015',N'Huỳnh Trọng Bảo',N'Trân',N'Nữ',convert (datetime,'06/12/1999'),N'23 Nguyễn Huệ','093167829','146676751432','tranhuynh12@gmail.com','KHML'),
	('KH016',N'Trần Cẩm',N'Tuyến',N'Nữ',convert (datetime,'09/01/2000'),N'323 Phạm Văn Đồng','090200356','613256774003','tuyencam@gmail.com','KHML'),
	('KH017',N'Nguyễn',N'Nhân',N'Nam',convert (datetime,'09/10/2002'),N'22/1 Nguyễn Văn Bá','096514378','345005824561','nguyennhan356@gmail.com','KHML'),
	('KH018',N'Lê Minh',N'Sang',N'Nam',convert (datetime,'07/08/2001'),N'681 Trần Hưng Đạo','087512672','451162349023','lesang@gmail.com','KHTT'),
	('KH019',N'Lê Bảo Minh',N'Thư',N'Nữ',convert (datetime,'06/11/2000'),N'23 Nguyễn Trãi','093971785','400558832982','minhthule@gmail.com','KHTN'),
	('KH020',N'Lê Quỳnh',N'Như',N'Nữ',convert (datetime,'03/23/2002'),N'82/3 Hùng Vương','094920156','313267724590','lenhuquynh@gmail.com','KHTR')

insert into HoaDon
values 
	('HD001','NV001','KH001',convert (datetime,'04/15/2022'),N'Tiền mặt'),
	('HD002','NV004','KH002',convert (datetime,'12/21/2022'),N'Tiền mặt'),
	('HD003','NV007','KH003',convert (datetime,'06/30/2022'),N'Chuyển khoản'),
	('HD004','NV009','KH004',convert (datetime,'08/11/2022'),N'Chuyển khoản'),
	('HD005','NV012','KH005',convert (datetime,'05/10/2022'),N'Tiền mặt'),
	('HD006','NV013','KH006',convert (datetime,'07/02/2022'),N'Chuyển khoản'),
	('HD007','NV013','KH007',convert (datetime,'02/05/2023'),N'Tiền mặt'),
	('HD008','NV005','KH008',convert (datetime,'01/08/2023'),N'Tiền mặt'),
	('HD009','NV017','KH009',convert (datetime,'04/11/2022'),N'Tiền mặt'),
	('HD010','NV020','KH010',convert (datetime,'03/24/2023'),N'Chuyển khoản'),
	('HD011','NV007','KH011',convert (datetime,'06/29/2022'),N'Tiền mặt'),
	('HD012','NV001','KH012',convert (datetime,'04/25/2022'),N'Chuyển khoản'),
	('HD013','NV004','KH013',convert (datetime,'12/30/2022'),N'Tiền mặt'),
	('HD014','NV012','KH014',convert (datetime,'11/11/2022'),N'Chuyển khoản'),
	('HD015','NV017','KH015',convert (datetime,'03/01/2023'),N'Chuyển khoản'),
	('HD016','NV020','KH016',convert (datetime,'05/06/2022'),N'Chuyển khoản'),
	('HD017','NV001','KH017',convert (datetime,'09/28/2022'),N'Tiền mặt'),
	('HD018','NV009','KH018',convert (datetime,'07/27/2022'),N'Tiền mặt'),
	('HD019','NV009','KH019',convert (datetime,'07/29/2022'),N'Chuyển khoản'),
	('HD020','NV012','KH020',convert (datetime,'08/31/2022'),N'Tiền mặt'),
	('HD021','NV001','KH001',convert (datetime,'04/15/2022'),N'Tiền mặt'),
	('HD022','NV004','KH005',convert (datetime,'12/21/2022'),N'Tiền mặt'),
	('HD023','NV007','KH007',convert (datetime,'06/30/2022'),N'Chuyển khoản'),
	('HD024','NV009','KH009',convert (datetime,'08/11/2022'),N'Chuyển khoản'),
	('HD025','NV012','KH009',convert (datetime,'05/10/2022'),N'Tiền mặt'),
	('HD026','NV013','KH010',convert (datetime,'07/02/2022'),N'Chuyển khoản'),
	('HD027','NV013','KH011',convert (datetime,'02/05/2023'),N'Tiền mặt'),
	('HD028','NV005','KH014',convert (datetime,'01/08/2023'),N'Tiền mặt'),
	('HD029','NV017','KH020',convert (datetime,'04/11/2022'),N'Tiền mặt'),
	('HD030','NV020','KH008',convert (datetime,'03/24/2023'),N'Chuyển khoản')

insert into ChiTietHoaDon
values 
	('HD001', 'SP001', 5, 32000),
	('HD001', 'SP003', 5, 32700),
	('HD001', 'SP011', 20, 250000),
	('HD002', 'SP002', 20, 32500),
	('HD003', 'SP021', 15, 250000),
	('HD003', 'SP012', 15, 27000),
	('HD003', 'SP004', 30, 32700),
	('HD004', 'SP014', 15, 25000),
	('HD005', 'SP005', 30, 32700),
	('HD006', 'SP024', 30, 24000),
	('HD006', 'SP025', 10, 28500),
	('HD006', 'SP034', 10, 45300),
	('HD007', 'SP035', 30, 36600),
	('HD007', 'SP037', 30, 18500),
	('HD008', 'SP027', 20, 28500),
	('HD008', 'SP038', 20, 51500),
	('HD008', 'SP028', 20, 28500),
	('HD009', 'SP020', 30, 30000),
	('HD010', 'SP031', 5, 38600),
	('HD010', 'SP033', 5, 40000),
	('HD011', 'SP032', 20, 38500),
	('HD012', 'SP023', 30, 24000),
	('HD012', 'SP032', 20, 38500),
	('HD013', 'SP013', 30, 40000),
	('HD014', 'SP009', 15, 34000),
	('HD015', 'SP022', 15, 24000),
	('HD016', 'SP015', 30, 25000),
	('HD017', 'SP026', 15, 28500),
	('HD018', 'SP007', 30, 33000),
	('HD018', 'SP017', 20, 32000),
	('HD018', 'SP036', 30, 18500),
	('HD019', 'SP022', 20, 24000),
	('HD019', 'SP018', 20, 30000),
	('HD020', 'SP008', 30, 33000),
	('HD020', 'SP040', 20, 51000),
	('HD021', 'SP039', 5, 51000),
	('HD021', 'SP018', 20, 30000),
	('HD022', 'SP019', 20, 30000),
	('HD023', 'SP029', 15, 28500),
	('HD023', 'SP030', 15, 28500),
	('HD023', 'SP008', 30, 33000),
	('HD024', 'SP010', 15, 32000),
	('HD025', 'SP006', 30, 32700),
	('HD026', 'SP016', 30, 25000),
	('HD026', 'SP028', 10, 28500),
	('HD026', 'SP034', 10, 45300),
	('HD027', 'SP035', 30, 36600),
	('HD027', 'SP037', 30, 18500),
	('HD028', 'SP011', 25, 250000),
	('HD028', 'SP008', 10, 33000),
	('HD029', 'SP022', 20, 24000),
	('HD029', 'SP020', 30, 30000),
	('HD030', 'SP001', 5, 32000),
	('HD030', 'SP033', 5, 40000)
	
insert into PhieuNhapKho(MaPhieuNK, NgayNK, NgayDH, MaNV)
values
	
	('PN001', convert (datetime,'02/13/2023'), convert (datetime,'01/13/2023'), 'NV003'),
	('PN002', convert (datetime,'02/22/2023'), convert (datetime,'01/11/2023'), 'NV010'),
	('PN003', convert (datetime,'02/20/2023'), convert (datetime,'01/15/2023'), 'NV011'),
	('PN004', convert (datetime,'12/15/2022'), convert (datetime,'11/10/2022'), 'NV018'),
	('PN005', convert (datetime,'01/26/2023'), convert (datetime,'12/26/2022'), 'NV003'),
	('PN006', convert (datetime,'01/30/2023'), convert (datetime,'12/15/2022'), 'NV018'),
	('PN007', convert (datetime,'02/16/2023'), convert (datetime,'01/14/2023'), 'NV018'),
	('PN008', convert (datetime,'03/03/2023'), convert (datetime,'02/20/2023'), 'NV010'),
	('PN009', convert (datetime,'03/05/2023'), convert (datetime,'02/21/2023'), 'NV011'),
	('PN010', convert (datetime,'02/27/2023'), convert (datetime,'01/27/2023'), 'NV003'),
	('PN011', convert (datetime,'02/19/2023'), convert (datetime,'01/21/2023'), 'NV011'),
	('PN012', convert (datetime,'02/13/2023'), convert (datetime,'01/27/2023'), 'NV010'),
	('PN013', convert (datetime,'02/09/2023'), convert (datetime,'01/25/2023'), 'NV018'),
	('PN014', convert (datetime,'02/09/2023'), convert (datetime,'01/23/2023'), 'NV011'),
	('PN015', convert (datetime,'02/06/2023'), convert (datetime,'01/28/2023'), 'NV003'),
	('PN016', convert (datetime,'02/15/2023'), convert (datetime,'01/11/2023'), 'NV003'),
	('PN017', convert (datetime,'03/25/2023'), convert (datetime,'02/11/2023'), 'NV011'),
	('PN018', convert (datetime,'03/17/2023'), convert (datetime,'02/27/2023'), 'NV010'),
	('PN019', convert (datetime,'03/23/2023'), convert (datetime,'01/30/2023'), 'NV011'),
	('PN020', convert (datetime,'03/31/2023'), convert (datetime,'02/25/2023'), 'NV018')
	
insert into CTPhieuNhapKho(MaPhieuNK, MaSP, SoLuongNhap, DgNhap)
values

	('PN001', 'SP020', 20, 3500000),
	('PN001', 'SP001', 20, 3500000),
	('PN002', 'SP011', 15, 5250000),
	('PN002', 'SP021', 20, 3500000),
	('PN003', 'SP031', 15, 1000000),
	('PN003', 'SP002', 20, 3500000),
	('PN004', 'SP022', 10, 2400000),
	('PN004', 'SP032', 20, 3500000),
	('PN005', 'SP012', 10, 2000000),
	('PN005', 'SP003', 20, 3500000),
	('PN006', 'SP013', 10, 1000000),
	('PN006', 'SP023', 20, 3500000),
	('PN006', 'SP033', 20, 500000),
	('PN007', 'SP004', 70, 2040000),
	('PN007', 'SP014', 20, 3500000),
	('PN008', 'SP024', 20, 500000),
	('PN008', 'SP034', 20, 3500000),
	('PN009', 'SP005', 20, 1500000),
	('PN009', 'SP025', 20, 3500000),
	('PN010', 'SP015', 5, 450000),
	('PN010', 'SP035', 20, 3500000),
	('PN010', 'SP006', 20, 500000),
	('PN011', 'SP026', 20, 120000),
	('PN011', 'SP022', 20, 3500000),
	('PN011', 'SP016', 20, 500000),
	('PN012', 'SP036', 100, 2600000),
	('PN012', 'SP007', 20, 3500000),
	('PN013', 'SP017', 50, 2800000),
	('PN013', 'SP027', 20, 3500000),
	('PN014', 'SP037', 60, 4400000),
	('PN014', 'SP008', 20, 3500000),
	('PN015', 'SP018', 20, 500000),
	('PN015', 'SP028', 20, 500000),
	('PN016', 'SP038', 50, 3500000),
	('PN016', 'SP009', 20, 500000),
	('PN017', 'SP019', 50, 2500000),
	('PN017', 'SP029', 20, 500000),
	('PN017', 'SP039', 20, 500000),
	('PN018', 'SP010', 5, 380000),
	('PN018', 'SP030', 20, 500000),
	('PN019', 'SP040', 5, 1200000),
	('PN019', 'SP011', 20, 500000),
	('PN020', 'SP002', 5, 700000),
	('PN020', 'SP030', 20, 500000)
	
	
-----------------------------------------------------------

--------------------SYNONYM

--VD1: Tạo Synonym cho bảng Khách hàng 

	CREATE SYNONYM Customers FOR dbo.KhachHang

--Kiểm thử
	SELECT*FROM Customers
 
--VD2: Tạo Synonym cho bảng Chi tiết hóa đơn

	CREATE SYNONYM CTHD FOR dbo.ChiTietHoaDon

--Kiểm thử
	SELECT*FROM CTHD
	

--------------------INDEX

--VD1: Tạo Index cho cột Mã sản phẩm, Tên sản phẩm và Số lượng tồn của bảng Sản phẩm với số lượng tồn trên 150(Đa cột)

	CREATE INDEX SanPham_Composite_idx 
	ON SanPham(MaSP, TenSP, SoLuongTon)
	WHERE SoLuongTon > 150
	
--Kiểm thử
	SELECT *
	FROM SanPham
	WHERE SoLuongTon > 150

--So sánh với cột đã tạo Index
	SELECT * 
	FROM SanPham
	WITH(INDEX(SanPham_Composite_idx))
	WHERE SoLuongTon > 150

--VD2: Tạo Index cho cột Phương thức thanh toán của bảng Hóa đơn với phương thức thanh toán là chuyển khoản(Cột đơn)

	CREATE INDEX HoaDon_SingleColumn_idx
	ON HoaDon(PTTT)
	WHERE PTTT = N'Chuyển khoản'

--Kiểm thử
	SELECT * FROM HOADON
	WHERE PTTT = N'Chuyển khoản'

--So sánh với cột đã tạo Index 
	SELECT * FROM HOADON
	WITH(INDEX(HoaDon_SingleColumn_idx))
	WHERE PTTT = N'Chuyển khoản'
	

--------------------VIEW

--VD1: Tạo view vwNhanVienNu hiện thị thông tin những nhân viên có giới tính là nữ

	CREATE VIEW vwNhanVienNu AS 
	SELECT *
	FROM NhanVien
	WHERE GioiTinhNV = N'Nữ'

--Kiểm thử

	SELECT * FROM vwNhanVienNu


--VD2: Tạo View vwSoLuongTon cho biết tổng số lượng tồn của theo từng loại sản phẩm

	CREATE VIEW vwSoLuongTon AS 
	SELECT TenLoaiSP, SUM(SoLuongTon) AS [Tong so luong ton] 
	FROM SanPham SP JOIN LoaiSanPham LSP  
	ON SP.MaLoaiSP=LSP.MaLoaiSP
	GROUP BY TenLoaiSP

--Kiểm thử
	SELECT * FROM vwSoLuongTon

--VD3: Tạo View vwHoaDonBan cho biết thông tin những hóa đơn đã bán bao gồm số lương bán và đơn giá bán 
--từ đầu tháng 8/2022 đến cuối tháng 3/2023

	CREATE VIEW vwHoaDonBan AS
	SELECT HD.MaHD, MaNV, MaKH, NgayBanHang, PTTT, SLBan, DgBan 
	FROM HoaDon HD JOIN ChiTietHoaDon CTHD 
	ON HD.MaHD = CTHD.MaHD
	WHERE NgayBanHang BETWEEN '2022-08-01' AND '2023-03-31'

--Kiểm thử
	SELECT * FROM vwHoaDonBan 

--VD4: Tạo View vwTop3DoanhThuHoaDon cho biết top 3 thông tin hóa đơn có Doanh thu cao nhất với doanh thu = số lượng bán * giá bán 

	CREATE VIEW vwTop3DoanhThuHoaDon AS
	SELECT TOP 3 HD.MaHD, MaNV, MaKH, NgayBanHang, PTTT, (SLBan*DgBan) [Doanh Thu]
	FROM HoaDon HD JOIN ChiTietHoaDon CTHD 
	ON HD.MaHD = CTHD.MaHD
	ORDER BY (SLBan*DgBan) DESC

--Kiểm thử
	SELECT * FROM vwTop3DoanhThuHoaDon

--VD5: Tạo View vwTop1KhachHangVIP cho biết thông tin Khách hàng có tổng tiền mua hàng nhiều nhất
--trong nhóm Khách hàng VIP có mã nhóm là 'KHVP'

	CREATE VIEW vwTop1KhachHangVIP AS
	SELECT TOP 1 KH.MaKH, HoKH+' '+TenKH AS HoTenKH, GioiTinhKH, DiaChiKH, SdtKH, EmailKH, 
			SUM(SLBan*DgBan) AS TongTien
	FROM KhachHang KH JOIN HoaDon HD ON KH.MAKH=HD.MAKH
	JOIN ChiTietHoaDon CT ON HD.MaHD=CT.MaHD
	WHERE KH.MaKH IN 
		(SELECT MaKH 
		FROM NhomKhachHang NKH JOIN KhachHang KH ON KH.MaNhomKH=NKH.MaNhomKH WHERE NKH.MaNhomKH = 'KHVP')
	GROUP BY KH.MaKH, HoKH+' '+TenKH, GioiTinhKH, DiaChiKH, SdtKH, EmailKH
	ORDER BY SUM(SLBan*DgBan) DESC

--Kiểm thử
	SELECT * FROM vwTop1KhachHangVIP
	
	

----------STORE PROCEDURE

--VD1: Tạo thủ tục SP_DSHoaDonThang3Nam2023 cho biết danh sách Hóa đơn bán hàng trong tháng 3 năm 2023

	CREATE PROC SP_DSHoaDonThang3Nam2023 AS 
	SELECT *
	FROM HoaDon
	WHERE MONTH(NgayBanHang)= 3 AND YEAR(NgayBanHang)=2023

--Kiểm thử
	EXEC SP_DSHoaDonThang3Nam2023

--VD2: Tạo thủ tục SP_Top3SanPhamTonKho cho biết top 3 sản phẩm có số lượng tồn nhiều nhất

	CREATE PROC SP_Top3SanPhamTonKho AS 
	SELECT TOP 3 MaSP, TenSP, SoLuongTon 
	FROM SanPham 
	ORDER BY SoLuongTon DESC

--Kiểm thử
	EXEC SP_Top3SanPhamTonKho

--VD3: Tạo thủ tục xem thông tin nhân viên với mã nhân viên là tham số truyền vào 
	CREATE PROC SP_ThongTinNhanVien @MaNV nchar(5)
	AS
		SELECT *
		FROM NhanVien
		WHERE @MaNV=MaNV

	EXEC SP_ThongTinNhanVien 'NV001'

--VD4: Tạo thủ tục SP_XemSoLuongTontheoMaSP xem số lượng tồn của một sản phẩm, nếu SoLuongTon >0 thì thông báo "Sản phẩm còn!",
--ngược lại thông báo "Sản phẩm đã hết!", với mã sản phẩm do người dùng nhập

	CREATE PROC SP_XemSoLuongTontheoMaSP @MaSP nchar(5)
	AS 
		DECLARE @SoLuongTon int
		SELECT @SoLuongTon=SoLuongTon
		FROM SanPham
		WHERE MaSP = @MaSP 
		IF @soluongton>0
			BEGIN
			PRINT N'Sản phẩm còn!'
			PRINT N'Số lượng tồn là: '+cast (@SoLuongTon AS nvarchar(10))
			END
		ELSE
			PRINT N'Sản phẩm đã hết!'

--Kiểm thử
	EXEC SP_XemSoLuongTontheoMaSP 'SP001'

--VD5: Tạo thủ tục SP_SLKHtheoMaNhomKH xem số lượng khách hàng theo mã nhóm khách hàng mà người dùng nhập vào

	CREATE PROC SP_SLKHtheoMaNhomKH (@MaNhomKH nchar(4))
	AS
	BEGIN 
		DECLARE @SoKH INT
		IF EXISTS (SELECT MaNhomKH FROM NhomKhachHang WHERE MaNhomKH=@MaNhomKH)
		BEGIN
			SET @SoKH = (SELECT COUNT(MaKH)
			FROM KhachHang KH, NhomKhachHang NKH
			WHERE KH.MaNhomKH=@MaNhomKH AND KH.MaNhomKH=NKH.MaNhomKH
			GROUP BY NKH.MaNhomKH) 
		END 
		PRINT N'Số khách hàng thuộc nhóm ' + @MaNhomKH + N' là:  ' + CAST(@SoKH AS nchar(10))
	END

--Kiểm thử
	EXEC SP_SLKHtheoMaNhomKH 'KHTN'

--VD6: Tạo thủ tục update thông tin khách hàng với tham số truyền vào là mã khách hàng, họ tên khách hàng, số điện thoại, email

	CREATE PROC SP_UpdateTTKhachHang (@MaKH nchar(5), @HoKH nvarchar(100),@TenKH nvarchar(50), 
				@SdtKH nchar(10), @EmailKH nvarchar(50))
	AS
	BEGIN
		IF EXISTS (SELECT * FROM dbo.KhachHang WHERE MaKH=@MaKH)
		BEGIN
			UPDATE KhachHang
			SET HoKH=@HoKH,TenKH=@TenKH,SdtKH=@SdtKH, EmailKH=@EmailKH
			WHERE MaKH=@MaKH
		END
		ELSE
		PRINT N'Không tìm thấy mã khách hàng '+@MaKH+N'. Vui lòng kiểm tra và nhập lại !'
	END

--Kiểm thử
	EXEC SP_UpdateTTKhachHang 'KH001',N'Nguyễn Phước',N'Đông','0362991122','phdong@gmail.com'

--Kiểm tra lại thông tin khách hàng vừa thêm
	SELECT *
	FROM KhachHang
	WHERE MaKH='KH001'
	


----------FUNCTION

--VD1: Tạo hàm tính tiền lãi cho từng sản phẩm bán ra theo công thức (Đơn giá bán - Đơn giá nhập )*Số lượng sản phẩm bán ra
--với mã sản phẩm là tham số truyền vào

	CREATE FUNCTION f_TienLaitheoSP (@MaSP nchar(5))
	RETURNS INT AS 
	BEGIN 
		DECLARE @TienLai INT
		SELECT @TienLai=SUM((CT.DgBan-DgNhap)*SLBan)
		FROM SanPham SP JOIN ChiTietHoaDon CT ON SP.MaSP=CT.MaSP
		WHERE CT.MaSP=@MaSP
		GROUP BY CT.MaSP
		RETURN @TienLai
	END

--Kiểm thử
	SELECT dbo.f_TienLaitheoSP('SP002') AS TienLai

--VD2: Tạo hàm cho biết số lượng đơn hàng theo từng khách hàng gồm các thông tin mã khách hàng, họ tên khách hàng, số điện thoại, email, số lượng đơn đặt hàng
	CREATE FUNCTION f_SLHoaDongcuaKH()
	RETURNS TABLE AS 
	RETURN(
		SELECT KH.MaKH, HoKH, TenKH, COUNT(HD.MaHD) AS [So Luong Don Hang]
		FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH=HD.MaKH
		GROUP BY KH.MaKH, HoKH, TenKH )

--Kiểm thử
	SELECT * FROM f_SLHoaDongcuaKH()


----------TRIGGER

--VD1: Tạo Trigger TG_DonGia để kiểm tra đơn giá bán phải lớn hơn đơn giá nhập

	CREATE TRIGGER TG_DonGia
	ON SanPham
	FOR INSERT, UPDATE
	AS
	IF EXISTS (SELECT * FROM inserted WHERE inserted.DgBan<inserted.DgNhap)
	BEGIN
		PRINT N'Đơn giá bán phải lớn hơn đơn giá nhập!'
		ROLLBACK TRAN
	END

--Kiểm tra nhập sai 
	INSERT INTO SanPham VALUES ('SP041',N'Sữa tươi loai mới',100,N'Lốc',25000,29000,'LSP1')

--Kiểm tra nhập đúng
	INSERT INTO SanPham VALUES ('SP041',N'Sữa tươi loai mới',100,N'Lốc',35000,29000,'LSP1')	

--VD2:  Tạo Trigger TG_NgayDHnhohonbangNgayNK để kiểm tra ngày đặt hàng phải nhỏ hơn hoặc bằng ngày nhập kho

	CREATE TRIGGER TG_NgayDHnhohonbangNgayNK
	ON PhieuNhapKho
	FOR INSERT, UPDATE
	AS
		DECLARE @f bit
		SET @f=1
		IF EXISTS (SELECT*FROM inserted WHERE NgayDH>NgayNK)
		BEGIN
			PRINT(N'Ngày đặt hàng <= ngày nhập kho')
			SET @f=0
			ROLLBACK TRAN
		END
		IF @f=0 ROLLBACK TRAN

--Kiểm thử nhập SAI
	UPDATE PhieuNhapKho 
	SET NgayDH='2023-02-25',
		NgayNK='2023-02-20'
	WHERE MaPhieuNK='PN003' AND MaNV='NV011'

--Kiểm thử nhập Đúng
	UPDATE PhieuNhapKho 
	SET NgayDH='2023-02-25',
		NgayNK='2023-02-27'
	WHERE MaPhieuNK='PN003' AND MaNV='NV011'

-- VD3: Tạo Trigger TG_SoLuongTon để kiểm tra Số lượng tồn của sản phẩm phải lớn hơn hoặc bằng 0
	create trigger TG_SoLuongTon
	on SanPham
	for insert, update
	as
		if exists (Select *
					from inserted
					where inserted.SoLuongTon<0)
		begin
			print(N'Số lượng tồn phải lớn hơn hoặc bằng 0 ');
			rollback tran;
		end;
--Kiểm thử nhập SAI
	UPDATE SanPham 
	SET SoLuongTon = -5
	WHERE MaSP = 'SP021'

--Kiểm thử nhập Đúng
	UPDATE SanPham 
	SET SoLuongTon = 125
	WHERE MaSP = 'SP021'


--VD4: Tạo Trigger TG_SoLuongBan để kiểm tra số lượng bán phải nhỏ hơn hoặc bằng số lượng tồn
	create trigger TG_SoLuongBan
	On ChiTietHoaDon
	For insert, update
	As
		If exists (select *
					from inserted join SanPham on inserted.MaSP = SanPham.MaSP
					where inserted.SLBan > SanPham.SoLuongTon)
		begin
			print(N'Số lượng bán hàng phải nhỏ hơn hoặc bằng số lượng tồn')
			rollback tran
		end
--Kiểm thử nhập SAI
	UPDATE ChiTietHoaDon
	SET SLBan = 100
	WHERE MaHD = 'HD021'
--Kiểm thử nhập Đúng
	UPDATE ChiTietHoaDon
	SET SLBan = 10
	WHERE MaHD = 'HD021'
	
	
----------USER

--CỬA HÀNG TRƯỞNG

--Tạo nhóm quyền
	USE QLBHGiacMoSuaViet
	CREATE ROLE XemDuLieuHeThong

--Cấp quyền xem cho nhóm
	GRANT SELECT TO XemDuLieuHeThong
	

--Tạo tài khoản đăng nhập
	CREATE LOGIN owner WITH PASSWORD='ow123',
	DEFAULT_DATABASE = QLBHGiacMoSuaViet

--Tạo người dùng
	CREATE USER owner FOR LOGIN owner

--Thêm User 'owner' vào nhóm XemDuLieu
	Sp_addRoleMember 'XemDuLieuHeThong','owner'


--NHÂN VIÊN 

----NHÂN VIÊN TRƯỞNG CA ------

--Tạo Login cho Nhân viên trưởng ca
	CREATE LOGIN ad WITH PASSWORD='ad123',
	DEFAULT_DATABASE= QLBHGiacMoSuaViet
--Tạo User Nhân viên trưởng ca
	CREATE USER ad FOR LOGIN ad
--Cấp quyền cho Nhân viên trưởng ca
	--Cấp quyền xem bảng KhachHang
	GRANT SELECT ON KhachHang To ad
	--Cấp quyền xem bảng NhomKhachHang
	GRANT SELECT ON NhomKhachHang To ad
	--Cấp quyền xem bảng HoaDon
	GRANT SELECT ON HoaDon To ad
	--Cấp quyền xem bảng ChiTietHoaDon
	GRANT SELECT ON ChiTietHoaDon To ad
	--Cấp quyền xem bảng SanPham
	GRANT SELECT ON SanPham To ad
	--Cấp quyền xem bảng LoaiSanPham
	GRANT SELECT ON LoaiSanPham To ad
	--Cấp quyền xem bảng PhieuNhapKho
	GRANT SELECT ON PhieuNhapKho To ad
	--Cấp quyền xem bảng CTPhieuNhapKho
	GRANT SELECT ON CTPhieuNhapKho To ad


--Thu hồi quyền của Nhân viên trưởng ca
	REVOKE SELECT ON KhachHang
	To ad
	REVOKE SELECT ON NhomKhachHang
	To ad
	REVOKE SELECT ON HoaDon
	To ad
	REVOKE SELECT ON ChiTietHoaDon
	To ad
	REVOKE SELECT ON SanPham
	To ad
	REVOKE SELECT ON LoaiSanPham
	To ad
	REVOKE SELECT ON PhieuNhapKho
	To ad
	REVOKE SELECT ON CTPhieuNhapKho
	To ad

--Xóa tài khoản khỏi CSDL 
	DROP USER ad


     ------NHÂN VIÊN BÁN HÀNG------

--Tạo Login cho Nhân viên bán hàng
	CREATE LOGIN sale WITH PASSWORD='bh123',
	DEFAULT_DATABASE= QLBHGiacMoSuaViet
--Tạo User Nhân viên  bán hàng
	CREATE USER sale FOR LOGIN sale

--Cấp quyền cho Nhân viên bán hàng

	--Cấp quyền xem bảng HoaDon
	GRANT SELECT ON HoaDon
	To sale
	--Cấp quyền xem bảng ChiTietHoaDon
	GRANT SELECT ON ChiTietHoaDon
	To sale
	--Cấp quyền xem bảng SanPham
	GRANT SELECT ON SanPham
	To sale
	--Cấp quyền xem bảng LoaiSanPham
	GRANT SELECT ON LoaiSanPham
	To sale

--Thu hồi quyền của Nhân viên bán hàng

	REVOKE SELECT ON HoaDon
	To sale
	REVOKE SELECT ON ChiTietHoaDon
	To sale
	REVOKE SELECT ON SanPham
	To sale
	REVOKE SELECT ON LoaiSanPham
	To sale

--Xóa tài khoản khỏi CSDL 
	DROP USER sale


     -----NHÂN VIÊN THU NGÂN------

--Tạo Login cho Nhân viên thu ngân
	CREATE LOGIN thungan WITH PASSWORD='tn123',
	DEFAULT_DATABASE= QLBHGiacMoSuaViet
--Tạo User Nhân viên thu ngân
	CREATE USER thungan FOR LOGIN thungan

--Cấp quyền cho Nhân viên thu ngân

	--Cấp quyền xem bảng HoaDon
	GRANT SELECT ON HoaDon
	To thungan
	--Cấp quyền xem bảng ChiTietHoaDon
	GRANT SELECT ON ChiTietHoaDon
	To thungan
	--Cấp quyền xem bảng PhieuNhapKho
	GRANT SELECT ON PhieuNhapKho
	To thungan
	--Cấp quyền xem bảng CTPhieuNhapKho
	GRANT SELECT ON CTPhieuNhapKho
	To thungan


--Thu hồi quyền của Nhân viên thu ngân 

	REVOKE SELECT ON HoaDon
	To thungan
	REVOKE SELECT ON ChiTietHoaDon
	To thungan
	REVOKE SELECT ON PhieuNhapKho
	To thungan
	REVOKE SELECT ON CTPhieuNhapKho
	To thungan

--Xóa tài khoản khỏi CSDL 
	DROP USER thungan


     -----NHÂN VIÊN KHO------

--Tạo Login cho Nhân viên kho
	CREATE LOGIN nvkho WITH PASSWORD='kh123',
	DEFAULT_DATABASE= QLBHGiacMoSuaViet
--Tạo User Nhân viên kho
	CREATE USER nvkho FOR LOGIN nvkho

--Cấp quyền cho Nhân viên kho

	--Cấp quyền xem bảng PhieuNhapKho
	GRANT SELECT ON PhieuNhapKho
	To nvkho
	--Cấp quyền xem bảng CTPhieuNhapKho
	GRANT SELECT ON CTPhieuNhapKho
	To nvkho

--Thu hồi quyền của Nhân viên kho 

	REVOKE SELECT ON PhieuNhapKho
	To nvkho
	REVOKE SELECT ON CTPhieuNhapKho
	To nvkho

--Xóa tài khoản khỏi CSDL 
	DROP USER nvkho


     -----NHÂN VIÊN TƯ VẤN------

--Tạo Login cho Nhân viên tư vấn
	CREATE LOGIN tuvan WITH PASSWORD='tv123',
	DEFAULT_DATABASE= QLBHGiacMoSuaViet
--Tạo User Nhân viên tư vấn
	CREATE USER tuvan FOR LOGIN tuvan


--Cấp quyền cho Nhân viên tư vấn

	--Cấp quyền xem bảng KhachHang
	GRANT SELECT ON KhachHang
	To tuvan
	--Cấp quyền xem bảng NhomKhachHang
	GRANT SELECT ON NhomKhachHang
	To tuvan
	--Cấp quyền xem bảng SanPham
	GRANT SELECT ON SanPham
	To tuvan
	--Cấp quyền xem bảng LoaiSanPham
	GRANT SELECT ON LoaiSanPham
	To tuvan

--Thu hồi quyền của Nhân viên tư vấn 

	REVOKE SELECT ON KhachHang
	To tuvan
	REVOKE SELECT ON NhomKhachHang
	To tuvan
	REVOKE SELECT ON SanPham
	To tuvan
	REVOKE SELECT ON LoaiSanPham
	To tuvan

--Xóa tài khoản khỏi CSDL 
	DROP USER tuvan



--PHÁT TRIỂN THÊM ỨNG DỤNG TRANSACTION VÀO HỆ THỐNG QUẢN LÝ BÁN HÀNG GIẤC MƠ SỮA VIỆT

-------- TRANSACTION
-- ROLLBACK TRAN

--Thay đổi thông tin
	BEGIN TRAN
	UPDATE SanPham
	SET SoLuongTon = 150
	WHERE MaSP = 'SP001'
--Kiểm thử
	SELECT *
	FROM SanPham

--Sau khi thay đổi thông tin
--Nếu thông tin chưa hài lòng thì có thể dùng ROLLBACK TRAN để khôi phục lại thông tin ban đầu
	ROLLBACK TRAN
--Kiểm thử
	SELECT *
	FROM SanPham


-- COMMIT

--Xóa thông tin
	BEGIN TRAN
	DELETE FROM SanPham
	WHERE MaSP='SP041'
--Kiểm thử
	SELECT *
	FROM SanPham

--Sau khi XÓA thông tin
--Nếu đúng thì xác nhận bằng các thực thi COMMIT (Sau khi đã thực thi COMMIT thì không thể ROLLBACK TRAN)
	COMMIT

--Nếu chưa hài lòng thì có thể dùng ROLLBACK TRAN để khôi phục lại thông tin ban đầu
	ROLLBACK TRAN


-- SAVEPOINT
	
	BEGIN TRAN
	UPDATE SanPham
	SET SoLuongTon = 100
	WHERE MaSP='SP001'
	SAVE TRAN SAVEPOINT_1
	
	BEGIN TRAN
	UPDATE SanPham
	SET SoLuongTon = 100
	WHERE MaSP='SP002'
	SAVE TRAN SAVEPOINT_2

	BEGIN TRAN
	UPDATE SanPham
	SET SoLuongTon = 100
	WHERE MaSP='SP003'
	SAVE TRAN SAVEPOINT_3

--Kiểm thử 
	SELECT*FROM SanPham

--ROLLBACK lại SAVEPOINT_2 
	ROLLBACK TRAN  SAVEPOINT_2

--Kiểm thử
	SELECT * FROM SanPham


-- ỨNG DỤNG VÀO HỆ THỐNG 

--VD: Tạo thủ tục SP_UpdatePrices để cập nhập đơn giá bán sản phẩm theo mã sản phẩm người dùng nhập vào. 
--Kết hợp TRANSACTION để kiểm tra Mã sản phẩm và đơn giá bán phải lớn hơn đơn giá nhập.

-- STORE PROCEDURE
	CREATE PROC SP_UpdatePrices  @MaSP nchar (5), @dgban float
	AS
	DECLARE @Error int, @RowCount int
-- TRANSACTION 
	BEGIN TRAN
	UPDATE SanPham
	SET DgBan=@dgban
	WHERE MaSP=@MaSP and @dgban > DgNhap

	SELECT @Error=@@ERROR, @RowCount=@@ROWCOUNT
	IF @Error<>0 or @RowCount<>1
		BEGIN
			ROLLBACK TRAN
			RETURN -1
		END
	ELSE
		BEGIN
			COMMIT TRAN
			RETURN 0
		END

--Kiểm thử khi có lỗi 
	DECLARE @query int, @masanpham nchar(5)
	SET @masanpham='SP001'
	EXEC @query= SP_UpdatePrices @masanpham, 20000
	IF @query<>0
	PRINT N'==> Lỗi! Vui lòng kiểm tra lại
	-> Mã sản phẩm 
	-> Đơn giá bán phải lớn hơn đơn giá nhập'
	ELSE 
	SELECT * FROM SanPham WHERE MaSP=@masanpham

--Kiểm thử khi không có lỗi
	DECLARE @query int, @masanpham nchar(5)
	SET @masanpham='SP001'
	EXEC @query= SP_UpdatePrices @masanpham, 33000
	IF @query<>0
	PRINT N'==> Lỗi! Vui lòng kiểm tra lại
	-> Mã sản phẩm 
	-> Đơn giá bán phải lớn hơn đơn giá nhập'
	ELSE 
	SELECT * FROM SanPham WHERE MaSP=@masanpham 
	
--Hiển thị bảng Sản phẩm để xem kết quả kiểm thử
	SELECT * FROM SanPham
