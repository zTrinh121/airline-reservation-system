USE [master]
GO
/****** Object:  Database [airline_reservation]    Script Date: 3/9/2024 8:32:46 PM ******/
CREATE DATABASE [airline_reservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airline_reservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\airline_reservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airline_reservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\Log\airline_reservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [airline_reservation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airline_reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airline_reservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airline_reservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airline_reservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airline_reservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airline_reservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [airline_reservation] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [airline_reservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airline_reservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airline_reservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airline_reservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airline_reservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airline_reservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airline_reservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airline_reservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airline_reservation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [airline_reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airline_reservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airline_reservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airline_reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airline_reservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airline_reservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airline_reservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airline_reservation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [airline_reservation] SET  MULTI_USER 
GO
ALTER DATABASE [airline_reservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airline_reservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airline_reservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airline_reservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airline_reservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airline_reservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [airline_reservation] SET QUERY_STORE = OFF
GO
USE [airline_reservation]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](15) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminId] [nvarchar](20) NOT NULL,
	[password] [nvarchar](30) NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[flightID] [nvarchar](10) NOT NULL,
	[fromCity] [nvarchar](20) NOT NULL,
	[toCity] [nvarchar](20) NOT NULL,
	[departureDate] [date] NOT NULL,
	[arrivalDate] [date] NOT NULL,
	[departureTime] [time](7) NOT NULL,
	[arrivalTime] [time](7) NOT NULL,
	[seatEconomy] [int] NOT NULL,
	[seatBusiness] [int] NOT NULL,
	[priceEconomy] [decimal](12, 3) NOT NULL,
	[priceBusiness] [decimal](12, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[flightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jetDetails]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jetDetails](
	[jetID] [nvarchar](10) NOT NULL,
	[jetType] [nvarchar](20) NULL,
	[totalCapacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[jetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passengers]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passengers](
	[pID] [int] NOT NULL,
	[pNameRecord] [nvarchar](15) NOT NULL,
	[pName] [nvarchar](30) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[pID] ASC,
	[pNameRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticketDetails]    Script Date: 3/9/2024 8:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticketDetails](
	[pNameRecord] [nvarchar](15) NOT NULL,
	[dateReservation] [date] NULL,
	[flightID] [nvarchar](10) NULL,
	[journeyDate] [date] NULL,
	[class] [nvarchar](10) NULL,
	[bookingStatus] [nvarchar](10) NULL,
	[noPassengers] [int] NULL,
	[accountID] [int] NULL,
	[payAmount] [decimal](12, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[pNameRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (1, N'Nguyễn Văn A', N'nguyenvana', N'nguyenvana', N'nguyenvana@example.com', N'0123456789', N'Hà Nội')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (2, N'Trần Thị B', N'tranthib', N'tranthib', N'tranthib@example.com', N'0987654321', N'Hồ Chí Minh')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (3, N'Lê Văn C', N'levanc', N'levanc', N'levanc@example.com', N'0369852147', N'Đà Nẵng')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (4, N'Phạm Thị D', N'phamthid', N'phamthid', N'phamthid@example.com', N'0123456789', N'Hải Phòng')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (5, N'Hoàng Văn E', N'hoangvane', N'hoangvane', N'hoangvane@example.com', N'0987654321', N'Cần Thơ')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (6, N'Vũ Thị F', N'vuthif', N'vuthif', N'vuthif@example.com', N'0369852147', N'Bình Dương')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (7, N'Đặng Văn G', N'dangvang', N'dangvang', N'dangvang@example.com', N'0123456789', N'Hải Dương')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (8, N'Nguyễn Thị H', N'nguyenthih', N'nguyenthih', N'nguyenthih@example.com', N'0987654321', N'Quảng Ninh')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (9, N'Trần Văn I', N'tranvani', N'tranvani', N'tranvani@example.com', N'0369852147', N'Hà Tĩnh')
INSERT [dbo].[Account] ([accountID], [fullName], [username], [password], [email], [phoneNumber], [address]) VALUES (10, N'Lê Thị K', N'lethik', N'lethik', N'lethik@example.com', N'0123456789', N'Hà Nam')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Admin] ([adminId], [password], [name], [email]) VALUES (N'admin', N'admin123', N'Nguyễn Văn Mỹ', N'nguyenvana@example.com')
GO
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN101', N'Hanoi', N'Ho Chi Minh City', CAST(N'2024-02-26' AS Date), CAST(N'2024-02-26' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 150, 50, CAST(100.000 AS Decimal(12, 3)), CAST(250.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN102', N'Ho Chi Minh City', N'Hanoi', CAST(N'2024-03-06' AS Date), CAST(N'2024-03-06' AS Date), CAST(N'09:30:00' AS Time), CAST(N'12:00:00' AS Time), 140, 60, CAST(120.000 AS Decimal(12, 3)), CAST(270.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN103', N'Da Nang', N'Nha Trang', CAST(N'2024-03-07' AS Date), CAST(N'2024-03-07' AS Date), CAST(N'11:15:00' AS Time), CAST(N'13:45:00' AS Time), 120, 40, CAST(90.000 AS Decimal(12, 3)), CAST(200.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN104', N'Nha Trang', N'Da Nang', CAST(N'2024-03-08' AS Date), CAST(N'2024-03-08' AS Date), CAST(N'13:45:00' AS Time), CAST(N'16:15:00' AS Time), 110, 30, CAST(95.000 AS Decimal(12, 3)), CAST(210.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN105', N'Can Tho', N'Phu Quoc', CAST(N'2024-03-09' AS Date), CAST(N'2024-03-09' AS Date), CAST(N'10:30:00' AS Time), CAST(N'11:45:00' AS Time), 100, 20, CAST(80.000 AS Decimal(12, 3)), CAST(180.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN106', N'Phu Quoc', N'Nha Trang', CAST(N'2024-03-08' AS Date), CAST(N'2024-03-08' AS Date), CAST(N'12:00:00' AS Time), CAST(N'13:15:00' AS Time), 90, 25, CAST(85.000 AS Decimal(12, 3)), CAST(190.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN107', N'Hue', N'Quy Nhon', CAST(N'2024-03-11' AS Date), CAST(N'2024-03-11' AS Date), CAST(N'08:45:00' AS Time), CAST(N'10:15:00' AS Time), 80, 15, CAST(70.000 AS Decimal(12, 3)), CAST(160.000 AS Decimal(12, 3)))
INSERT [dbo].[Flight] ([flightID], [fromCity], [toCity], [departureDate], [arrivalDate], [departureTime], [arrivalTime], [seatEconomy], [seatBusiness], [priceEconomy], [priceBusiness]) VALUES (N'VN111', N'Hanoi', N'Nha Trang', CAST(N'2024-03-29' AS Date), CAST(N'2024-03-29' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 100, 10, CAST(100000.000 AS Decimal(12, 3)), CAST(2500000.000 AS Decimal(12, 3)))
GO
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET001', N'Boeing 737', 150)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET002', N'Airbus A320', 180)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET003', N'Boeing 787', 250)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET004', N'Airbus A330', 300)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET005', N'Embraer E190', 100)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET006', N'Bombardier CRJ900', 90)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET007', N'Boeing 747', 400)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET008', N'Airbus A380', 500)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET009', N'Embraer E175', 80)
INSERT [dbo].[jetDetails] ([jetID], [jetType], [totalCapacity]) VALUES (N'JET010', N'Bombardier Q400', 70)
GO
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (1, N'PNR001', N'Nguyễn Văn A', 35, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (1, N'PNR002', N'Trần Thị B', 28, N'Female')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (1, N'PNR003', N'Lê Văn C', 45, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (2, N'PNR001', N'Phạm Thị D', 20, N'Female')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (2, N'PNR002', N'Hoàng Văn E', 55, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (2, N'PNR003', N'Vũ Thị F', 30, N'Female')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (3, N'PNR001', N'Đặng Văn G', 40, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (3, N'PNR002', N'Bùi Thị H', 25, N'Female')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (4, N'PNR001', N'Trịnh Văn I', 50, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (4, N'PNR004', N'Nguyễn Văn X', 40, N'Male')
INSERT [dbo].[passengers] ([pID], [pNameRecord], [pName], [age], [gender]) VALUES (5, N'PNR001', N'Đỗ Thị K', 33, N'Female')
GO
INSERT [dbo].[ticketDetails] ([pNameRecord], [dateReservation], [flightID], [journeyDate], [class], [bookingStatus], [noPassengers], [accountID], [payAmount]) VALUES (N'PNR001', CAST(N'2024-03-01' AS Date), N'VN101', CAST(N'2024-02-28' AS Date), N'Economy', N'Confirmed', 5, 1, CAST(150.000 AS Decimal(12, 3)))
INSERT [dbo].[ticketDetails] ([pNameRecord], [dateReservation], [flightID], [journeyDate], [class], [bookingStatus], [noPassengers], [accountID], [payAmount]) VALUES (N'PNR002', CAST(N'2024-03-02' AS Date), N'VN102', CAST(N'2024-03-06' AS Date), N'Business', N'Confirmed', 3, 2, CAST(200.000 AS Decimal(12, 3)))
INSERT [dbo].[ticketDetails] ([pNameRecord], [dateReservation], [flightID], [journeyDate], [class], [bookingStatus], [noPassengers], [accountID], [payAmount]) VALUES (N'PNR003', CAST(N'2024-03-03' AS Date), N'VN103', CAST(N'2024-03-07' AS Date), N'Economy', N'Confirmed', 2, 3, CAST(500.000 AS Decimal(12, 3)))
INSERT [dbo].[ticketDetails] ([pNameRecord], [dateReservation], [flightID], [journeyDate], [class], [bookingStatus], [noPassengers], [accountID], [payAmount]) VALUES (N'PNR004', CAST(N'2024-03-01' AS Date), N'VN107', CAST(N'2024-05-05' AS Date), N'Economy', N'Confirmed', 2, 4, CAST(300.000 AS Decimal(12, 3)))
GO
ALTER TABLE [dbo].[passengers]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_PNR] FOREIGN KEY([pNameRecord])
REFERENCES [dbo].[ticketDetails] ([pNameRecord])
GO
ALTER TABLE [dbo].[passengers] CHECK CONSTRAINT [FK_Passenger_PNR]
GO
ALTER TABLE [dbo].[ticketDetails]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticketDetails] CHECK CONSTRAINT [FK_Ticket_Account]
GO
USE [master]
GO
ALTER DATABASE [airline_reservation] SET  READ_WRITE 
GO
