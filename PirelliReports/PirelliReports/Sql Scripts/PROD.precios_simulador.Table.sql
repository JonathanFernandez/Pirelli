USE [Comercial]
GO
/****** Object:  Table [PROD].[precios_simulador]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PROD].[precios_simulador](
	[cliente] [nvarchar](10) NULL,
	[ip] [nvarchar](10) NULL,
	[precio_ok_SNC] [float] NULL,
	[precio_lista] [float] NULL,
	[precio_ok] [float] NULL
) ON [PRIMARY]

GO
