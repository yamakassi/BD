USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Места хранения]    Script Date: 24.11.2021 11:05:19 ******/
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
ALTER TABLE [dbo].[Места хранения]  WITH CHECK ADD  CONSTRAINT [FK_Места храненияя_Помещения] FOREIGN KEY([id_помещения])
REFERENCES [dbo].[Помещения] ([ID_помещения])
GO
ALTER TABLE [dbo].[Места хранения] CHECK CONSTRAINT [FK_Места храненияя_Помещения]
GO
ALTER TABLE [dbo].[Места хранения]  WITH CHECK ADD  CONSTRAINT [CK_Места храненияя] CHECK  ((NOT [Тип хранимой техники] like '%[^A-Za-zА-Яа-я0-9]%'))
GO
ALTER TABLE [dbo].[Места хранения] CHECK CONSTRAINT [CK_Места храненияя]
GO
