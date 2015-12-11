USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoLogSap]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoLogSap](
	[CodClie] [char](10) NOT NULL,
	[IP] [char](7) NULL,
	[txtMensaje] [varchar](200) NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
