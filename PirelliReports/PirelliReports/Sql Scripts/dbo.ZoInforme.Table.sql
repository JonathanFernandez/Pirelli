USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoInforme]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoInforme](
	[CodInforme] [char](2) NOT NULL,
	[Descripcion] [char](40) NULL,
	[Descripcion_TRUCK] [char](40) NULL,
 CONSTRAINT [PK_ZoInforme] PRIMARY KEY CLUSTERED 
(
	[CodInforme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
