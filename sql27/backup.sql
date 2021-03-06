USE [master]
GO
/****** Object:  Database [АфанасьевИС]    Script Date: 03.12.2021 7:40:27 ******/
CREATE DATABASE [АфанасьевИС]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'АфанасьевИС', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\АфанасьевИС.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'АфанасьевИС_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\АфанасьевИС_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [АфанасьевИС] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [АфанасьевИС].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [АфанасьевИС] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [АфанасьевИС] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [АфанасьевИС] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [АфанасьевИС] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [АфанасьевИС] SET ARITHABORT OFF 
GO
ALTER DATABASE [АфанасьевИС] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [АфанасьевИС] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [АфанасьевИС] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [АфанасьевИС] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [АфанасьевИС] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [АфанасьевИС] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [АфанасьевИС] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [АфанасьевИС] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [АфанасьевИС] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [АфанасьевИС] SET  DISABLE_BROKER 
GO
ALTER DATABASE [АфанасьевИС] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [АфанасьевИС] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [АфанасьевИС] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [АфанасьевИС] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [АфанасьевИС] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [АфанасьевИС] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [АфанасьевИС] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [АфанасьевИС] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [АфанасьевИС] SET  MULTI_USER 
GO
ALTER DATABASE [АфанасьевИС] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [АфанасьевИС] SET DB_CHAINING OFF 
GO
ALTER DATABASE [АфанасьевИС] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [АфанасьевИС] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [АфанасьевИС] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [АфанасьевИС] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [АфанасьевИС] SET QUERY_STORE = OFF
GO
USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Запчасти]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запчасти](
	[ID_запчасти] [int] IDENTITY(1,1) NOT NULL,
	[id_места] [int] NOT NULL,
	[Номер поставки] [int] NULL,
	[Название запчасти] [nvarchar](50) NOT NULL,
	[Стоимость] [money] NULL,
 CONSTRAINT [PK_Запчасти] PRIMARY KEY CLUSTERED 
(
	[ID_запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Используются]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Используются](
	[id_исполз_предмета] [int] NOT NULL,
	[id_обращения] [int] NOT NULL,
	[id_детали] [int] NOT NULL,
	[место_хранения] [int] NOT NULL,
 CONSTRAINT [PK_Используются] PRIMARY KEY CLUSTERED 
(
	[id_исполз_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Клиент_ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](100) NULL,
	[Имя] [nvarchar](90) NULL,
	[Отчество] [nvarchar](90) NULL,
	[Пол] [nvarchar](1) NULL,
	[Дата] [date] NULL,
	[Адрес] [nvarchar](400) NULL,
	[Телефон] [nvarchar](14) NULL,
	[email] [nvarchar](400) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Места хранения]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Места хранения](
	[id_места] [int] NOT NULL,
	[id_помещения] [int] IDENTITY(1,1) NOT NULL,
	[Тип хранимой техники] [nvarchar](50) NULL,
	[номер_стелажа] [nvarchar](50) NULL,
	[номер_полки] [nvarchar](50) NULL,
 CONSTRAINT [PK_Места храненияя] PRIMARY KEY CLUSTERED 
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обращения]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обращения](
	[ID_обращения] [int] IDENTITY(1,1) NOT NULL,
	[ID_клиента] [int] NULL,
	[ID_cотрудника] [int] NULL,
	[Номер_техники] [int] NULL,
	[Стоимость] [int] NULL,
	[Дата принятия] [date] NULL,
	[Время ремонта] [int] NOT NULL,
	[Скидка] [int] NOT NULL,
	[Запчасти] [int] NULL,
	[Гарантия] [nvarchar](50) NULL,
	[Заявленный дефект] [nvarchar](250) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID_обращения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Помещения]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Помещения](
	[ID_помещения] [int] IDENTITY(1,1) NOT NULL,
	[Этаж] [int] NOT NULL,
	[Вместимость] [int] NULL,
	[Площадь] [int] NULL,
 CONSTRAINT [PK_Помещения] PRIMARY KEY CLUSTERED 
(
	[ID_помещения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставки]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставки](
	[Номер поставки] [int] IDENTITY(1,1) NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Стоимость поставки] [int] NOT NULL,
	[Ед.товара] [int] NOT NULL,
	[ID_сотрудника] [int] NULL,
	[Дата поставки] [date] NULL,
 CONSTRAINT [PK_Поставки] PRIMARY KEY CLUSTERED 
(
	[Номер поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] IDENTITY(1,1) NOT NULL,
	[Юр.адрес] [nvarchar](400) NOT NULL,
	[Реквизиты] [nvarchar](300) NOT NULL,
	[Откуда поставляет] [nvarchar](300) NOT NULL,
	[Что поставляет] [nvarchar](200) NULL,
	[Телефон] [nvarchar](110) NOT NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](100) NOT NULL,
	[Имя] [nvarchar](100) NOT NULL,
	[Отчество] [nvarchar](100) NULL,
	[Телефон] [nvarchar](100) NOT NULL,
	[Должность] [nvarchar](50) NULL,
	[Спец навыки] [nvarchar](50) NULL,
	[Дата рождения] [date] NOT NULL,
	[Уровень образования] [nvarchar](10) NOT NULL,
	[ЗП] [money] NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Техника]    Script Date: 03.12.2021 7:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Техника](
	[Серийный номер] [int] IDENTITY(201200,1) NOT NULL,
	[ID_клиент] [int] NOT NULL,
	[ID_обращения] [int] NOT NULL,
	[Модель] [nvarchar](100) NOT NULL,
	[Компания] [nvarchar](90) NULL,
	[Страна производства] [nvarchar](90) NULL,
	[Состояние] [nvarchar](400) NULL,
	[Год выпуска] [date] NULL,
 CONSTRAINT [PK_Техника] PRIMARY KEY CLUSTERED 
(
	[Серийный номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Запчасти_Место]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Место] ON [dbo].[Запчасти]
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Запчасти_Название]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Название] ON [dbo].[Запчасти]
(
	[Название запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Запчасти_Название_Стоимость_Поставка]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Название_Стоимость_Поставка] ON [dbo].[Запчасти]
