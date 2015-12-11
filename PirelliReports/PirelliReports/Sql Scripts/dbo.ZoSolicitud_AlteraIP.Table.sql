USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_AlteraIP]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSolicitud_AlteraIP](
	[CodSolicitud] [int] NOT NULL,
	[IP] [char](7) NOT NULL,
	[Nota] [nvarchar](max) NULL,
	[Pais] [char](2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
