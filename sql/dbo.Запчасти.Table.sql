USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Запчасти]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запчасти](
	[ID_запчасти] [int] IDENTITY(1,1) NOT NULL,
	[id_места] [int] NOT NULL,
	[Номер поставки] [int] NOT NULL,
	[Название запчасти] [nvarchar](50) NOT NULL,
	[Применяемость в ремонте] [nvarchar](50) NULL,
	[Стоимость] [money] NULL,
 CONSTRAINT [PK_Запчасти] PRIMARY KEY CLUSTERED 
(
	[ID_запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [FK_Запчасти_Места хранения] FOREIGN KEY([id_места])
REFERENCES [dbo].[Места хранения] ([id_места])
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Места хранения]
GO
ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [FK_Запчасти_Номер_поставки] FOREIGN KEY([Номер поставки])
REFERENCES [dbo].[Поставки] ([Номер поставки])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Номер_поставки]
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