(
	[Название запчасти] ASC,
	[Номер поставки] ASC,
	[Стоимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Запчасти_Поставка]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Поставка] ON [dbo].[Запчасти]
(
	[Номер поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Запчасти_Поставка_Название]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Поставка_Название] ON [dbo].[Запчасти]
(
	[Номер поставки] ASC,
	[Название запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Запчасти_Поставка_Стоимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Поставка_Стоимость] ON [dbo].[Запчасти]
(
	[Номер поставки] ASC,
	[Стоимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Запчасти_Стоимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Стоимость] ON [dbo].[Запчасти]
(
	[Стоимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Запчасти_Стоимость_Название]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Запчасти_Стоимость_Название] ON [dbo].[Запчасти]
(
	[Стоимость] ASC,
	[Название запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Используются_Детали]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Используются_Детали] ON [dbo].[Используются]
(
	[id_детали] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Используются_Место]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Используются_Место] ON [dbo].[Используются]
(
	[место_хранения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Используются_Обращения]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Используются_Обращения] ON [dbo].[Используются]
(
	[id_обращения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Используются_Обращения_Детали]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Используются_Обращения_Детали] ON [dbo].[Используются]
(
	[id_обращения] ASC,
	[id_детали] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Используются_Обращения_Места]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Используются_Обращения_Места] ON [dbo].[Используются]
(
	[id_обращения] ASC,
	[место_хранения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Клиенты_1]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_1] ON [dbo].[Клиенты]
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_email]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_email] ON [dbo].[Клиенты]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_Адрес]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Адрес] ON [dbo].[Клиенты]
(
	[Адрес] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Клиенты_ДатаРож]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_ДатаРож] ON [dbo].[Клиенты]
(
	[Дата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_Имя]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Имя] ON [dbo].[Клиенты]
(
	[Имя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_Отчество]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Отчество] ON [dbo].[Клиенты]
(
	[Отчество] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_Пол]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Пол] ON [dbo].[Клиенты]
(
	[Пол] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_Фамилия]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Фамилия] ON [dbo].[Клиенты]
(
	[Фамилия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Клиенты_Фамилия_Адрес]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_Фамилия_Адрес] ON [dbo].[Клиенты]
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_ФИ]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_ФИ] ON [dbo].[Клиенты]
(
	[Фамилия] ASC,
	[Имя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Клиенты_ФИО]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Клиенты_ФИО] ON [dbo].[Клиенты]
