USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Клиент_ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](100) NOT NULL,
	[Имя] [nvarchar](90) NOT NULL,
	[Отчество] [nvarchar](90) NULL,
	[Пол] [nvarchar](1) NOT NULL,
	[Дата] [date] NOT NULL,
	[Адрес] [nvarchar](400) NULL,
	[Телефон] [nvarchar](14) NOT NULL,
	[email] [nvarchar](400) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Пол]  DEFAULT ('М') FOR [Пол]
GO
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Дата]  DEFAULT (getdate()) FOR [Дата]
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
