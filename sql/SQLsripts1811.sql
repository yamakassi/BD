USE [master]
GO
/****** Object:  Database [АфанасьевИС]    Script Date: 18.11.2021 9:15:32 ******/
CREATE DATABASE [АфанасьевИС]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'АфанасьевИС', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\АфанасьевИС.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Деталь1]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Деталь1](
	[id_детали] [int] NOT NULL,
	[id_обращения] [int] NOT NULL,
	[дата_поставки] [varchar](50) NULL,
	[место_хранения] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Запчасти]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запчасти](
	[ID_запчасти] [int] IDENTITY(1,1) NOT NULL,
	[id_места] [int] NOT NULL,
	[Номер поставки] [int] NOT NULL,
	[Название запчасти] [varchar](50) NOT NULL,
	[Применяемость в ремонте] [varchar](50) NULL,
	[Стоимость] [money] NULL,
 CONSTRAINT [PK_Запчасти] PRIMARY KEY CLUSTERED 
(
	[ID_запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Клиент_ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NULL,
	[Пол] [char](10) NOT NULL,
	[Дата] [date] NOT NULL,
	[Адрес] [varchar](50) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Места храненияя]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Места храненияя](
	[id_места] [int] NOT NULL,
	[id_помещения] [int] IDENTITY(1,1) NOT NULL,
	[Тип хранимой техники] [varchar](50) NULL,
 CONSTRAINT [PK_Места храненияя] PRIMARY KEY CLUSTERED 
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обращения]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обращения](
	[ID_заказа] [int] IDENTITY(1,1) NOT NULL,
	[ID_клиента] [int] NULL,
	[ID_cотрудника] [int] NULL,
	[Номер_техники] [int] NULL,
	[Стоимость] [money] NULL,
	[Дата принятия] [date] NULL,
	[Время ремонта] [date] NULL,
	[Скидка] [money] NOT NULL,
	[Запчасти] [int] NULL,
	[Категория] [varchar](30) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Помещения]    Script Date: 18.11.2021 9:15:33 ******/
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
/****** Object:  Table [dbo].[Поставки]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставки](
	[Номер поставки] [int] NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Откуда поставляется] [varchar](50) NULL,
	[Стоимость поставки] [int] NOT NULL,
	[Ед.товара] [int] NOT NULL,
 CONSTRAINT [PK_Поставки] PRIMARY KEY CLUSTERED 
(
	[Номер поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] IDENTITY(1,1) NOT NULL,
	[Юр.адрес] [varchar](50) NULL,
	[Реквизиты] [varchar](50) NULL,
	[Откуда поставляет] [varchar](50) NULL,
	[Что поставляет] [varchar](50) NULL,
	[Телефон] [varchar](10) NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_сотрудника] [int] NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NULL,
	[Телефон] [varchar](10) NOT NULL,
	[Умения работать со спец оборуд] [char](10) NULL,
	[Дата рождения] [date] NOT NULL,
	[Уровень образование] [varchar](50) NOT NULL,
	[ЗП] [money] NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Техника]    Script Date: 18.11.2021 9:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Техника](
	[Серийный номер] [int] IDENTITY(201200,1) NOT NULL,
	[ID_клиент] [int] NOT NULL,
	[ID_заказа] [int] NOT NULL,
	[Тип техники] [varchar](30) NULL,
	[Модель] [varchar](30) NOT NULL,
	[Тип поломки] [varchar](max) NOT NULL,
	[Гарантия] [char](10) NOT NULL,
	[Год выпуска] [int] NULL,
	[Страна производства] [varchar](30) NULL,
	[Стоимость ремонта] [money] NULL,
 CONSTRAINT [PK_Техника] PRIMARY KEY CLUSTERED 
(
	[Серийный номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Категория]  DEFAULT ('гарантийный') FOR [Категория]
GO
ALTER TABLE [dbo].[Помещения] ADD  CONSTRAINT [DF_Помещения_Этаж]  DEFAULT ((1)) FOR [Этаж]
GO
ALTER TABLE [dbo].[Поставки] ADD  CONSTRAINT [DF_Поставки_Ед.товара]  DEFAULT ((1)) FOR [Ед.товара]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_Умения работать со спец оборуд]  DEFAULT ('нет') FOR [Умения работать со спец оборуд]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_ЗП]  DEFAULT ((35000)) FOR [ЗП]
GO
ALTER TABLE [dbo].[Деталь1]  WITH CHECK ADD  CONSTRAINT [FK_Деталь1_Запчасти] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Запчасти] ([ID_запчасти])
GO
ALTER TABLE [dbo].[Деталь1] CHECK CONSTRAINT [FK_Деталь1_Запчасти]
GO
ALTER TABLE [dbo].[Деталь1]  WITH CHECK ADD  CONSTRAINT [FK_Деталь1_Места храненияя] FOREIGN KEY([место_хранения])
REFERENCES [dbo].[Места храненияя] ([id_места])
GO
ALTER TABLE [dbo].[Деталь1] CHECK CONSTRAINT [FK_Деталь1_Места храненияя]
GO
ALTER TABLE [dbo].[Деталь1]  WITH CHECK ADD  CONSTRAINT [FK_Деталь1_Обращения] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Обращения] ([ID_заказа])
GO
ALTER TABLE [dbo].[Деталь1] CHECK CONSTRAINT [FK_Деталь1_Обращения]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [FK_Запчасти_Номер_поставки] FOREIGN KEY([Номер поставки])
REFERENCES [dbo].[Поставки] ([Номер поставки])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Номер_поставки]
GO
ALTER TABLE [dbo].[Места храненияя]  WITH CHECK ADD  CONSTRAINT [FK_Места храненияя_Помещения] FOREIGN KEY([id_помещения])
REFERENCES [dbo].[Помещения] ([ID_помещения])
GO
ALTER TABLE [dbo].[Места храненияя] CHECK CONSTRAINT [FK_Места храненияя_Помещения]
GO
ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([ID_клиента])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Клиенты]
GO
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([ID_cотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Сотрудники]
GO
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Техника] FOREIGN KEY([Номер_техники])
REFERENCES [dbo].[Техника] ([Серийный номер])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Техника]
GO
ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [FK_Поставки_Поставки] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщики] ([ID_поставщика])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Поставки]
GO
ALTER TABLE [dbo].[Техника]  WITH CHECK ADD  CONSTRAINT [FK_Техника_Клиент] FOREIGN KEY([ID_клиент])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Техника] CHECK CONSTRAINT [FK_Техника_Клиент]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти] CHECK  (([Название запчасти] like '[A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [CK_Запчасти]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти_1] CHECK  (([Применяемость в ремонте] like '[A-Za-zА-Яа-я.,/]%'))
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [CK_Запчасти_1]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти_Стоимость] CHECK  (([Стоимость]>(0)))
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [CK_Запчасти_Стоимость]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Адрес] CHECK  ((NOT [Адрес] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Адрес]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Имя]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Пол] CHECK  (([Пол] like '[МЖ]'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Пол]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [CK_Клиенты_Фамилия]
GO
ALTER TABLE [dbo].[Места храненияя]  WITH CHECK ADD  CONSTRAINT [CK_Места храненияя] CHECK  ((NOT [Тип хранимой техники] like '%[^A-Za-zА-Яа-я0-9]%'))
GO
ALTER TABLE [dbo].[Места храненияя] CHECK CONSTRAINT [CK_Места храненияя]
GO
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы] CHECK  (([Скидка]>(0) AND [Скидка]<(100)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы]
GO
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы_Стоимость] CHECK  (([Стоимость]>(0) AND [Стоимость]<(100000)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы_Стоимость]
GO
ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_Вместимость] CHECK  (([Вместимость]>(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_Вместимость]
GO
ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_Площадь] CHECK  (([Площадь]>(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_Площадь]
GO
ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_этаж] CHECK  (([Этаж]>=(0)))
GO
ALTER TABLE [dbo].[Помещения] CHECK CONSTRAINT [CK_Помещения_этаж]
GO
ALTER TABLE [dbo].[Поставки]  WITH NOCHECK ADD  CONSTRAINT [CK_Поставки] CHECK  (([Стоимость поставки]>(0)))
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [CK_Поставки]
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики] CHECK  ((NOT [Телефон] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [CK_Поставщики]
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики_Юр_адрес] CHECK  ((NOT [Юр.адрес] like '%[^A-Za-zА-Яа-я1-9./,]%'))
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [CK_Поставщики_Юр_адрес]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники] CHECK  ((NOT [Уровень образование] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_1] CHECK  (([ЗП]>(0)))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_1]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_2] CHECK  ((NOT [Телефон] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_2]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудники_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Имя]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [CK_Сотрудники_Фамилия]
GO
USE [master]
GO
ALTER DATABASE [АфанасьевИС] SET  READ_WRITE 
GO
