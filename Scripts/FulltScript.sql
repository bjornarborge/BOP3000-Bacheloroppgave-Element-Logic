USE [master]
GO
/****** Object:  Database [Element Logic (Web Shop)]    Script Date: 25.01.2023 18:43:35 ******/
CREATE DATABASE [Element Logic (Web Shop)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Element Logic (Web Shop)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Element Logic (Web Shop).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Element Logic (Web Shop)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Element Logic (Web Shop)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Element Logic (Web Shop)] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Element Logic (Web Shop)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ARITHABORT OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET RECOVERY FULL 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET  MULTI_USER 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Element Logic (Web Shop)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Element Logic (Web Shop)] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Element Logic (Web Shop)', N'ON'
GO
ALTER DATABASE [Element Logic (Web Shop)] SET QUERY_STORE = OFF
GO
USE [Element Logic (Web Shop)]
GO
/****** Object:  Table [dbo].[Inbound]    Script Date: 25.01.2023 18:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inbound](
	[InboundId] [int] NOT NULL,
	[TransactionId] [int] NOT NULL,
	[PurchaseOrderId] [varchar](50) NOT NULL,
	[PurchaseOrderLineId] [int] NOT NULL,
	[ExtProductId] [varchar](50) NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Inbound] PRIMARY KEY CLUSTERED 
(
	[InboundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.01.2023 18:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ExtPickListId] [varchar](50) NOT NULL,
	[ExtOrderId] [nchar](10) NOT NULL,
	[ExtOrderLineId] [int] NOT NULL,
	[ExtProductId] [varchar](50) NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ExtPickListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.01.2023 18:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ExtProductId] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDesc] [varchar](500) NULL,
	[ImageId] [varchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ExtProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 25.01.2023 18:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [decimal](18, 3) NULL,
	[ExtProductId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inbound]  WITH CHECK ADD  CONSTRAINT [FK_Inbound_Products] FOREIGN KEY([ExtProductId])
REFERENCES [dbo].[Products] ([ExtProductId])
GO
ALTER TABLE [dbo].[Inbound] CHECK CONSTRAINT [FK_Inbound_Products]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Products] FOREIGN KEY([ExtProductId])
REFERENCES [dbo].[Products] ([ExtProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Products]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Products] FOREIGN KEY([ExtProductId])
REFERENCES [dbo].[Products] ([ExtProductId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Products]
GO
USE [master]
GO
ALTER DATABASE [Element Logic (Web Shop)] SET  READ_WRITE 
GO
