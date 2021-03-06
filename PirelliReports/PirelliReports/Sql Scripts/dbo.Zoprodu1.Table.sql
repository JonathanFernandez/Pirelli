USE [Comercial]
GO
/****** Object:  Table [dbo].[Zoprodu1]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zoprodu1](
	[IP] [char](7) NOT NULL,
	[Descrip] [varchar](50) NULL,
	[pais] [char](2) NOT NULL,
	[Otro] [char](20) NULL,
	[Familia] [nvarchar](2) NULL,
	[Marca] [char](2) NULL,
	[Rango] [char](1) NOT NULL CONSTRAINT [DF_Zoprodu1_Rango]  DEFAULT ((0)),
	[Rodado] [float] NOT NULL CONSTRAINT [DF_Zoprodu1_Rodado]  DEFAULT ((0)),
	[FlgBajaLogica] [char](1) NOT NULL CONSTRAINT [DF_Zoprodu1_FlgBajaLogica]  DEFAULT (0),
	[FlgFilBusq] [char](1) NOT NULL CONSTRAINT [DF_Zoprodu1_FlgFilBusq]  DEFAULT ('1'),
 CONSTRAINT [PK_Zoprodu1_1] PRIMARY KEY CLUSTERED 
(
	[IP] ASC,
	[pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
