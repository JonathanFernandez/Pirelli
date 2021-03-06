USE [Comercial]
GO
/****** Object:  Table [PROD].[RFC]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PROD].[RFC](
	[RFCCODCLIE] [nvarchar](20) NULL,
	[RFCCLIE] [nvarchar](50) NULL,
	[RFCCOND] [nvarchar](10) NULL,
	[RFCDESCCOND] [nvarchar](50) NULL,
	[RFCIPORDEN] [nvarchar](50) NULL,
	[RFCIP] [nvarchar](20) NULL,
	[RFCSPART] [nvarchar](3) NULL,
	[RFCBONUS] [nvarchar](3) NULL,
	[RFCFAMILIA] [nvarchar](3) NULL,
	[RFCLINEA] [nvarchar](3) NULL,
	[RFCDIBUJO] [nvarchar](20) NULL,
	[RFCVALC] [float] NULL,
	[RFCVALO] [float] NULL,
	[RFCGRUP] [nvarchar](3) NULL,
	[RFCMARC] [nvarchar](3) NULL
) ON [PRIMARY]

GO
