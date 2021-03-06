USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSolicitud](
	[CodSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[CodAgrup] [bigint] NOT NULL CONSTRAINT [DF_ZoSolicitud_CodAgrup]  DEFAULT ((0)),
	[IP] [char](7) NOT NULL,
	[Pais] [char](2) NOT NULL,
	[CodClie] [char](10) NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[NroFactura] [varchar](13) NOT NULL,
	[NroTicket] [int] NOT NULL,
	[NroCom] [char](10) NULL,
	[NroTarjeta] [int] NULL,
	[NroAuto] [int] NULL,
	[NombreUsu] [varchar](30) NOT NULL,
	[DirUsu] [varchar](30) NULL,
	[Nro] [varchar](10) NULL,
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
	[CodPromo] [int] NOT NULL CONSTRAINT [DF_ZoSolicitud_CodPromo]  DEFAULT ('1'),
	[Descuento] [float] NULL,
	[CodAux] [char](3) NULL,
	[FecAlta] [datetime] NOT NULL CONSTRAINT [DF_ZoSolicitud_FecAlta]  DEFAULT (getdate()),
	[UsuAlta] [varchar](10) NOT NULL,
	[FecUltAct] [datetime] NULL,
	[UsuUltAct] [varchar](10) NULL,
	[FecSubSAP] [datetime] NULL,
	[Nota] [nvarchar](200) NULL,
	[Esker_Link] [nvarchar](250) NULL,
	[Esker_ID] [nvarchar](25) NULL,
 CONSTRAINT [PK_ZoSolicitud] PRIMARY KEY CLUSTERED 
(
	[CodSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
