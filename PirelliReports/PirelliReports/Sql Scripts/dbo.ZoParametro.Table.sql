USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoParametro]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoParametro](
	[CodSolicitud] [int] NOT NULL,
	[FlgValidaVisa] [char](1) NOT NULL CONSTRAINT [DF_ZoParametro_FlgValidaVisa]  DEFAULT ('1'),
	[CodAgrupID] [bigint] NOT NULL CONSTRAINT [DF_ZoParametro_CodAgrupID]  DEFAULT (0),
	[FlgUsaFiltro] [char](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
