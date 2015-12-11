USE [Comercial]
GO
/****** Object:  Table [dbo].[RestoreAgrup]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RestoreAgrup](
	[CodAgrup] [int] NOT NULL,
	[CodClie] [nchar](10) NULL,
	[IP] [nchar](7) NULL,
	[Cantidad] [smallint] NULL,
	[Descuento] [float] NULL,
	[CodPromo] [char](3) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
