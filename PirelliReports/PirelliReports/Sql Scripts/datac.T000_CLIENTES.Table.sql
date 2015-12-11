USE [Comercial]
GO
/****** Object:  Table [datac].[T000_CLIENTES]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datac].[T000_CLIENTES](
	[CODI] [nvarchar](12) NULL,
	[NOMB] [nvarchar](45) NULL,
	[MONE] [nvarchar](3) NULL,
	[CANA] [int] NULL,
	[ORGV] [nvarchar](4) NULL,
	[VENDE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
