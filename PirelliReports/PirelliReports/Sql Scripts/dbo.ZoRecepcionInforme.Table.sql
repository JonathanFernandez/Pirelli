USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoRecepcionInforme]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoRecepcionInforme](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[codCTC] [char](2) NOT NULL,
	[codInforme] [char](2) NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[Nota] [char](400) NOT NULL,
	[FechaAlta] [smalldatetime] NULL,
	[Usualta] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
