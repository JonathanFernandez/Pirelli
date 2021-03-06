USE [Comercial]
GO
/****** Object:  Table [dbo].[MAESTRO_PDV_COMERCIAL]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAESTRO_PDV_COMERCIAL](
	[N°] [float] NULL,
	[Código Cliente (Maestro)] [char](10) NULL,
	[Cod Sucursal (Emision de factura)] [char](10) NULL,
	[Cod (Destino de la factura)] [char](10) NULL,
	[CTC CAR] [nvarchar](255) NULL,
	[CTC TRUCK] [nvarchar](255) NULL,
	[Nombre de Fantasía] [nvarchar](255) NULL,
	[Razón Social] [nvarchar](255) NULL,
	[Dirección] [nvarchar](255) NULL,
	[Centro Emisor] [float] NULL,
	[Barrio] [nvarchar](255) NULL,
	[Ciudad] [nvarchar](255) NULL,
	[Provincia] [nvarchar](255) NULL,
	[Telefono Sucursal] [nvarchar](255) NULL,
	[Telefono factura] [nvarchar](255) NULL,
	[E-mail] [nvarchar](255) NULL,
	[Página Web] [nvarchar](255) NULL,
	[CUIT] [nvarchar](11) NULL,
	[Número de terminal Pos] [float] NULL,
	[Aclaracion] [nvarchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
