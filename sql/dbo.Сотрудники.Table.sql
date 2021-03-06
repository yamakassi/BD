USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 24.11.2021 11:05:19 ******/
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
	[Умения работать со спец оборуд] [nvarchar](50) NULL,
	[Дата рождения] [date] NOT NULL,
	[Уровень образование] [nvarchar](10) NOT NULL,
	[ЗП] [money] NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_Умения работать со спец оборуд]  DEFAULT ('нет') FOR [Умения работать со спец оборуд]
GO
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_ЗП]  DEFAULT ((35000)) FOR [ЗП]
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
