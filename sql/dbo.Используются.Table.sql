USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Используются]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Используются](
	[id_исполз_предмета] [int] NOT NULL,
	[id_обращения] [int] NOT NULL,
	[id_детали] [int] NOT NULL,
	[место_хранения] [int] NOT NULL,
	[дата_поставки] [nvarchar](50) NULL,
 CONSTRAINT [PK_Используются] PRIMARY KEY CLUSTERED 
(
	[id_исполз_предмета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Используются]  WITH CHECK ADD  CONSTRAINT [FK_Используются_Запчасти] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Запчасти] ([ID_запчасти])
GO
ALTER TABLE [dbo].[Используются] CHECK CONSTRAINT [FK_Используются_Запчасти]
GO
ALTER TABLE [dbo].[Используются]  WITH CHECK ADD  CONSTRAINT [FK_Используются_Обращения] FOREIGN KEY([id_обращения])
REFERENCES [dbo].[Обращения] ([ID_заказа])
GO
ALTER TABLE [dbo].[Используются] CHECK CONSTRAINT [FK_Используются_Обращения]
GO
