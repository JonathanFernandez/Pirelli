USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoInfAumentoConfirmacion]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoInfAumentoConfirmacion](
	[Marca] [char](2) NULL,
	[Tipo] [char](15) NULL,
	[Anunciado] [smallint] NULL,
	[Efectivo] [smallint] NULL,
	[Fecha] [datetime] NULL,
	[CTC] [char](2) NULL,
	[Usuario] [char](15) NULL,
	[FecAlta] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
