USE [master]
GO
/****** Object:  Database [AccountingOfArrival]    Script Date: 02.06.2023 18:28:36 ******/
CREATE DATABASE [AccountingOfArrival]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountingOfArrival', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountingOfArrival.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountingOfArrival_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AccountingOfArrival_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AccountingOfArrival] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingOfArrival].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingOfArrival] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AccountingOfArrival] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingOfArrival] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingOfArrival] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AccountingOfArrival] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingOfArrival] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountingOfArrival] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingOfArrival] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingOfArrival] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingOfArrival] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingOfArrival] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingOfArrival] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountingOfArrival] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AccountingOfArrival] SET QUERY_STORE = OFF
GO
USE [AccountingOfArrival]
GO
/****** Object:  Table [dbo].[CompositionsOfInvoice]    Script Date: 02.06.2023 18:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompositionsOfInvoice](
	[idComposition] [int] IDENTITY(1,1) NOT NULL,
	[idInvoice] [int] NULL,
	[idMaterial] [int] NULL,
	[Quantity] [int] NULL,
	[PricePerUnit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idComposition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counterparties]    Script Date: 02.06.2023 18:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counterparties](
	[idCounterparty] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[INN] [nvarchar](12) NULL,
	[Address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCounterparty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicesOnArrival]    Script Date: 02.06.2023 18:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicesOnArrival](
	[idInvoice] [int] IDENTITY(1,1) NOT NULL,
	[idCounterparty] [int] NULL,
	[idUser] [int] NULL,
	[DeliveryDate] [date] NULL,
	[DistributedInvoice] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOfUsers]    Script Date: 02.06.2023 18:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfUsers](
	[idUserTypes] [int] IDENTITY(1,1) NOT NULL,
	[NameType] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUserTypes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.06.2023 18:28:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [image] NULL,
	[Login] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[Surname] [nvarchar](150) NULL,
	[Name] [nvarchar](150) NULL,
	[Patronymic] [nvarchar](150) NULL,
	[DateOfBirthday] [date] NULL,
	[idUserTypes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompositionsOfInvoice]  WITH CHECK ADD FOREIGN KEY([idInvoice])
REFERENCES [dbo].[InvoicesOnArrival] ([idInvoice])
GO
ALTER TABLE [dbo].[InvoicesOnArrival]  WITH CHECK ADD FOREIGN KEY([idCounterparty])
REFERENCES [dbo].[Counterparties] ([idCounterparty])
GO
ALTER TABLE [dbo].[InvoicesOnArrival]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([idUserTypes])
REFERENCES [dbo].[TypesOfUsers] ([idUserTypes])
GO
USE [master]
GO
ALTER DATABASE [AccountingOfArrival] SET  READ_WRITE 
GO