(
	[Фамилия] ASC,
	[Имя] ASC,
	[Отчество] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Места хранения]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Места хранения] ON [dbo].[Места хранения]
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Места хранения_1]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Места хранения_1] ON [dbo].[Места хранения]
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_хранения_Полки]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_хранения_Полки] ON [dbo].[Места хранения]
(
	[номер_полки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_хранения_полки_стелаж]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_хранения_полки_стелаж] ON [dbo].[Места хранения]
(
	[номер_полки] ASC,
	[номер_стелажа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_хранения_Помещения]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_хранения_Помещения] ON [dbo].[Места хранения]
(
	[id_помещения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_хранения_стелаж]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_хранения_стелаж] ON [dbo].[Места хранения]
(
	[номер_стелажа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения] ON [dbo].[Обращения]
(
	[Время ремонта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_1]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_1] ON [dbo].[Обращения]
(
	[ID_обращения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Время_Скидка]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Время_Скидка] ON [dbo].[Обращения]
(
	[Время ремонта] ASC,
	[Скидка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Обращения_Гарантия]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Гарантия] ON [dbo].[Обращения]
(
	[Гарантия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Дата_Время]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Дата_Время] ON [dbo].[Обращения]
(
	[Время ремонта] ASC,
	[Дата принятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_ДатаПринятия]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_ДатаПринятия] ON [dbo].[Обращения]
(
	[Дата принятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Обращения_Дефект]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Дефект] ON [dbo].[Обращения]
(
	[Заявленный дефект] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Клиент]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Клиент] ON [dbo].[Обращения]
(
	[ID_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Скидка]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Скидка] ON [dbo].[Обращения]
(
	[Скидка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Срочзаказы]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Срочзаказы] ON [dbo].[Обращения]
(
	[Дата принятия] DESC,
	[Время ремонта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Стоимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Стоимость] ON [dbo].[Обращения]
(
	[Стоимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Обращения_Стоимость_Скидка]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Обращения_Стоимость_Скидка] ON [dbo].[Обращения]
(
	[Стоимость] ASC,
	[Скидка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Вместимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Вместимость] ON [dbo].[Помещения]
(
	[Вместимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Площадь]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Площадь] ON [dbo].[Помещения]
(
	[Площадь] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Площадь_Вместимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Площадь_Вместимость] ON [dbo].[Помещения]
(
	[Площадь] ASC,
	[Вместимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Этаж]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Этаж] ON [dbo].[Помещения]
(
	[Этаж] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Этаж_Площадь]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Этаж_Площадь] ON [dbo].[Помещения]
(
	[Этаж] ASC,
	[Площадь] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Помещения_Этаж_Площадь_Вместимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Помещения_Этаж_Площадь_Вместимость] ON [dbo].[Помещения]
(
	[Этаж] ASC,
	[Площадь] ASC,
	[Вместимость] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_Дата]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_Дата] ON [dbo].[Поставки]
(
	[Дата поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_КолвоТовара]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_КолвоТовара] ON [dbo].[Поставки]
(
	[Ед.товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_Поставщик]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_Поставщик] ON [dbo].[Поставки]
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_Стоимость]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_Стоимость] ON [dbo].[Поставки]
(
	[Стоимость поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_Стоимость_Дата]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_Стоимость_Дата] ON [dbo].[Поставки]
(
	[Стоимость поставки] ASC,
	[Дата поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Поставки_Стоимость_КолВо]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставки_Стоимость_КолВо] ON [dbo].[Поставки]
(
	[Стоимость поставки] ASC,
	[Ед.товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Поставщики_Адрес]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставщики_Адрес] ON [dbo].[Поставщики]
(
	[Юр.адрес] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Поставщики_ГородПоставки]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставщики_ГородПоставки] ON [dbo].[Поставщики]
(
	[Откуда поставляет] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Поставщики_Поставляет]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставщики_Поставляет] ON [dbo].[Поставщики]
(
	[Что поставляет] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Поставщики_Поставляет_Адрес]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставщики_Поставляет_Адрес] ON [dbo].[Поставщики]
(
	[Откуда поставляет] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Поставщики_Реквизиты]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Поставщики_Реквизиты] ON [dbo].[Поставщики]
(
	[Реквизиты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_ДеньР_Фамилия]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_ДеньР_Фамилия] ON [dbo].[Сотрудники]
(
	[Дата рождения] ASC,
	[Фамилия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Сотрудники_ДеньРождения]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_ДеньРождения] ON [dbo].[Сотрудники]
