USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoPermiXUsuarios]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoPermiXUsuarios](
	[ZOUsuario] [varchar](10) NOT NULL,
	[ZoDescripcion] [nvarchar](20) NULL,
	[ZoLegajo] [int] NULL,
	[ZoCargaDatos] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoCargaDatos]  DEFAULT ('0'),
	[ZoReportes] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoReportes]  DEFAULT ('0'),
	[ZoNotaPedido] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoNotaPedido]  DEFAULT ('0'),
	[ZoParametros] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoParametros]  DEFAULT ('0'),
	[ZoCTC] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoCTC]  DEFAULT ('0'),
	[ZoAltaCTC] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoAltaCTC]  DEFAULT ('0'),
	[ZoPromoVisa] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoPromoVisa]  DEFAULT ('0'),
	[ZoInforme] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoInforme]  DEFAULT ('0'),
	[ZoMedidas] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoMedidas]  DEFAULT ('0'),
	[ZoClientes] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoClientes]  DEFAULT ('0'),
	[ZoPromociones] [tinyint] NULL CONSTRAINT [DF_ZoPermiXUsuarios_ZoPromociones]  DEFAULT ('0'),
	[ZoAlteraIPClie] [tinyint] NULL CONSTRAINT [DF__ZoPermiXU__ZoAlt__20E2A80C]  DEFAULT (0),
	[Skin] [nvarchar](20) NULL CONSTRAINT [DF_ZoPermiXUsuarios_Skin]  DEFAULT (N'LinuxGnome.skn'),
 CONSTRAINT [PK_ZoPermiXUsuarios] PRIMARY KEY CLUSTERED 
(
	[ZOUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
