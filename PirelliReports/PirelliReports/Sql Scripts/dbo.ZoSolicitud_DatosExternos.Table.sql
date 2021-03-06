USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_DatosExternos]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSolicitud_DatosExternos](
	[CodSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[CodAgrup] [bigint] NOT NULL CONSTRAINT [DF_ZoSolicitud_ESKER_CodAgrup]  DEFAULT (0),
	[IP] [char](7) NOT NULL,
	[Pais] [char](2) NOT NULL,
	[CodClie] [char](10) NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[NroFactura] [varchar](13) NOT NULL,
	[NroTicket] [float] NOT NULL,
	[NroCom] [char](10) NULL,
	[NroTarjeta] [int] NULL,
	[NroAuto] [int] NULL,
	[NombreUsu] [varchar](30) NOT NULL,
	[DirUsu] [varchar](30) NULL,
	[Nro] [int] NULL,
	[Dpto] [char](2) NULL,
	[Piso] [char](2) NULL,
	[Ciudad] [varchar](50) NULL,
	[CodProv] [char](2) NOT NULL,
	[Vehiculo] [varchar](30) NULL,
	[Cuotas] [smallint] NOT NULL,
	[Telefono] [char](17) NULL,
	[CodPos] [varchar](10) NULL,
	[Precio] [float] NOT NULL,
	[FlgProcesado] [char](1) NULL,
	[CodPromo] [int] NOT NULL CONSTRAINT [DF_ZoSolicitud_ESKER_CodPromo]  DEFAULT ('1'),
	[Descuento] [float] NULL,
	[CodAux] [char](3) NULL,
	[FecAlta] [datetime] NOT NULL CONSTRAINT [DF_ZoSolicitud_ESKER_FecAlta]  DEFAULT (getdate()),
	[UsuAlta] [varchar](10) NOT NULL,
	[FecUltAct] [datetime] NULL,
	[UsuUltAct] [varchar](10) NULL,
	[FecSubSAP] [datetime] NULL,
	[Nota] [nvarchar](200) NULL,
	[Esker_Link] [nvarchar](250) NULL,
	[Esker_ID] [nvarchar](25) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