(
	[Дата рождения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Должность]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Должность] ON [dbo].[Сотрудники]
(
	[Должность] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Сотрудники_ЗП]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_ЗП] ON [dbo].[Сотрудники]
(
	[ЗП] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Имя]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Имя] ON [dbo].[Сотрудники]
(
	[Имя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Имя_Отчество]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Имя_Отчество] ON [dbo].[Сотрудники]
(
	[Имя] ASC,
	[Отчество] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Навыки]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Навыки] ON [dbo].[Сотрудники]
(
	[Спец навыки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Образование]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Образование] ON [dbo].[Сотрудники]
(
	[Уровень образования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Отчество]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Отчество] ON [dbo].[Сотрудники]
(
	[Отчество] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Фамилия]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Фамилия] ON [dbo].[Сотрудники]
(
	[Телефон] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_Фамилия_Имя]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_Фамилия_Имя] ON [dbo].[Сотрудники]
(
	[Фамилия] ASC,
	[Имя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_ФИО]    Script Date: 03.12.2021 7:40:27 ******/
CREATE NONCLUSTERED INDEX [IX_Сотрудники_ФИО] ON [dbo].[Сотрудники]
(
	[Фамилия] ASC,
	[Имя] ASC,
	[Отчество] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Пол]  DEFAULT ('М') FOR [Пол]
GO
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Дата]  DEFAULT (getdate()) FOR [Дата]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Стоимость]  DEFAULT ((0)) FOR [Стоимость]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Дата принятия]  DEFAULT (getdate()) FOR [Дата принятия]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Заказы_Скидка]  DEFAULT ((3)) FOR [Скидка]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Категория]  DEFAULT ('гарантийный') FOR [Гарантия]
GO
ALTER TABLE [dbo].[Помещения] ADD  CONSTRAINT [DF_Помещения_Этаж]  DEFAULT ((1)) FOR [Этаж]
GO
ALTER TABLE [dbo].[Поставки] ADD  CONSTRAINT [DF_Поставки_Ед.товара]  DEFAULT ((1)) FOR [Ед.товара]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_Умения работать со спец оборуд]  DEFAULT ('нет') FOR [Спец навыки]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_ЗП]  DEFAULT ((35000)) FOR [ЗП]
GO
ALTER TABLE [dbo].[Техника] ADD  CONSTRAINT [DF_Техника_Компания]  DEFAULT (N'Apple') FOR [Компания]
GO
ALTER TABLE [dbo].[Запчасти]  WITH NOCHECK ADD  CONSTRAINT [FK_Запчасти_Места хранения] FOREIGN KEY([id_места])
REFERENCES [dbo].[Места хранения] ([id_места])
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Места хранения]
GO
ALTER TABLE [dbo].[Запчасти]  WITH NOCHECK ADD  CONSTRAINT [FK_Запчасти_Номер_поставки] FOREIGN KEY([Номер поставки])
REFERENCES [dbo].[Поставки] ([Номер поставки])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Номер_поставки]
GO
ALTER TABLE [dbo].[Используются]  WITH NOCHECK ADD  CONSTRAINT [FK_Используются_Запчасти] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Запчасти] ([ID_запчасти])
GO
ALTER TABLE [dbo].[Используются] CHECK CONSTRAINT [FK_Используются_Запчасти]
GO
ALTER TABLE [dbo].[Используются]  WITH NOCHECK ADD  CONSTRAINT [FK_Используются_Места хранения] FOREIGN KEY([id_исполз_предмета])
REFERENCES [dbo].[Места хранения] ([id_места])
GO
ALTER TABLE [dbo].[Используются] CHECK CONSTRAINT [FK_Используются_Места хранения]
GO
ALTER TABLE [dbo].[Используются]  WITH CHECK ADD  CONSTRAINT [FK_Используются_Обращения] FOREIGN KEY([id_обращения])
REFERENCES [dbo].[Обращения] ([ID_обращения])
GO
ALTER TABLE [dbo].[Используются] CHECK CONSTRAINT [FK_Используются_Обращения]
GO
ALTER TABLE [dbo].[Места хранения]  WITH NOCHECK ADD  CONSTRAINT [FK_Места храненияя_Помещения] FOREIGN KEY([id_помещения])
REFERENCES [dbo].[Помещения] ([ID_помещения])
GO
ALTER TABLE [dbo].[Места хранения] CHECK CONSTRAINT [FK_Места храненияя_Помещения]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([ID_клиента])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Клиенты]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([ID_cотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Сотрудники]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [FK_Заказы_Техника] FOREIGN KEY([Номер_техники])
REFERENCES [dbo].[Техника] ([Серийный номер])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Техника]
GO
ALTER TABLE [dbo].[Поставки]  WITH NOCHECK ADD  CONSTRAINT [FK_Поставки_Поставки] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщики] ([ID_поставщика])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Поставки]
GO
ALTER TABLE [dbo].[Поставки]  WITH NOCHECK ADD  CONSTRAINT [FK_Поставки_Сотрудники] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Сотрудники]
GO
ALTER TABLE [dbo].[Техника]  WITH NOCHECK ADD  CONSTRAINT [FK_Техника_Клиент] FOREIGN KEY([ID_клиент])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Техника] CHECK CONSTRAINT [FK_Техника_Клиент]
GO
ALTER TABLE [dbo].[Запчасти]  WITH NOCHECK ADD  CONSTRAINT [CK_Запчасти] CHECK  (([Название запчасти] like '[A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [CK_Запчасти]
GO
ALTER TABLE [dbo].[Запчасти]  WITH NOCHECK ADD  CONSTRAINT [CK_Запчасти_Стоимость] CHECK  (([Стоимость]>(0)))
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [CK_Запчасти_Стоимость]
GO
ALTER TABLE [dbo].[Клиенты]  WITH NOCHECK ADD  CONSTRAINT [CK_Клиенты_Адрес] CHECK  ((NOT [Адрес] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Адрес]
GO
ALTER TABLE [dbo].[Клиенты]  WITH NOCHECK ADD  CONSTRAINT [CK_Клиенты_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Имя]
GO
ALTER TABLE [dbo].[Клиенты]  WITH NOCHECK ADD  CONSTRAINT [CK_Клиенты_Пол] CHECK  (([Пол] like '[МЖ]'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Пол]
GO
ALTER TABLE [dbo].[Клиенты]  WITH NOCHECK ADD  CONSTRAINT [CK_Клиенты_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Фамилия]
GO
ALTER TABLE [dbo].[Места хранения]  WITH NOCHECK ADD  CONSTRAINT [CK_Места храненияя] CHECK  ((NOT [Тип хранимой техники] like '%[^A-Za-zА-Яа-я0-9]%'))
GO
ALTER TABLE [dbo].[Места хранения] CHECK CONSTRAINT [CK_Места храненияя]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [CK_Заказы] CHECK  (([Скидка]>=(0) AND [Скидка]<=(100)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [CK_Заказы_Стоимость] CHECK  (([Стоимость]>(0) AND [Стоимость]<(100000)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы_Стоимость]
GO
ALTER TABLE [dbo].[Помещения]  WITH NOCHECK ADD  CONSTRAINT [CK_Помещения_Вместимость] CHECK  (([Вместимость]>=(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_Вместимость]
GO
ALTER TABLE [dbo].[Помещения]  WITH NOCHECK ADD  CONSTRAINT [CK_Помещения_Площадь] CHECK  (([Площадь]>(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_Площадь]
GO
ALTER TABLE [dbo].[Помещения]  WITH NOCHECK ADD  CONSTRAINT [CK_Помещения_этаж] CHECK  (([Этаж]>=(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_этаж]
GO
ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [CK_Поставки_1] CHECK  (([Ед.товара]>=(0) AND [Ед.товара]<=(10000)))
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [CK_Поставки_1]
GO
ALTER TABLE [dbo].[Поставщики]  WITH NOCHECK ADD  CONSTRAINT [CK_Поставщики_Юр_адрес] CHECK  ((NOT [Юр.адрес] like '%[^A-Za-zА-Яа-я1-9./,]%'))
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [CK_Поставщики_Юр_адрес]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_3] CHECK  (([Спец навыки]='да' OR [Спец навыки]='нет'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_3]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_ЗП] CHECK  (([ЗП]>=(0) OR [ЗП]<=(1000000)))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_ЗП]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Имя]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Образование] CHECK  ((NOT [Уровень образования] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Образование]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Телефон] CHECK  ((NOT [Телефон] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Телефон]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Фамилия]
GO
USE [master]
GO
ALTER DATABASE [АфанасьевИС] SET  READ_WRITE 
GO
