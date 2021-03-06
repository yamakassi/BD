USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] IDENTITY(1,1) NOT NULL,
	[Юр.адрес] [nvarchar](400) NOT NULL,
	[Реквизиты] [nvarchar](300) NOT NULL,
	[Откуда поставляет] [nvarchar](500) NOT NULL,
	[Что поставляет] [nvarchar](200) NULL,
	[Телефон] [nvarchar](110) NOT NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики] CHECK  ((NOT [Телефон] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [CK_Поставщики]
GO
ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики_Юр_адрес] CHECK  ((NOT [Юр.адрес] like '%[^A-Za-zА-Яа-я1-9./,]%'))
GO
ALTER TABLE [dbo].[Поставщики] CHECK CONSTRAINT [CK_Поставщики_Юр_адрес]
GO
