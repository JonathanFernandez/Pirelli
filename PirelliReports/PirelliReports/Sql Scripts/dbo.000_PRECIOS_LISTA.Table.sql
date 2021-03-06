USE [Comercial]
GO
/****** Object:  Table [dbo].[000_PRECIOS_LISTA]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[000_PRECIOS_LISTA](
	[CODIGO] [nvarchar](50) NULL,
	[Fecha] [smalldatetime] NULL,
	[Familia] [nvarchar](10) NULL,
	[MKS] [nvarchar](10) NULL,
	[Medida] [nvarchar](70) NULL,
	[IV] [nvarchar](10) NULL,
	[Dibujo] [nvarchar](50) NULL,
	[Marca] [nvarchar](50) NULL,
	[PRECIO_LISTA] [float] NULL,
	[zona_1] [float] NULL,
	[zona_2] [float] NULL,
	[zona_3] [float] NULL,
	[zona_4] [float] NULL,
	[zona_5] [float] NULL,
	[zona_6] [float] NULL,
	[zona_7] [float] NULL,
	[zona_8] [float] NULL
) ON [PRIMARY]

GO
