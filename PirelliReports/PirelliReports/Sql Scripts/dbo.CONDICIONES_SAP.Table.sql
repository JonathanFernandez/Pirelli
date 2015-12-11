USE [Comercial]
GO
/****** Object:  Table [dbo].[CONDICIONES_SAP]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONDICIONES_SAP](
	[NRO_CONDICION] [char](7) NULL,
	[CONDICION] [char](4) NULL,
	[VALOR_COND] [float] NULL,
	[MONEDA] [char](5) NULL,
	[VALOR_$] [float] NULL,
	[IP] [char](10) NULL,
	[CLIENTE] [char](10) NULL,
	[NOTA] [char](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
