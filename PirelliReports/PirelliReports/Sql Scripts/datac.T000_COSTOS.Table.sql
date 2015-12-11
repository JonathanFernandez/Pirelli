USE [Comercial]
GO
/****** Object:  Table [datac].[T000_COSTOS]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datac].[T000_COSTOS](
	[COSTOIP] [nvarchar](255) NULL,
	[COSTOCODN] [nvarchar](255) NULL,
	[COSTODESC] [nvarchar](255) NULL,
	[COSTOLOTE] [nvarchar](255) NULL,
	[COSTOMES] [float] NULL,
	[COSTOMP] [float] NULL,
	[COSTOMO] [float] NULL,
	[COSTOGV] [float] NULL,
	[COSTOGM] [float] NULL,
	[COSTOPESO] [float] NULL,
	[COSTOTOTAL] [float] NULL
) ON [PRIMARY]

GO
