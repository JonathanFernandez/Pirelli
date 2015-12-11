USE [Comercial]
GO
/****** Object:  Table [dbo].[ZZZ_PRECIOS_ant_politica_DELETE_20140813]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZZZ_PRECIOS_ant_politica_DELETE_20140813](
	[CODCLIENTE] [char](10) NULL,
	[DESCCLIENTE] [char](35) NULL,
	[CONDICION] [char](4) NULL,
	[DESCCONDICION] [char](25) NULL,
	[ORDEN] [char](11) NULL,
	[MATNR] [char](18) NULL,
	[SPART] [char](2) NULL,
	[BONUS] [char](2) NULL,
	[ZZFAM] [char](2) NULL,
	[ZZLIN] [char](2) NULL,
	[ZZBAT] [char](6) NULL,
	[VALOR_COND] [float] NULL,
	[VALOR_CALC] [float] NULL,
	[ZZGRU] [char](2) NULL,
	[ZZMAR] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
