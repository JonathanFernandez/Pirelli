USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoSucursalesAux]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoSucursalesAux](
	[CodCliente] [char](10) NOT NULL,
	[CodSucursal] [char](10) NOT NULL,
 CONSTRAINT [PK_ZoSucursalesAux] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC,
	[CodSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
