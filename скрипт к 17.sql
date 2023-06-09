USE [master]
GO
/****** Object:  Database [РПМ№17]    Script Date: 29.03.2023 12:20:08 ******/
CREATE DATABASE [РПМ№17]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'РПМ№17', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\РПМ№17.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'РПМ№17_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\РПМ№17_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [РПМ№17] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [РПМ№17].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [РПМ№17] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [РПМ№17] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [РПМ№17] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [РПМ№17] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [РПМ№17] SET ARITHABORT OFF 
GO
ALTER DATABASE [РПМ№17] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [РПМ№17] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [РПМ№17] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [РПМ№17] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [РПМ№17] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [РПМ№17] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [РПМ№17] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [РПМ№17] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [РПМ№17] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [РПМ№17] SET  DISABLE_BROKER 
GO
ALTER DATABASE [РПМ№17] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [РПМ№17] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [РПМ№17] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [РПМ№17] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [РПМ№17] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [РПМ№17] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [РПМ№17] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [РПМ№17] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [РПМ№17] SET  MULTI_USER 
GO
ALTER DATABASE [РПМ№17] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [РПМ№17] SET DB_CHAINING OFF 
GO
ALTER DATABASE [РПМ№17] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [РПМ№17] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [РПМ№17] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [РПМ№17] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [РПМ№17] SET QUERY_STORE = OFF
GO
USE [РПМ№17]
GO
/****** Object:  Table [dbo].[Бухгалтерия]    Script Date: 29.03.2023 12:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Бухгалтерия](
	[ID] [int] NOT NULL,
	[Дата] [smalldatetime] NOT NULL,
	[НазваниеОрг] [nvarchar](50) NOT NULL,
	[АдресОрг] [nvarchar](50) NOT NULL,
	[Коммерческая] [nvarchar](50) NOT NULL,
	[ВидЗатрат] [nvarchar](50) NOT NULL,
	[Сумма] [money] NOT NULL,
 CONSTRAINT [PK_Бухгалтерия] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (1, CAST(N'2023-03-10T00:00:00' AS SmallDateTime), N'Глобус', N'г.Рязань, ул. Высоковольтная', N'Да', N'Производственные', 100000.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (2, CAST(N'2023-01-04T00:00:00' AS SmallDateTime), N'Пятерочка', N'ул.Бирюзова 29', N'Да', N'Не производственные', 500.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (3, CAST(N'2022-10-18T00:00:00' AS SmallDateTime), N'Магнит', N'ул. Интернациональная', N'Да', N'Производственные', 1250000.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (4, CAST(N'2023-03-12T00:00:00' AS SmallDateTime), N'Дикси', N'ул. Павлова 34', N'Да', N'Производственные', 465371.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (5, CAST(N'2023-03-13T00:00:00' AS SmallDateTime), N'Буфет ', N'пр-зд Шабулина 18', N'Нет', N'Производственные', 250000.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (6, CAST(N'2023-01-28T00:00:00' AS SmallDateTime), N'Вкусвилл', N'ул Ленина 1', N'Да', N'Не производственные', 32110.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (7, CAST(N'2023-03-29T00:00:00' AS SmallDateTime), N'Азбука вкуса', N'ул. Семченская 11', N'Да', N'Производственные', 456000.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (8, CAST(N'2022-06-16T00:00:00' AS SmallDateTime), N'Вкусно и точка', N'Московское шоссе д.5', N'Да', N'Производственные', 240638763.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (9, CAST(N'2023-03-13T00:00:00' AS SmallDateTime), N'Бургер Кинг', N'ул. Станкозаводская 12', N'Да', N'Не производственные', 500.0000)
INSERT [dbo].[Бухгалтерия] ([ID], [Дата], [НазваниеОрг], [АдресОрг], [Коммерческая], [ВидЗатрат], [Сумма]) VALUES (10, CAST(N'2022-11-22T00:00:00' AS SmallDateTime), N'Ёбидоёби', N'ул. Пушкина 6', N'Да', N'Производственные', 100000.0000)
GO
USE [master]
GO
ALTER DATABASE [РПМ№17] SET  READ_WRITE 
GO
