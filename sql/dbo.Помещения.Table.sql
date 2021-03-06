USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Помещения]    Script Date: 24.11.2021 11:05:19 ******/
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
ALTER TABLE [dbo].[Помещения] ADD  CONSTRAINT [DF_Помещения_Этаж]  DEFAULT ((1)) FOR [Этаж]
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
