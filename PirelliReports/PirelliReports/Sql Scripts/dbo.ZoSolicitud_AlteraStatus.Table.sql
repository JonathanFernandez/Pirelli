USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_AlteraStatus]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ZoSolicitud_AlteraStatus](
	[CodSolicitud] [int] NOT NULL,
	[FlgProcesado] [char](1) NOT NULL,
	[Nota] [nvarchar](200) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
