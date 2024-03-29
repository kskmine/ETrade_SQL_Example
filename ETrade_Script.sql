USE [master]
GO
/****** Object:  Database [ETrade]    Script Date: 2/11/2022 2:48:16 PM ******/
CREATE DATABASE [ETrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ETrade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ETrade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ETrade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ETrade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ETrade] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETrade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ETrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETrade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ETrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETrade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ETrade] SET  MULTI_USER 
GO
ALTER DATABASE [ETrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ETrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ETrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ETrade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ETrade] SET QUERY_STORE = OFF
GO
USE [ETrade]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(500,1) NOT NULL,
	[UserID] [int] NULL,
	[CountryID] [int] NOT NULL,
	[PostaCode] [varchar](50) NOT NULL,
	[AddressText] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(600,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[ID] [int] IDENTITY(800,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[OrderDetailID] [int] NULL,
	[ItemID] [int] NULL,
	[Amount] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[ID] [int] IDENTITY(700,1) NOT NULL,
	[OrderID] [int] NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[AddressID] [int] NULL,
	[CargoFicheNo] [varchar](20) NOT NULL,
	[TotalPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[OrderID] [int] NULL,
	[ItemID] [int] NULL,
	[Amount] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(100,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[AddressID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(900,1) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentID] [int] NULL,
	[PaymentStatus] [varchar](50) NOT NULL,
	[ApproveCode] [varchar](100) NOT NULL,
	[PaymentTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[ID] [int] IDENTITY(1000,1) NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/11/2022 2:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PWord] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Gender] [bit] NULL,
	[BirthDate] [date] NOT NULL,
	[CreateDate] [datetime] NULL,
	[TelNo] [nchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (501, 1, 604, N'34500A', N'Balat Fatih Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (502, 2, 601, N'67500', N'Kestane Balinin Diyari Zonguldak')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (503, 7, 601, N'34303', N'Hirka-i Serif Fatih Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (504, 4, 600, N'34295', N'Cartel Street Albuquerque New Mexico')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (505, 10, 602, N'34200', N'Bagcilar Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (506, 6, 602, N'341600A', N'Bahçelievler Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (507, 5, 601, N'34180', N'Sirinevler Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (508, 8, 601, N'34400', N' Sagmalcilar F tipi Istanbul')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (509, 9, 603, N'344500', N'Bagcilar ISTANBUL')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (510, 11, 600, N'58968', N'Arnavutköy Tekirdag')
GO
INSERT [dbo].[Addresses] ([ID], [UserID], [CountryID], [PostaCode], [AddressText]) VALUES (511, 3, 604, N'3450A', N'Feriköy Istanbul')
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([ID], [Country]) VALUES (600, N'Turkey')
GO
INSERT [dbo].[Countries] ([ID], [Country]) VALUES (601, N'England')
GO
INSERT [dbo].[Countries] ([ID], [Country]) VALUES (602, N'Germany')
GO
INSERT [dbo].[Countries] ([ID], [Country]) VALUES (603, N'France')
GO
INSERT [dbo].[Countries] ([ID], [Country]) VALUES (604, N'USA')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (2, N'860001', N'Bilgisayar', 18000.0000, 99)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (3, N'860067', N'KESTANE BALININ DIYARINDAN ZONGULDAK BALI', 6700.0000, 0)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (4, N'860093', N'Oyun Konsolu', 12999.0000, 20)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (5, N'820501', N'TOKAT YAPRAGI', 35.0000, 45)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (6, N'860006', N'Telefon', 9.9990, 100)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (7, N'865757', N' Pijama', 500.0000, 123)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (8, N'696969', N'Televizyon', 500.0000, 780)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (9, N'880008', N'Çay', 45.0000, 25)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (10, N'873900', N'KAÇAK ÇAY', 43.0000, 21)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (11, N'440004', N'Kayisili Çikolata', 950.0000, 44)
GO
INSERT [dbo].[Items] ([ID], [ItemCode], [ItemName], [UnitPrice], [Stock]) VALUES (12, N'850321', N'Tablet', 45.0000, 255)
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1000, 105, 2, 2, 36000.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1001, 106, 3, 2, 13400.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1002, 107, 4, 2, 25998.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1003, 108, 5, 2, 70.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1004, 109, 6, 2, 19.9980)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1005, 110, 7, 2, 1000.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1006, 111, 8, 2, 1000.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1007, 112, 9, 2, 90.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1008, 113, 10, 2, 86.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1009, 114, 11, 2, 1900.0000)
GO
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ItemID], [Amount], [UnitPrice]) VALUES (1010, 115, 12, 2, 90.0000)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (105, 1, CAST(N'2022-02-11T00:00:00.000' AS DateTime), 1, 501)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (106, 3, CAST(N'2022-02-17T00:00:00.000' AS DateTime), 1, 511)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (107, 6, CAST(N'2020-12-11T00:00:00.000' AS DateTime), 1, 506)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (108, 5, CAST(N'2022-02-19T00:00:00.000' AS DateTime), 7, 507)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (109, 8, CAST(N'2023-05-29T00:00:00.000' AS DateTime), 1, 508)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (110, 7, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 1, 503)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (111, 9, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 2, 509)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (112, 2, CAST(N'2022-02-15T00:00:00.000' AS DateTime), 1, 502)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (113, 10, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 1, 505)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (114, 11, CAST(N'2019-08-22T00:00:00.000' AS DateTime), 5, 510)
GO
INSERT [dbo].[Orders] ([ID], [UserID], [OrderDate], [OrderStatus], [AddressID]) VALUES (115, 4, CAST(N'2021-04-11T00:00:00.000' AS DateTime), 1, 504)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (1, N'kivanctcalisan', N'jomolokko', N'Kivanç Tolga', N'Çalisan', N'ktc@gmail.com', 1, CAST(N'1990-09-10' AS Date), CAST(N'2022-02-11T11:05:07.310' AS DateTime), N'05551234567    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (2, N'onuryurdagelen', N'sober12345', N'Onur', N'Yurdaelen', N'onuryurdagelen@gmail.com', 1, CAST(N'1999-04-01' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05531234567    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (3, N'ugurhikmet', N'PATTES', N'ugur hikmet', N'kose', N'ugurkose98@gmail.com', 1, CAST(N'1998-08-17' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05545454545    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (4, N'burcaktezcan', N'btezcan', N'Burçak', N'Tezcan', N'bt@gmail.com', 1, CAST(N'1993-08-01' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05551234568    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (5, N'halodayi', N'123123', N'halil', N'alakusu', N'halilalakusum@hotmail.com', 1, CAST(N'1992-04-24' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05348224968    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (6, N'krmadn', N'1234321', N'Kerim Adnan', N'Yarar', N'kay@gmail.com', 1, CAST(N'1999-03-30' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05555555555    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (7, N'receptayyip11', N'RTS', N'Recep Tayyip', N'Sever', N'receptayyip@gmail.com', 1, CAST(N'1994-02-02' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05536762251    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (8, N'utkugunes', N'111111', N'utku', N'gunes', N'utkugnss@gmail.com', 1, CAST(N'1993-10-08' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05392070357    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (9, N'sevind', N'sewD06', N'Sevin', N'Dindar', N'sevindindar1005@gmail.com', 0, CAST(N'2000-06-06' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05393309686    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (10, N'zehrakiran', N'123456', N'Zehra', N'Kiran', N'zehrakiran148@gmail.com', 0, CAST(N'1999-07-09' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05417121782    ')
GO
INSERT [dbo].[Users] ([ID], [Username], [PWord], [FirstName], [LastName], [Email], [Gender], [BirthDate], [CreateDate], [TelNo]) VALUES (11, N'eminekosak', N'ksk345', N'Emine', N'Kosak', N'kskemine6@gmail.com', 0, CAST(N'1997-11-08' AS Date), CAST(N'2022-02-11T11:20:52.957' AS DateTime), N'05384525732    ')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD FOREIGN KEY([OrderDetailID])
REFERENCES [dbo].[OrderDetails] ([ID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentTypes] ([ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_TelNo] CHECK  ((left([TelNo],(1))='0'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_TelNo]
GO
USE [master]
GO
ALTER DATABASE [ETrade] SET  READ_WRITE 
GO
