USE [АфанасьевИС]
GO
/****** Object:  Table [dbo].[Обращения]    Script Date: 24.11.2021 11:05:19 ******/
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
	[Дата принятия] [datetime] NULL,
	[Время ремонта] [datetime] NULL,
	[Скидка] [money] NOT NULL,
	[Запчасти] [int] NULL,
	[Категория] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Стоимость]  DEFAULT ((0)) FOR [Стоимость]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Дата принятия]  DEFAULT (getdate()) FOR [Дата принятия]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Заказы_Скидка]  DEFAULT ((3)) FOR [Скидка]
GO
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Категория]  DEFAULT ('гарантийный') FOR [Категория]
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
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы] CHECK  (([Скидка]>(0) AND [Скидка]<(100)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы]
GO
ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы_Стоимость] CHECK  (([Стоимость]>(0) AND [Стоимость]<(100000)))
GO
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [CK_Заказы_Стоимость]
GO
