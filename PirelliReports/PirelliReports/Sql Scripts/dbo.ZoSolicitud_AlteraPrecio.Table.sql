USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSolicitud_AlteraPrecio]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSolicitud_AlteraPrecio](
	[CodSolicitud] [int] NOT NULL,
	[IP] [char](7) NOT NULL,
	[Precio] [float] NOT NULL,
	[PrecioNuevo] [float] NOT NULL,
	[Nota] [nvarchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
