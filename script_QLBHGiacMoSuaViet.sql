USE [QLBHGiacMoSuaViet]
GO
/****** Object:  User [ad]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [ad] FOR LOGIN [ad] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nvkho]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [nvkho] FOR LOGIN [nvkho] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [owner]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [owner] FOR LOGIN [owner] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sale]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [sale] FOR LOGIN [sale] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [thungan]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [thungan] FOR LOGIN [thungan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tuvan]    Script Date: 04/20/2023 21:35:13 ******/
CREATE USER [tuvan] FOR LOGIN [tuvan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [XemDuLieuHeThong]    Script Date: 04/20/2023 21:35:13 ******/
CREATE ROLE [XemDuLieuHeThong] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [nchar](4) NOT NULL,
	[TenLoaiSP] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_MaLoaiSP_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP1', N'Sữa')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP2', N'Sữa chua')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP3', N'Nước trái cây')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP4', N'Kem')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP5', N'Sữa bột')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'LSP6', N'Sữa đặc')
/****** Object:  Table [dbo].[ChucVu]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [nchar](5) NOT NULL,
	[TenCV] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_MaCV_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV001', N'Nhân viên thu ngân')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV002', N'Nhân viên tư vấn')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV003', N'Nhân viên kho')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV004', N'Nhân viên trưởng ca')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV005', N'Trưởng cửa hàng')
/****** Object:  Table [dbo].[NhomKhachHang]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomKhachHang](
	[MaNhomKH] [nchar](4) NOT NULL,
	[TenNhomKH] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_MaNhomKH_NhomKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaNhomKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[NhomKhachHang] ([MaNhomKH], [TenNhomKH]) VALUES (N'KHML', N'Khách hàng mua lẻ')
INSERT [dbo].[NhomKhachHang] ([MaNhomKH], [TenNhomKH]) VALUES (N'KHTN', N'Khách hàng tiềm năng')
INSERT [dbo].[NhomKhachHang] ([MaNhomKH], [TenNhomKH]) VALUES (N'KHTR', N'Khách hàng trung thành')
INSERT [dbo].[NhomKhachHang] ([MaNhomKH], [TenNhomKH]) VALUES (N'KHTT', N'Khách hàng thân thiết')
INSERT [dbo].[NhomKhachHang] ([MaNhomKH], [TenNhomKH]) VALUES (N'KHVP', N'Khách hàng VIP')
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](5) NOT NULL,
	[HoNV] [nvarchar](100) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[GioiTinhNV] [nvarchar](10) NOT NULL,
	[NgSinhNV] [datetime] NOT NULL,
	[DiachiNV] [nvarchar](100) NOT NULL,
	[SdtNV] [nchar](10) NOT NULL,
	[CCCDNV] [nchar](12) NOT NULL,
	[EmailNV] [nvarchar](50) NOT NULL,
	[MaCV] [nchar](5) NOT NULL,
 CONSTRAINT [pk_MaNV_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV001', N'Nguyễn Anh', N'Thư', N'Nữ', CAST(0x00008AE000000000 AS DateTime), N'Lô C, phòng 28, chung cư Thanh Đa', N'092987987 ', N'213487659323', N'thunguyent@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV002', N'Nguyễn Minh', N'An', N'Nam', CAST(0x000091E700000000 AS DateTime), N'255 Trần Hưng Đạo', N'092678546 ', N'231475869001', N'minhan@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV003', N'Nguyễn Bá', N'Điền', N'Nam', CAST(0x000088E300000000 AS DateTime), N'12 Nguyễn Trãi', N'086241325 ', N'123357835790', N'diennguyen@gmail.com', N'CV003')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV004', N'Trần Thị', N'Minh', N'Nữ', CAST(0x0000892000000000 AS DateTime), N'33 Hùng Vương', N'093567922 ', N'332214562100', N'minhminh@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV005', N'Nguyễn Trúc', N'Quỳnh', N'Nữ', CAST(0x00008E3A00000000 AS DateTime), N'30/1 Trần Phú', N'091152311 ', N'315214562152', N'quynh23@gmail.com', N'CV004')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV006', N'Lê Ngọc', N'Ánh', N'Nữ', CAST(0x0000819E00000000 AS DateTime), N'178/97 An Dương Vương', N'091234234 ', N'223567619123', N'ngocanhn@gmail.com', N'CV005')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV007', N'Phạm Thị Anh', N'Thư', N'Nữ', CAST(0x00008E8F00000000 AS DateTime), N'369 Thủ Khoa Huân', N'091198367 ', N'333647890112', N'anhthu@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV008', N'Huỳnh Trọng Bảo', N'Như', N'Nữ', CAST(0x00008B7F00000000 AS DateTime), N'12 Tuyên Quang', N'086812987 ', N'352907679122', N'baonhu@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV009', N'Huỳnh Huy', N'Đức', N'Nam', CAST(0x00008BB300000000 AS DateTime), N'67 Kỳ Đồng', N'090984561 ', N'443488629382', N'duchuy@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV010', N'Nguyễn Lan', N'Anh', N'Nữ', CAST(0x0000893E00000000 AS DateTime), N'313 Lê Lợi', N'093518723 ', N'612487659123', N'anhlan@gmail.com', N'CV003')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV011', N'Nguyễn Thị Tuyết', N'Nhi', N'Nữ', CAST(0x00008A6D00000000 AS DateTime), N'33 Phan Bội Châu', N'084312451 ', N'213487659323', N'nhinguyen@gmail.com', N'CV003')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV012', N'Nguyễn Anh', N'Đức', N'Nam', CAST(0x000087D000000000 AS DateTime), N'551 Phan Chu Trinh', N'088993457 ', N'551378129042', N'anhduc@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV013', N'Lê Văn', N'Vũ', N'Nam', CAST(0x000088E100000000 AS DateTime), N'11/2 Hải Thượng Lan Ông', N'086814982 ', N'782124676103', N'vanvule@gmail.com', N'CV001')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV014', N'Ngô Tấn', N'Tài', N'Nam', CAST(0x000086F200000000 AS DateTime), N'119 Từ Văn Tư', N'089012331 ', N'614367518900', N'ngotantai@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV015', N'Nguyễn Thị', N'Xinh', N'Nữ', CAST(0x000083BE00000000 AS DateTime), N'123/36 Phạm Văn Đồng', N'092267431 ', N'763447659120', N'nguyenxinh@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV016', N'Trần Quốc', N'Việt', N'Nam', CAST(0x0000852B00000000 AS DateTime), N'10 Nguyễn Tất Thành', N'091926500 ', N'813288654323', N'quocviet11@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV017', N'Ngô Ngọc', N'Ánh', N'Nữ', CAST(0x0000877300000000 AS DateTime), N'62 Ngô Quyền', N'092276517 ', N'290143217811', N'ngocanhhi@gmail.com', N'CV004')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV018', N'Lê Tuyết', N'Anh', N'Nữ', CAST(0x000085A500000000 AS DateTime), N'411 Phan Đình Giót', N'090978123 ', N'563247809812', N'tuyetanhh@gmail.com', N'CV003')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV019', N'Phạm Quốc', N'Bảo', N'Nam', CAST(0x000083A800000000 AS DateTime), N'21 Võ Thị Sáu', N'098121347 ', N'137709213443', N'baonam@gmail.com', N'CV002')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [GioiTinhNV], [NgSinhNV], [DiachiNV], [SdtNV], [CCCDNV], [EmailNV], [MaCV]) VALUES (N'NV020', N'Lê Quỳnh', N'Như', N'Nữ', CAST(0x00008D7F00000000 AS DateTime), N'144 Lê Văn Việt', N'099187134 ', N'220678915677', N'quynhnhu@gmail.com', N'CV004')
/****** Object:  Table [dbo].[KhachHang]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](5) NOT NULL,
	[HoKH] [nvarchar](100) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[GioiTinhKH] [nvarchar](10) NULL,
	[NgSinhKH] [datetime] NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[SdtKH] [nchar](10) NULL,
	[CCCDKH] [nchar](12) NULL,
	[EmailKH] [nvarchar](50) NULL,
	[MaNhomKH] [nchar](4) NOT NULL,
 CONSTRAINT [pk_MaKH_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH001', N'Nguyễn Phước', N'Đông', N'Nam', CAST(0x00008FA100000000 AS DateTime), N'21 Nguyễn Trãi', N'0362991122', N'321526712143', N'phdong@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH002', N'Võ Khánh', N'Dung', N'Nữ', CAST(0x0000913A00000000 AS DateTime), N'1765A Bình Dương', N'083978224 ', N'107210045211', N'khanhdung@gmail.com', N'KHML')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH003', N'Lê Phương Trà', N'Vy', N'Nữ', CAST(0x00008F8100000000 AS DateTime), N'18 Lam Sơn', N'083950423 ', N'312158789120', N'travy@gmail.com', N'KHVP')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH004', N'Trần Minh', N'Hạnh', N'Nữ', CAST(0x00008D6400000000 AS DateTime), N'313 Thủ Khoa Huân', N'091567902 ', N'656679123521', N'minhhanh@gmail.com', N'KHML')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH005', N'Nguyễn Phan Thảo', N'Nguyên', N'Nữ', CAST(0x00008B2000000000 AS DateTime), N'68 Hồ Xuân Hương', N'091139717 ', N'783267119012', N'thaonguyen@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH006', N'Phạm Nguyễn Phúc', N'Thịnh', N'Nữ', CAST(0x00008D0900000000 AS DateTime), N'900 Kha Vạn Cân', N'096278122 ', N'528813299002', N'phucthinh@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH007', N'Ngô Thiên', N'An', N'Nữ', CAST(0x0000848800000000 AS DateTime), N'12 Phan Đình Giót', N'099265334 ', N'468815237299', N'thienan@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH008', N'Trần Trung', N'Kiên', N'Nam', CAST(0x00008FDB00000000 AS DateTime), N'31 Nguyễn Hội', N'091462358 ', N'225173809266', N'trungkien22@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH009', N'Nguyễn Ngọc Minh', N'Thư', N'Nữ', CAST(0x00008FC100000000 AS DateTime), N'41 đường số 19', N'083841456 ', N'154500127805', N'minthu@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH010', N'Nguyễn Duy', N'Khải', N'Nam', CAST(0x00008F4F00000000 AS DateTime), N'22/1 Nguyễn Thái Học', N'064387821 ', N'400113255121', N'duykhai@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH011', N'Võ Khánh', N'Như', N'Nữ', CAST(0x0000935C00000000 AS DateTime), N'92 Nguyễn Hữu Cảnh', N'082212331 ', N'475945001032', N'khanhnhu@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH012', N'Triệu Nguyễn Thủy', N'Tiên', N'Nữ', CAST(0x00007B2000000000 AS DateTime), N'61/3 Võ Th? Sáu', N'094456121 ', N'310456247889', N'ttien@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH013', N'Nguyễn Triệu', N'Duy', N'Nam', CAST(0x00008AF400000000 AS DateTime), N'78 Lê Văn Việt', N'083945526 ', N'300951116722', N'trieuduy@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH014', N'Nguyễn Thị Thảo', N'Linh', N'Nữ', CAST(0x00006F3400000000 AS DateTime), N'41B Nguyễn Tất Thành', N'090985333 ', N'227356901123', NULL, N'KHVP')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH015', N'Huỳnh Trọng Bảo', N'Trân', N'Nữ', CAST(0x00008DE100000000 AS DateTime), N'23 Nguyễn Huệ', N'093167829 ', N'146676751432', N'tranhuynh12@gmail.com', N'KHML')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH016', N'Trần Cẩm', N'Tuyến', N'Nữ', CAST(0x00008FA000000000 AS DateTime), N'323 Phạm Văn Đồng', N'090200356 ', N'613256774003', N'tuyencam@gmail.com', N'KHML')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH017', N'Nguyễn', N'Nhân', N'Nam', CAST(0x0000928300000000 AS DateTime), N'22/1 Nguyễn Văn Bá', N'096514378 ', N'345005824561', N'nguyennhan356@gmail.com', N'KHML')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH018', N'Lê Minh', N'Sang', N'Nam', CAST(0x000090D600000000 AS DateTime), N'681 Trần Hưng Đạo', N'087512672 ', N'451162349023', N'lesang@gmail.com', N'KHTT')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH019', N'Lê Bảo Minh', N'Thư', N'Nữ', CAST(0x00008F4E00000000 AS DateTime), N'23 Nguyễn Trãi', N'093971785 ', N'400558832982', N'minhthule@gmail.com', N'KHTN')
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [GioiTinhKH], [NgSinhKH], [DiaChiKH], [SdtKH], [CCCDKH], [EmailKH], [MaNhomKH]) VALUES (N'KH020', N'Lê Quỳnh', N'Như', N'Nữ', CAST(0x000091D800000000 AS DateTime), N'82/3 Hùng Vương', N'094920156 ', N'313267724590', N'lenhuquynh@gmail.com', N'KHTR')
/****** Object:  Table [dbo].[SanPham]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](5) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[DgBan] [float] NOT NULL,
	[DgNhap] [float] NOT NULL,
	[MaLoaiSP] [nchar](4) NOT NULL,
 CONSTRAINT [pk_MaSP_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP001', N'Sữa tươi nguyên chất thanh trùng Nhãn hiệu Vinamilk 100% Sữa tươi', 200, N'Lốc', 32000, 29000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP002', N'Sữa tươi thanh trùng có đường Nhãn hiệu Vinamilk 100% Sữa tươi', 190, N'Lốc', 32500, 29500, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP003', N'Sữa tươi tiệt trùng có đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 195, N'Lốc', 32700, 29700, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP004', N'Sữa tươi tiệt trùng ít đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 182, N'Lốc', 32700, 29700, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP005', N'Sữa tươi tiệt trùng rất ít đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 145, N'Lốc', 32700, 29700, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP006', N'Sữa tươi tiệt trùng không đường Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 160, N'Lốc', 32700, 29700, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP007', N'Sữa tươi tiệt trùng Socola Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 120, N'Lốc', 33000, 30000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP008', N'Sữa tươi tiệt trùng hương dâu Nhãn hiệu Vinamilk Green Farm Sữa tươi 100%', 133, N'Lốc', 33000, 30000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP009', N'Sữa tươi nguyên chất tách béo tiệt trùng Nhãn hiệu Vinamilk 100% sữa tươi', 210, N'Lốc', 34000, 32000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP010', N'Sữa bột nguyên kem có đường - Vinamilk Dinh dưỡng', 195, N'Hộp', 32000, 295000, N'LSP5')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP011', N'Sữa uống dinh dưỡng - Dielac Grow Plus (xanh)', 122, N'Hộp', 250000, 225000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP012', N'Sữa Uống Dinh Dưỡng - Dielac Grow Plus - có Tổ Yến', 165, N'Hộp', 37200, 355000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP013', N'Sữa Đậu Nành Hạnh Nhân - Vinamilk', 195, N'Lốc', 40000, 38000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP014', N'Sữa chua uống men sống - Probi', 220, N'Lốc', 25000, 23700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP015', N'Sữa chua uống men sống hương dâu - Probi', 235, N'Lốc', 25000, 23700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP016', N'Sữa chua uống men sống hương dưa gang - Probi', 198, N'Lốc', 25000, 23700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP017', N'Sữa chua uống men sống hương việt quất - Probi', 195, N'Lốc', 32000, 30200, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP018', N'Sữa chua uống tiệt trùng nha đam - Vinamilk Yomilk', 180, N'Lốc', 30000, 27700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP019', N'Sữa chua uống tiệt trùng lựu đỏ - Vinamilk Yomilk', 90, N'Lốc', 30000, 27700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP020', N'Sữa chua uống tiệt trùng hương cam - Vinamilk Yomilk', 115, N'Lốc', 30000, 27700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP021', N'Sữa chua uống tiệt trùng hương dâu - Vinamilk Yomilk', 125, N'Lốc', 27000, 25700, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP022', N'Sữa chua ít đường - Vinamilk', 210, N'Lốc', 24000, 22500, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP023', N'Sữa chua có đường - Vinamilk', 200, N'Lốc', 24000, 22500, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP024', N'Sữa chua không đường - Vinamilk', 192, N'Lốc', 24000, 22500, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP025', N'Sữa chua nha đam - Vinamilk', 195, N'Lốc', 28500, 26300, N'LSP2')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP026', N'Sữa Đậu Nành - Vinamilk Gấp Đôi Canxi', 162, N'Lốc', 28500, 26000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP027', N'Sữa Đậu Nành không đường - Vinamilk Gấp Đôi Canxi', 155, N'Lốc', 28500, 30000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP028', N'Sữa Đậu Nành ít đường - Vinamilk Gấp Đôi Canxi', 155, N'Lốc', 28500, 30000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP029', N'Sữa Đậu Nành rất ít đường - Vinamilk Gấp Đôi Canxi', 155, N'Lốc', 28500, 30000, N'LSP1')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP030', N'Sữa đặc có đường bổ sung dầu thực vật', 162, N'Lốc', 28500, 30000, N'LSP6')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP031', N'Nước cam ép - Nhãn hiệu Vfresh', 153, N'Hộp', 38600, 36000, N'LSP3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP032', N'Nước nho ép - Nhãn hiệu Vfresh', 162, N'Hộp', 38500, 35500, N'LSP3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP033', N'Nước đào (42% đào ép) - Nhãn hiệu Vfresh', 200, N'Hộp', 40000, 37500, N'LSP3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP034', N'Nước ổi (25% ổi ép) - Nhãn hiệu Vfresh', 177, N'Hộp', 45300, 42000, N'LSP3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP035', N'NƯỚC ÉP LỰU TÁO - VFRESH', 160, N'Hộp', 36600, 34500, N'LSP3')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP036', N'Kem Ốc Quế Dâu Nam Việt Quất - Delight', 126, N'Cây', 18500, 16000, N'LSP4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP037', N'Kem Ốc Quế Sôcôla Đậu Phộng - Delight', 132, N'Cây', 18500, 16000, N'LSP4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP038', N'Kem vani - Vinamilk', 182, N'Hộp', 51500, 48000, N'LSP4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP039', N'Kem đậu xanh - Vinamilk', 99, N'Hộp', 51000, 46500, N'LSP4')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [SoLuongTon], [DonViTinh], [DgBan], [DgNhap], [MaLoaiSP]) VALUES (N'SP040', N'Kem sôcôla - Vinamilk', 110, N'Hộp', 51000, 46500, N'LSP4')
/****** Object:  Table [dbo].[PhieuNhapKho]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapKho](
	[MaPhieuNK] [nchar](5) NOT NULL,
	[NgayNK] [datetime] NULL,
	[NgayDH] [datetime] NULL,
	[MaNV] [nchar](5) NOT NULL,
 CONSTRAINT [PK_PhieuNhapKho] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN001', CAST(0x0000AFA800000000 AS DateTime), CAST(0x0000AF8900000000 AS DateTime), N'NV003')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN002', CAST(0x0000AFB100000000 AS DateTime), CAST(0x0000AF8700000000 AS DateTime), N'NV010')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN003', CAST(0x0000AFB600000000 AS DateTime), CAST(0x0000AFB400000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN004', CAST(0x0000AF6C00000000 AS DateTime), CAST(0x0000AF4900000000 AS DateTime), N'NV018')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN005', CAST(0x0000AF9600000000 AS DateTime), CAST(0x0000AF7700000000 AS DateTime), N'NV003')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN006', CAST(0x0000AF9A00000000 AS DateTime), CAST(0x0000AF6C00000000 AS DateTime), N'NV018')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN007', CAST(0x0000AFAB00000000 AS DateTime), CAST(0x0000AF8A00000000 AS DateTime), N'NV018')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN008', CAST(0x0000AFBA00000000 AS DateTime), CAST(0x0000AFAF00000000 AS DateTime), N'NV010')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN009', CAST(0x0000AFBC00000000 AS DateTime), CAST(0x0000AFB000000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN010', CAST(0x0000AFB600000000 AS DateTime), CAST(0x0000AF9700000000 AS DateTime), N'NV003')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN011', CAST(0x0000AFAE00000000 AS DateTime), CAST(0x0000AF9100000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN012', CAST(0x0000AFA800000000 AS DateTime), CAST(0x0000AF9700000000 AS DateTime), N'NV010')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN013', CAST(0x0000AFA400000000 AS DateTime), CAST(0x0000AF9500000000 AS DateTime), N'NV018')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN014', CAST(0x0000AFA400000000 AS DateTime), CAST(0x0000AF9300000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN015', CAST(0x0000AFA100000000 AS DateTime), CAST(0x0000AF9800000000 AS DateTime), N'NV003')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN016', CAST(0x0000AFAA00000000 AS DateTime), CAST(0x0000AF8700000000 AS DateTime), N'NV003')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN017', CAST(0x0000AFD000000000 AS DateTime), CAST(0x0000AFA600000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN018', CAST(0x0000AFC800000000 AS DateTime), CAST(0x0000AFB600000000 AS DateTime), N'NV010')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN019', CAST(0x0000AFCE00000000 AS DateTime), CAST(0x0000AF9A00000000 AS DateTime), N'NV011')
INSERT [dbo].[PhieuNhapKho] ([MaPhieuNK], [NgayNK], [NgayDH], [MaNV]) VALUES (N'PN020', CAST(0x0000AFD600000000 AS DateTime), CAST(0x0000AFB400000000 AS DateTime), N'NV018')
/****** Object:  View [dbo].[vwSoLuongTon]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSoLuongTon] AS 
	SELECT TenLoaiSP, SUM(SoLuongTon) AS [Tong so luong ton] 
	FROM SanPham SP JOIN LoaiSanPham LSP  
	ON SP.MaLoaiSP=LSP.MaLoaiSP
	GROUP BY TenLoaiSP
GO
/****** Object:  View [dbo].[vwNhanVienNu]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwNhanVienNu] AS 
	SELECT *
	FROM NhanVien
	WHERE GioiTinhNV = N'Nữ'
GO
/****** Object:  Synonym [dbo].[Customers]    Script Date: 04/20/2023 21:35:13 ******/
CREATE SYNONYM [dbo].[Customers] FOR [dbo].[KhachHang]
GO
/****** Object:  StoredProcedure [dbo].[SP_XemSoLuongTontheoMaSP]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XemSoLuongTontheoMaSP] @MaSP nchar(5)
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateTTKhachHang]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateTTKhachHang] (@MaKH nchar(5), @HoKH nvarchar(100),@TenKH nvarchar(50), 
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrices]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdatePrices]  @MaSP nchar (5), @dgban float
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
GO
/****** Object:  StoredProcedure [dbo].[SP_Top3SanPhamTonKho]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Top3SanPhamTonKho] AS 
	SELECT TOP 3 MaSP, TenSP, SoLuongTon 
	FROM SanPham 
	ORDER BY SoLuongTon DESC
GO
/****** Object:  StoredProcedure [dbo].[SP_ThongTinNhanVien]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ThongTinNhanVien] @MaNV nchar(5)
	AS
		SELECT *
		FROM NhanVien
		WHERE @MaNV=MaNV
GO
/****** Object:  StoredProcedure [dbo].[SP_SLKHtheoMaNhomKH]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SLKHtheoMaNhomKH] (@MaNhomKH nchar(4))
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
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nchar](5) NOT NULL,
	[MaNV] [nchar](5) NOT NULL,
	[MaKH] [nchar](5) NOT NULL,
	[NgayBanHang] [datetime] NOT NULL,
	[PTTT] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_MaHD_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD001', N'NV001', N'KH001', CAST(0x0000AE7800000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD002', N'NV004', N'KH002', CAST(0x0000AF7200000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD003', N'NV007', N'KH003', CAST(0x0000AEC400000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD004', N'NV009', N'KH004', CAST(0x0000AEEE00000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD005', N'NV012', N'KH005', CAST(0x0000AE9100000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD006', N'NV013', N'KH006', CAST(0x0000AEC600000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD007', N'NV013', N'KH007', CAST(0x0000AFA000000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD008', N'NV005', N'KH008', CAST(0x0000AF8400000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD009', N'NV017', N'KH009', CAST(0x0000AE7400000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD010', N'NV020', N'KH010', CAST(0x0000AFCF00000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD011', N'NV007', N'KH011', CAST(0x0000AEC300000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD012', N'NV001', N'KH012', CAST(0x0000AE8200000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD013', N'NV004', N'KH013', CAST(0x0000AF7B00000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD014', N'NV012', N'KH014', CAST(0x0000AF4A00000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD015', N'NV017', N'KH015', CAST(0x0000AFB800000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD016', N'NV020', N'KH016', CAST(0x0000AE8D00000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD017', N'NV001', N'KH017', CAST(0x0000AF1E00000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD018', N'NV009', N'KH018', CAST(0x0000AEDF00000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD019', N'NV009', N'KH019', CAST(0x0000AEE100000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD020', N'NV012', N'KH020', CAST(0x0000AF0200000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD021', N'NV001', N'KH001', CAST(0x0000AE7800000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD022', N'NV004', N'KH005', CAST(0x0000AF7200000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD023', N'NV007', N'KH007', CAST(0x0000AEC400000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD024', N'NV009', N'KH009', CAST(0x0000AEEE00000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD025', N'NV012', N'KH009', CAST(0x0000AE9100000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD026', N'NV013', N'KH010', CAST(0x0000AEC600000000 AS DateTime), N'Chuyển khoản')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD027', N'NV013', N'KH011', CAST(0x0000AFA000000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD028', N'NV005', N'KH014', CAST(0x0000AF8400000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD029', N'NV017', N'KH020', CAST(0x0000AE7400000000 AS DateTime), N'Tiền mặt')
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBanHang], [PTTT]) VALUES (N'HD030', N'NV020', N'KH008', CAST(0x0000AFCF00000000 AS DateTime), N'Chuyển khoản')
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nchar](5) NOT NULL,
	[MaSP] [nchar](5) NOT NULL,
	[SLBan] [int] NOT NULL,
	[DgBan] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD001', N'SP001', 5, 32000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD001', N'SP003', 5, 32700)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD001', N'SP011', 20, 250000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD002', N'SP002', 20, 32500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD003', N'SP004', 30, 32700)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD003', N'SP012', 15, 27000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD003', N'SP021', 15, 250000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD004', N'SP014', 15, 25000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD005', N'SP005', 30, 32700)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD006', N'SP024', 30, 24000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD006', N'SP025', 10, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD006', N'SP034', 10, 45300)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD007', N'SP035', 30, 36600)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD007', N'SP037', 30, 18500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD008', N'SP027', 20, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD008', N'SP028', 20, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD008', N'SP038', 20, 51500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD009', N'SP020', 30, 30000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD010', N'SP031', 5, 38600)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD010', N'SP033', 5, 40000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD011', N'SP032', 20, 38500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD012', N'SP023', 30, 24000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD012', N'SP032', 20, 38500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD013', N'SP013', 30, 40000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD014', N'SP009', 15, 34000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD015', N'SP022', 15, 24000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD016', N'SP015', 30, 25000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD017', N'SP026', 15, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD018', N'SP007', 30, 33000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD018', N'SP017', 20, 32000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD018', N'SP036', 30, 18500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD019', N'SP018', 20, 30000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD019', N'SP022', 20, 24000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD020', N'SP008', 30, 33000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD020', N'SP040', 20, 51000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD021', N'SP018', 20, 30000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD021', N'SP039', 5, 51000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD022', N'SP019', 20, 30000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD023', N'SP008', 30, 33000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD023', N'SP029', 15, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD023', N'SP030', 15, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD024', N'SP010', 15, 32000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD025', N'SP006', 30, 32700)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD026', N'SP016', 30, 25000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD026', N'SP028', 10, 28500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD026', N'SP034', 10, 45300)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD027', N'SP035', 30, 36600)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD027', N'SP037', 30, 18500)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD028', N'SP008', 10, 33000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD028', N'SP011', 25, 250000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD029', N'SP020', 30, 30000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD029', N'SP022', 20, 24000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD030', N'SP001', 5, 32000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaSP], [SLBan], [DgBan]) VALUES (N'HD030', N'SP033', 5, 40000)
/****** Object:  StoredProcedure [dbo].[SP_DSHoaDonThang3Nam2023]    Script Date: 04/20/2023 21:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DSHoaDonThang3Nam2023] AS 
	SELECT *
	FROM HoaDon
	WHERE MONTH(NgayBanHang)= 3 AND YEAR(NgayBanHang)=2023
GO
/****** Object:  Table [dbo].[CTPhieuNhapKho]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhapKho](
	[MaPhieuNK] [nchar](5) NOT NULL,
	[MaSP] [nchar](5) NOT NULL,
	[SoLuongNhap] [int] NOT NULL,
	[DgNhap] [float] NOT NULL,
 CONSTRAINT [PK_CTPhieuNhapKho_MaNK_MaMH] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNK] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN001', N'SP001', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN001', N'SP020', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN002', N'SP011', 15, 5250000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN002', N'SP021', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN003', N'SP002', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN003', N'SP031', 15, 1000000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN004', N'SP022', 10, 2400000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN004', N'SP032', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN005', N'SP003', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN005', N'SP012', 10, 2000000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN006', N'SP013', 10, 1000000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN006', N'SP023', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN006', N'SP033', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN007', N'SP004', 70, 2040000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN007', N'SP014', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN008', N'SP024', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN008', N'SP034', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN009', N'SP005', 20, 1500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN009', N'SP025', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN010', N'SP006', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN010', N'SP015', 5, 450000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN010', N'SP035', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN011', N'SP016', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN011', N'SP022', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN011', N'SP026', 20, 120000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN012', N'SP007', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN012', N'SP036', 100, 2600000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN013', N'SP017', 50, 2800000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN013', N'SP027', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN014', N'SP008', 20, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN014', N'SP037', 60, 4400000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN015', N'SP018', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN015', N'SP028', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN016', N'SP009', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN016', N'SP038', 50, 3500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN017', N'SP019', 50, 2500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN017', N'SP029', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN017', N'SP039', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN018', N'SP010', 5, 380000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN018', N'SP030', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN019', N'SP011', 20, 500000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN019', N'SP040', 5, 1200000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN020', N'SP002', 5, 700000)
INSERT [dbo].[CTPhieuNhapKho] ([MaPhieuNK], [MaSP], [SoLuongNhap], [DgNhap]) VALUES (N'PN020', N'SP030', 20, 500000)
/****** Object:  UserDefinedFunction [dbo].[f_SLHoaDongcuaKH]    Script Date: 04/20/2023 21:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_SLHoaDongcuaKH]()
	RETURNS TABLE AS 
	RETURN(
		SELECT KH.MaKH, HoKH, TenKH, COUNT(HD.MaHD) AS [So Luong Don Hang]
		FROM KhachHang KH JOIN HoaDon HD ON KH.MaKH=HD.MaKH
		GROUP BY KH.MaKH, HoKH, TenKH )
GO
/****** Object:  View [dbo].[vwTop3DoanhThuHoaDon]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTop3DoanhThuHoaDon] AS
	SELECT TOP 3 HD.MaHD, MaNV, MaKH, NgayBanHang, PTTT, (SLBan*DgBan) [Doanh Thu]
	FROM HoaDon HD JOIN ChiTietHoaDon CTHD 
	ON HD.MaHD = CTHD.MaHD
	ORDER BY (SLBan*DgBan) DESC
GO
/****** Object:  View [dbo].[vwTop1KhachHangVIP]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTop1KhachHangVIP] AS
	SELECT TOP 1 KH.MaKH, HoKH+' '+TenKH AS HoTenKH, GioiTinhKH, DiaChiKH, SdtKH, EmailKH, 
			SUM(SLBan*DgBan) AS TongTien
	FROM KhachHang KH JOIN HoaDon HD ON KH.MAKH=HD.MAKH
	JOIN ChiTietHoaDon CT ON HD.MaHD=CT.MaHD
	WHERE KH.MaKH IN 
		(SELECT MaKH 
		FROM NhomKhachHang NKH JOIN KhachHang KH ON KH.MaNhomKH=NKH.MaNhomKH WHERE NKH.MaNhomKH = 'KHVP')
	GROUP BY KH.MaKH, HoKH+' '+TenKH, GioiTinhKH, DiaChiKH, SdtKH, EmailKH
	ORDER BY SUM(SLBan*DgBan) DESC
GO
/****** Object:  View [dbo].[vwHoaDonBan]    Script Date: 04/20/2023 21:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHoaDonBan] AS
	SELECT HD.MaHD, MaNV, MaKH, NgayBanHang, PTTT, SLBan, DgBan 
	FROM HoaDon HD JOIN ChiTietHoaDon CTHD 
	ON HD.MaHD = CTHD.MaHD
	WHERE NgayBanHang BETWEEN '2022-08-01' AND '2023-03-31'
GO
/****** Object:  Synonym [dbo].[CTHD]    Script Date: 04/20/2023 21:35:13 ******/
CREATE SYNONYM [dbo].[CTHD] FOR [dbo].[ChiTietHoaDon]
GO
/****** Object:  UserDefinedFunction [dbo].[f_TienLaitheoSP]    Script Date: 04/20/2023 21:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_TienLaitheoSP] (@MaSP nchar(5))
	RETURNS INT AS 
	BEGIN 
		DECLARE @TienLai INT
		SELECT @TienLai=SUM((CT.DgBan-DgNhap)*SLBan)
		FROM SanPham SP JOIN ChiTietHoaDon CT ON SP.MaSP=CT.MaSP
		WHERE CT.MaSP=@MaSP
		GROUP BY CT.MaSP
		RETURN @TienLai
	END
GO
/****** Object:  Check [ck_GioiTinh_KhachHang]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [ck_GioiTinh_KhachHang] CHECK  (([GioiTinhKH]=N'Nữ' OR [GioiTinhKH]='Nam'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [ck_GioiTinh_KhachHang]
GO
/****** Object:  Check [ck_GioiTinh_NhanVien]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [ck_GioiTinh_NhanVien] CHECK  (([GioiTinhNV]=N'Nữ' OR [GioiTinhNV]='Nam'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [ck_GioiTinh_NhanVien]
GO
/****** Object:  ForeignKey [fk_MaHD_ChiTietHoaDon]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [fk_MaHD_ChiTietHoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [fk_MaHD_ChiTietHoaDon]
GO
/****** Object:  ForeignKey [fk_MaSP_ChiTietHoaDon]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [fk_MaSP_ChiTietHoaDon] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [fk_MaSP_ChiTietHoaDon]
GO
/****** Object:  ForeignKey [FK_CTPhieuNhapKho_PhieuNhapKho]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[CTPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhapKho_PhieuNhapKho] FOREIGN KEY([MaPhieuNK])
REFERENCES [dbo].[PhieuNhapKho] ([MaPhieuNK])
GO
ALTER TABLE [dbo].[CTPhieuNhapKho] CHECK CONSTRAINT [FK_CTPhieuNhapKho_PhieuNhapKho]
GO
/****** Object:  ForeignKey [FK_CTPhieuNhapKho_SanPham]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[CTPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhapKho_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuNhapKho] CHECK CONSTRAINT [FK_CTPhieuNhapKho_SanPham]
GO
/****** Object:  ForeignKey [fk_MaKH_HoaDon]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_MaKH_HoaDon] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_MaKH_HoaDon]
GO
/****** Object:  ForeignKey [fk_MaNV_HoaDon]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_MaNV_HoaDon] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_MaNV_HoaDon]
GO
/****** Object:  ForeignKey [fk_MaNhomKH_KhachHang]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [fk_MaNhomKH_KhachHang] FOREIGN KEY([MaNhomKH])
REFERENCES [dbo].[NhomKhachHang] ([MaNhomKH])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [fk_MaNhomKH_KhachHang]
GO
/****** Object:  ForeignKey [fk_MaCV_NhanVien]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaCV_NhanVien] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_MaCV_NhanVien]
GO
/****** Object:  ForeignKey [FK_PhieuNhapKho_NhanVien]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[PhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapKho_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhapKho] CHECK CONSTRAINT [FK_PhieuNhapKho_NhanVien]
GO
/****** Object:  ForeignKey [fk_MaLoaiSP_SanPham]    Script Date: 04/20/2023 21:35:10 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [fk_MaLoaiSP_SanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [fk_MaLoaiSP_SanPham]
GO
