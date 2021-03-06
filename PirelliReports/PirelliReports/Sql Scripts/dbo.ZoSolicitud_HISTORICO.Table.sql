USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_HISTORICO]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSolicitud_HISTORICO](
	[CodSolicitud] [int] NOT NULL,
	[CodAgrup] [bigint] NOT NULL,
	[IP] [char](7) NOT NULL,
	[Pais] [char](51) NULL,
	[CodClie] [char](10) NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[NroFactura] [char](13) NOT NULL,
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
	[Vehiculo] [varchar](30) NOT NULL,
	[Cuotas] [smallint] NOT NULL,
	[Telefono] [char](17) NULL,
	[CodPos] [varchar](10) NULL,
	[Precio] [float] NOT NULL,
	[FlgProcesado] [char](1) NULL,
	[CodPromo] [char](3) NOT NULL,
	[Descuento] [float] NULL,
	[CodAux] [char](3) NULL,
	[FecAlta] [datetime] NOT NULL,
	[UsuAlta] [char](10) NOT NULL,
	[FecUltAct] [datetime] NULL,
	[UsuUltAct] [char](10) NULL,
	[FecSubSAP] [datetime] NULL,
	[Nota] [nvarchar](200) NULL,
 CONSTRAINT [PK_ZoSolicitud_HIST] PRIMARY KEY CLUSTERED 
(
	[CodSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
