USE [Comercial]
GO
/****** Object:  Table [dbo].[Zoclien1]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zoclien1](
	[Cod] [char](10) NOT NULL,
	[CodCliMatriz] [char](10) NULL,
	[CodCliRefill] [char](10) NULL,
	[CUIT] [varchar](13) NOT NULL,
	[CentroEmisor] [char](4) NULL,
	[Tipo] [varchar](2) NULL CONSTRAINT [DF_Zoclien1_Tipo]  DEFAULT (80),
	[RazSoc] [varchar](45) NULL,
	[NomFant] [varchar](45) NULL,
	[DirSuc] [varchar](40) NULL,
	[DirFact] [varchar](40) NULL,
	[Barrio] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[CodProv] [char](2) NULL,
	[Pais] [varchar](2) NULL,
	[CodRegion] [char](2) NOT NULL CONSTRAINT [DF_Zoclien1_CodRegion]  DEFAULT (0),
	[TelefonoSuc] [nvarchar](60) NULL,
	[TelefonoFact] [nvarchar](50) NULL,
	[TerminalPOS] [nvarchar](50) NULL,
	[EMail] [varchar](50) NULL,
	[PaginaWEB] [varchar](100) NULL,
	[CTC_CAR] [char](2) NULL,
	[CTC_TRUCK] [char](2) NULL,
	[NOTA] [varchar](56) NULL CONSTRAINT [DF_Zoclien1_Col009]  DEFAULT ('DETALLES VARIOS DE CLIENTE'),
	[FechaAlta] [datetime] NULL CONSTRAINT [DF_Zoclien1_FechaAlta]  DEFAULT (getdate()),
	[FechaUpd] [datetime] NULL CONSTRAINT [DF_Zoclien1_FechaUpd]  DEFAULT (getdate()),
	[FlgBajaLogica] [char](1) NOT NULL CONSTRAINT [DF_Zoclien1_FlgBajaLogica]  DEFAULT (0),
	[FlgFilBusq] [char](1) NOT NULL CONSTRAINT [DF_Zoclien1_FlgFilBusq]  DEFAULT ('1'),
	[Latitud] [float] NULL,
	[Longitud] [float] NULL,
 CONSTRAINT [PK_Zoclien1] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
