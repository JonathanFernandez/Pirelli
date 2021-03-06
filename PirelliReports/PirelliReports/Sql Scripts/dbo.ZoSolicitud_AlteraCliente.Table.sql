USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_AlteraCliente]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ZoSolicitud_AlteraCliente](
	[CodSolicitud] [int] NOT NULL,
	[CodClie] [char](10) NOT NULL,
	[Nota] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ZoSolicitud_AlteraCliente] PRIMARY KEY CLUSTERED 
(
	[CodSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
