USE [Comercial]
GO
/****** Object:  Table [dbo].[RFC_CREDITOS]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RFC_CREDITOS](
	[NOTA_COD] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[NOTACODCLIE] [nvarchar](50) NULL,
	[NOTACAMPO] [nvarchar](20) NULL,
	[NOTACRITERIO] [nvarchar](20) NULL,
	[NOTA_1] [float] NULL,
	[NOTA_2] [float] NULL,
	[NOTA_3] [float] NULL,
	[NOTAMODIF] [char](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
