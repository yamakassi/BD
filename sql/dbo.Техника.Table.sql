USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Техника]    Script Date: 24.11.2021 11:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Техника](
	[Серийный номер] [int] IDENTITY(201200,1) NOT NULL,
	[ID_клиент] [int] NOT NULL,
	[ID_заказа] [int] NOT NULL,
	[Тип техники] [nvarchar](100) NULL,
	[Модель] [nvarchar](100) NOT NULL,
	[Тип поломки] [nvarchar](max) NOT NULL,
	[Гарантия] [nvarchar](100) NOT NULL,
	[Год выпуска] [int] NOT NULL,
	[Страна производства] [nvarchar](90) NULL,
	[Стоимость ремонта] [money] NULL,
 CONSTRAINT [PK_Техника] PRIMARY KEY CLUSTERED 
(
	[Серийный номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Техника]  WITH CHECK ADD  CONSTRAINT [FK_Техника_Клиент] FOREIGN KEY([ID_клиент])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Техника] CHECK CONSTRAINT [FK_Техника_Клиент]
GO
