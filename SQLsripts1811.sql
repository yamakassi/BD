
CREATE DATABASE [АфанасьевИС]
 

CREATE TABLE [dbo].[Деталь](
	[id_детали] [int] NOT NULL,
	[id_обращения] [int] NOT NULL,
	[дата_поставки] [varchar](50) NULL,
	[место_хранения] [int] NOT NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[Запчасти](
	[ID_запчасти] [int] IDENTITY(1,1) NOT NULL,
	[id_места] [int] NOT NULL,
	[Номер поставки] [int] NOT NULL,
	[Название запчасти] [varchar](50) NOT NULL,
	[Применяемость в ремонте] [varchar](50) NULL,
	[Стоимость] [money] NULL,
 CONSTRAINT [PK_Запчасти] PRIMARY KEY CLUSTERED 
(
	[ID_запчасти] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Клиенты](
	[Клиент_ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NULL,
	[Пол] [char](10) NOT NULL,
	[Дата] [date] NOT NULL,
	[Адрес] [varchar](50) NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[Клиент_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Места храненияя](
	[id_места] [int] NOT NULL,
	[id_помещения] [int] IDENTITY(1,1) NOT NULL,
	[Тип хранимой техники] [varchar](50) NULL,
 CONSTRAINT [PK_Места храненияя] PRIMARY KEY CLUSTERED 
(
	[id_места] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Обращения](
	[ID_заказа] [int] IDENTITY(1,1) NOT NULL,
	[ID_клиента] [int] NULL,
	[ID_cотрудника] [int] NULL,
	[Номер_техники] [int] NULL,
	[Стоимость] [money] NULL,
	[Дата принятия] [date] NULL,
	[Время ремонта] [date] NULL,
	[Скидка] [money] NOT NULL,
	[Запчасти] [int] NULL,
	[Категория] [varchar](30) NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[Поставки](
	[Номер поставки] [int] NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Откуда поставляется] [varchar](50) NULL,
	[Стоимость поставки] [int] NOT NULL,
	[Ед.товара] [int] NOT NULL,
 CONSTRAINT [PK_Поставки] PRIMARY KEY CLUSTERED 
(
	[Номер поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Поставщики](
	[ID_поставщика] [int] IDENTITY(1,1) NOT NULL,
	[Юр.адрес] [varchar](50) NULL,
	[Реквизиты] [varchar](50) NULL,
	[Откуда поставляет] [varchar](50) NULL,
	[Что поставляет] [varchar](50) NULL,
	[Телефон] [varchar](10) NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Сотрудники](
	[ID_сотрудника] [int] NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NULL,
	[Телефон] [varchar](10) NOT NULL,
	[Умения работать со спец оборуд] [char](10) NULL,
	[Дата рождения] [date] NOT NULL,
	[Уровень образование] [varchar](50) NOT NULL,
	[ЗП] [money] NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Техника](
	[Серийный номер] [int] IDENTITY(201200,1) NOT NULL,
	[ID_клиент] [int] NOT NULL,
	[ID_заказа] [int] NOT NULL,
	[Тип техники] [varchar](30) NULL,
	[Модель] [varchar](30) NOT NULL,
	[Тип поломки] [varchar](max) NOT NULL,
	[Гарантия] [char](10) NOT NULL,
	[Год выпуска] [int] NULL,
	[Страна производства] [varchar](30) NULL,
	[Стоимость ремонта] [money] NULL,
 CONSTRAINT [PK_Техника] PRIMARY KEY CLUSTERED 
(
	[Серийный номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Пол]  DEFAULT ('М') FOR [Пол]
ALTER TABLE [dbo].[Клиенты] ADD  CONSTRAINT [DF_Клиенты_Дата]  DEFAULT (getdate()) FOR [Дата]
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Стоимость]  DEFAULT ((0)) FOR [Стоимость]
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Дата принятия]  DEFAULT (getdate()) FOR [Дата принятия]
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Заказы_Скидка]  DEFAULT ((3)) FOR [Скидка]
ALTER TABLE [dbo].[Обращения] ADD  CONSTRAINT [DF_Обращения_Категория]  DEFAULT ('гарантийный') FOR [Категория]
ALTER TABLE [dbo].[Помещения] ADD  CONSTRAINT [DF_Помещения_Этаж]  DEFAULT ((1)) FOR [Этаж]
ALTER TABLE [dbo].[Поставки] ADD  CONSTRAINT [DF_Поставки_Ед.товара]  DEFAULT ((1)) FOR [Ед.товара]
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_Умения работать со спец оборуд]  DEFAULT ('нет') FOR [Умения работать со спец оборуд]
ALTER TABLE [dbo].[Сотрудники] ADD  CONSTRAINT [DF_Сотрудники_ЗП]  DEFAULT ((35000)) FOR [ЗП]
ALTER TABLE [dbo].[Деталь]  WITH CHECK ADD  CONSTRAINT [FK_Деталь1_Запчасти] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Запчасти] ([ID_запчасти])
ALTER TABLE [dbo].[Деталь] CHECK CONSTRAINT [FK_Деталь_Запчасти]
ALTER TABLE [dbo].[Деталь]  WITH CHECK ADD  CONSTRAINT [FK_Деталь_Места храненияя] FOREIGN KEY([место_хранения])
REFERENCES [dbo].[Места храненияя] ([id_места])
ALTER TABLE [dbo].[Деталь] CHECK CONSTRAINT [FK_Деталь_Места храненияя]
ALTER TABLE [dbo].[Деталь]  WITH CHECK ADD  CONSTRAINT [FK_Деталь1_Обращения] FOREIGN KEY([id_детали])
REFERENCES [dbo].[Обращения] ([ID_заказа])

ALTER TABLE [dbo].[Деталь] CHECK CONSTRAINT [FK_Деталь_Обращения]

ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [FK_Запчасти_Номер_поставки] FOREIGN KEY([Номер поставки])
REFERENCES [dbo].[Поставки] ([Номер поставки])
ON UPDATE CASCADE
ALTER TABLE [dbo].[Запчасти] CHECK CONSTRAINT [FK_Запчасти_Номер_поставки]

ALTER TABLE [dbo].[Места храненияя]  WITH CHECK ADD  CONSTRAINT [FK_Места храненияя_Помещения] FOREIGN KEY([id_помещения])
REFERENCES [dbo].[Помещения] ([ID_помещения])

ALTER TABLE [dbo].[Места храненияя] CHECK CONSTRAINT [FK_Места храненияя_Помещения]

ALTER TABLE [dbo].[Обращения]  WITH NOCHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([ID_клиента])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])

ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Клиенты]

ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([ID_cотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_сотрудника])
ON UPDATE CASCADE
ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Сотрудники]

ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Техника] FOREIGN KEY([Номер_техники])
REFERENCES [dbo].[Техника] ([Серийный номер])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Обращения] CHECK CONSTRAINT [FK_Заказы_Техника]

