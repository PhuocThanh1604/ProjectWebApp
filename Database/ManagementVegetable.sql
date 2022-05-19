USE [master]
GO
CREATE DATABASE [ManagementVegetable]
GO
ALTER DATABASE [ManagementVegetable] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManagementVegetable].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManagementVegetable] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ManagementVegetable] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ManagementVegetable] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ManagementVegetable] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ManagementVegetable] SET ARITHABORT OFF
GO
ALTER DATABASE [ManagementVegetable] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ManagementVegetable] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ManagementVegetable] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ManagementVegetable] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ManagementVegetable] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ManagementVegetable] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ManagementVegetable] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ManagementVegetable] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ManagementVegetable] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ManagementVegetable] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ManagementVegetable] SET  DISABLE_BROKER
GO
ALTER DATABASE [ManagementVegetable] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ManagementVegetable] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ManagementVegetable] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ManagementVegetable] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ManagementVegetable] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ManagementVegetable] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ManagementVegetable] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ManagementVegetable] SET  READ_WRITE
GO
ALTER DATABASE [ManagementVegetable] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ManagementVegetable] SET  MULTI_USER
GO
ALTER DATABASE [ManagementVegetable] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ManagementVegetable] SET DB_CHAINING OFF
GO
USE[ManagementVegetable]
GO
/***** Object: Table [dbo.tblCategory] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int]  NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]  
GO
/***** Object: Table [dbo].[tblProduct] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY (1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[image] [nvarchar](max) NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] int NOT NULL,
	[importDate] date,
	[usingDate] date,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object: Table [dbo].[tblOrderDetail] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblOrderDetail]
(
	[detailID] [int] IDENTITY (1,1) NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] 
)ON [PRIMARY]
GO
/***** Object: Table [dbo].[tblOrder] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY (1,1)NOT NULL,
	[orderDate] [DATE]  NULL,
	[total] [money] NOT NULL,/*price*quanlity*/
	[email] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object: Table [dbo].[tblUsers] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblUsers](
	[email][nvarchar](255) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [int] NULL,
	[address] [varchar](60) NULL,
	[birthday] date, /*note*/
	[phone] [varchar](10) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object: Table [dbo].[tblRoles] Script Date: 15/05/2022 15:15:56 PM ******/
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
	[status] [bit] NULL,
	
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblRoles] ( [roleName],[status])
VALUES (N'Admin',1)
INSERT [dbo].[tblRoles] ( [roleName],[status])
VALUES (N'User',1)
GO
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'Adminlogin@gmail.com', N'Admin', N'1', 1,N'localhost:8080' ,'2022-03-07' , N'0123456789',0)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'phuocthanh20cgh@gmail.com', N'VO PHUOC THANH',N'1', 2,N'Ho Chi Minh' ,'2001/04/16' , N'0933391614',1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'haihung@gmail.com', N'MAI NGOC HAI HUNG','1', 2,N'DONG NAI' ,'12/01/2001', N'0933399999',1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'hoangtam02@gmail.com', N'MAI HOANG TAM', '1', 2,N'DONG NAI' ,'2001/09/04' , N'0931313131',1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'vietthinh03@gmail.com', N'NGUYEN VIET THINH',N'1', 2,N'HO CHI MINH' ,'2001/09/23' ,N'0931313131',1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone],[status])VALUES (N'xuanthiep02@gmail.com', N'NGO XUAN THIEP', N'1', 2,N'DONG NAI' ,'2001/04/03' , N'0931313132',1)
GO
INSERT [dbo].[tblOrder] ([orderDate],[total],[email])
VALUES ('2/3/2022',12.000,N'xuanthiep02@gmail.com')
INSERT [dbo].[tblOrder] ([orderDate],[total],[email])
VALUES ('7/3/2022',75.000,N'hoangtam02@gmail.com')
INSERT [dbo].[tblOrder] ([orderDate],[total],[email])
VALUES ('1/3/2022',60.000,N'hoangtam02@gmail.com')
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1,N'Trái Cây')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2,N'Rau')
GO
INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'BONG CAI XANH',N'https://csfood.vn/wp-content/uploads/2018/04/B%C3%B4ng-c%E1%BA%A3i-xanh.png',60.000,100,1,'2022/3/3','2022/3/10')
INSERT [dbo].[tblProduct] ( [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'OT CHUONG',N'https://cdn.tgdd.vn/Products/Images/8785/233908/bhx/ot-chuong-do-tui-300g-202101271558515994.jpg',20.000,50,1,'3/3/2022','10/3/2022')
INSERT [dbo].[tblProduct] ( [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'HANH TAY',N'https://gianongsan.org/wp-content/uploads/2021/03/0708_hanh-tay-2.jpg',21.000,15,1,'4/3/2022','12/3/2022')
INSERT [dbo].[tblProduct] ( [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'BAP CAI TIM',N'https://img.websosanh.vn/v2/users/wss/images/bap-cai-tim-tu-1kg-12kg/ih8p5wwq2z6jp.jpg',95.000,25,1,'5/3/2022','12/3/2022')
INSERT [dbo].[tblProduct] ( [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'CA ROT',N'https://csfood.vn/wp-content/uploads/2016/05/C%C3%A0-r%E1%BB%91t-%C4%90%C3%A0-L%E1%BA%A1t-lo%E1%BA%A1i-1.jpg',25.000,19,1,'3/3/2022','11/3/2022')
INSERT [dbo].[tblProduct] ( [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'CA CHUA',N'http://afamilycdn.com/2018/8/30/an-ca-chua-2-15SS356070643871251805217.jpg',48.000,21,1,'3/3/2022','12/3/2022')

INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'SAU RIENG',N'https://baitonghop.vn/wp-content/uploads/2019/11/sau-rieng.jpg',75.000,12,2,'6/3/2022','12/3/2022')
INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'CHUOI',N'https://baonongsan.com/wp-content/uploads/2019/12/chuoi-bao-nhieu-calo-0.jpg',38.000,10,2,'3/3/2022','9/3/2022')
INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'THANH LONG',N'https://img.sosanhgia.com/images/500x0/c9a5c1c8f0544dadbd49ad693947e39c/thanh-long-ruot-do-1kg.jpeg',25.000,15,2,'4/3/2022','8/3/2022')INSERT [dbo].[tblProduct] ([productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate])VALUES (N'DAU HAU',N'https://spavietnam.info/wp-content/uploads/2021/04/dua-hau-bao-nhieu-calo-2.jpg',12.000,11,2,'5/3/2022','6/3/2022')
GO
INSERT [dbo].[tblOrderDetail] ([price], [quantity], [orderID], [productID])
VALUES (33.000,2,1,2)
INSERT [dbo].[tblOrderDetail] ([price], [quantity], [orderID], [productID])
VALUES (75.000,4,2,8)
INSERT [dbo].[tblOrderDetail] ([price], [quantity], [orderID], [productID])
VALUES (60.000,10,3,3)
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_email] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderID] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_productID] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_categoryID] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])

SELECT * FROM [dbo].[tblOrderDetail]
SELECT * FROM [dbo].[tblOrder]
SELECT * FROM [dbo].[tblCategory]
SELECT * FROM [dbo].[tblUsers]
SELECT * FROM [dbo].[tblRoles]
SELECT * FROM [dbo].[tblProduct]





