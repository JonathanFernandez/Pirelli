USE [Comercial]
GO
/****** Object:  Table [dbo].[Zoprodu1_TEMP]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zoprodu1_TEMP](
	[IP] [char](7) NOT NULL,
	[Descrip] [char](30) NULL,
	[pais] [char](51) NOT NULL,
	[Otro] [char](20) NULL,
	[Familia] [char](50) NULL,
	[Marca] [char](2) NULL,
	[Rango] [char](1) NULL,
	[FlgBajaLogica] [char](1) NULL,
	[FlgFilBusq] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
