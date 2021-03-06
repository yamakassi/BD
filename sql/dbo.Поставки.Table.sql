USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Поставки]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставки](
	[Номер поставки] [int] NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Откуда поставляется] [nvarchar](50) NULL,
	[Стоимость поставки] [int] NOT NULL,
	[Ед.товара] [int] NOT NULL,
	[ID_сотрудника] [int] NULL,
 CONSTRAINT [PK_Поставки] PRIMARY KEY CLUSTERED 
(
	[Номер поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Поставки] ADD  CONSTRAINT [DF_Поставки_Ед.товара]  DEFAULT ((1)) FOR [Ед.товара]
GO
ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [FK_Поставки_Поставки] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщики] ([ID_поставщика])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Поставки]
GO
ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [FK_Поставки_Сотрудники] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Сотрудники]
GO
ALTER TABLE [dbo].[Поставки]  WITH NOCHECK ADD  CONSTRAINT [CK_Поставки] CHECK  (([Стоимость поставки]>(0)))
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [CK_Поставки]
GO
ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [CK_Поставки_1] CHECK  (([Ед.товара]>=(0) AND [Ед.товара]<=(10000)))
GO
ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [CK_Поставки_1]
GO
