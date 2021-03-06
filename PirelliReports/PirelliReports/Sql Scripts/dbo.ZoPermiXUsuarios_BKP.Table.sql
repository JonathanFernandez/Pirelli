USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoPermiXUsuarios_BKP]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoPermiXUsuarios_BKP](
	[ZOUsuario] [varchar](20) NOT NULL,
	[ZoDescripcion] [nvarchar](20) NULL,
	[ZoLegajo] [int] NULL,
	[ZoCargaDatos] [char](1) NULL,
	[ZoReportes] [char](1) NULL,
	[ZoNotaPedido] [char](1) NULL,
	[ZoParametros] [char](1) NULL,
	[ZoCTC] [char](1) NULL,
	[ZoAltaCTC] [char](1) NULL,
	[ZoPromoVisa] [char](1) NULL,
	[ZoInforme] [char](1) NULL,
	[ZoMedidas] [char](1) NULL,
	[ZoClientes] [char](1) NULL,
	[ZoPromociones] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