ALTER TABLE [dbo].[Поставки]  WITH CHECK ADD  CONSTRAINT [FK_Поставки_Поставки] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщики] ([ID_поставщика])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Поставки] CHECK CONSTRAINT [FK_Поставки_Поставки]

ALTER TABLE [dbo].[Техника]  WITH CHECK ADD  CONSTRAINT [FK_Техника_Клиент] FOREIGN KEY([ID_клиент])
REFERENCES [dbo].[Клиенты] ([Клиент_ID])
ON UPDATE CASCADE

ALTER TABLE [dbo].[Техника] CHECK CONSTRAINT [FK_Техника_Клиент]

ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти] CHECK  (([Название запчасти] like '[A-Za-zА-Яа-я]%'))


ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти_1] CHECK  (([Применяемость в ремонте] like '[A-Za-zА-Яа-я.,/]%'))

ALTER TABLE [dbo].[Запчасти]  WITH CHECK ADD  CONSTRAINT [CK_Запчасти_Стоимость] CHECK  (([Стоимость]>(0)))

ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Адрес] CHECK  ((NOT [Адрес] like '%[^A-Za-zА-Яа-я]%'))

ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))

ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Пол] CHECK  (([Пол] like '[МЖ]'))

ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [CK_Клиенты_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))

ALTER TABLE [dbo].[Места храненияя]  WITH CHECK ADD  CONSTRAINT [CK_Места храненияя] CHECK  ((NOT [Тип хранимой техники] like '%[^A-Za-zА-Яа-я0-9]%'))

ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы] CHECK  (([Скидка]>(0) AND [Скидка]<(100)))

ALTER TABLE [dbo].[Обращения]  WITH CHECK ADD  CONSTRAINT [CK_Заказы_Стоимость] CHECK  (([Стоимость]>(0) AND [Стоимость]<(100000)))

ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_Вместимость] CHECK  (([Вместимость]>(0)))

ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_Площадь] CHECK  (([Площадь]>(0)))

ALTER TABLE [dbo].[Помещения]  WITH CHECK ADD  CONSTRAINT [CK_Помещения_этаж] CHECK  (([Этаж]>=(0)))


ALTER TABLE [dbo].[Поставки]  WITH NOCHECK ADD  CONSTRAINT [CK_Поставки] CHECK  (([Стоимость поставки]>(0)))

ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики] CHECK  ((NOT [Телефон] like '%[^0-9]%'))

ALTER TABLE [dbo].[Поставщики]  WITH CHECK ADD  CONSTRAINT [CK_Поставщики_Юр_адрес] CHECK  ((NOT [Юр.адрес] like '%[^A-Za-zА-Яа-я1-9]%'))

ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники] CHECK  ((NOT [Уровень образование] like '%[^A-Za-zА-Яа-я]%'))

ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_1] CHECK  (([ЗП]>(0)))

ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_2] CHECK  ((NOT [Телефон] like '%[^0-9]%'))

ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудники_Имя] CHECK  ((NOT [Имя] like '%[^A-Za-zА-Яа-я]%'))

ALTER TABLE [dbo].[Сотрудники]  WITH NOCHECK ADD  CONSTRAINT [CK_Сотрудники_Фамилия] CHECK  ((NOT [Фамилия] like '%[^A-Za-zА-Яа-я]%'))


