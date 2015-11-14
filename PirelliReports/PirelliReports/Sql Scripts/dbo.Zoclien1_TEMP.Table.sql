USE [Comercial]
GO

/****** Object:  Table [dbo].[Zoclien1_TEMP]    Script Date: 11/13/2015 11:44:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Zoclien1_TEMP](
	[Cod] [char](10) NOT NULL,
	[Cuit] [char](11) NULL,
	[Tipo] [char](2) NULL,
	[Desc] [char](45) NULL,
	[Dir] [char](40) NULL,
	[Prov] [char](40) NULL,
	[Col008] [char](2) NULL,
	[Col009] [char](56) NULL,
	[region] [char](20) NULL,
	[FlgBajaLogica] [char](1) NULL,
	[FlgFilBusq] [char](1) NULL,
	[Latitud] [float] NULL,
	[Longitud] [float] NULL,
 CONSTRAINT [PK_Zoclien1_TEMP] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Zoclien1_TEMP] ADD  CONSTRAINT [DF_Zoclien1_TEMP_FlgBajaLogica]  DEFAULT (0) FOR [FlgBajaLogica]
GO


