USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoTipoPromo]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoTipoPromo](
	[CodTipoPromo] [int] IDENTITY(1,1) NOT NULL,
	[DescTipoPromo] [nvarchar](30) NOT NULL,
	[FecDesde] [datetime] NULL,
	[FecHasta] [datetime] NULL,
	[Descu1] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu1]  DEFAULT (0),
	[Descu2] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu2]  DEFAULT (0),
	[Descu3] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu3]  DEFAULT (0),
	[Descu4] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu4]  DEFAULT (0),
	[Descu5] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu5]  DEFAULT (0),
	[Descu6] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu6]  DEFAULT (0),
	[Descu7] [float] NULL CONSTRAINT [DF_ZoTipoPromo_Descu7]  DEFAULT (0),
	[Cuota1] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota1]  DEFAULT (0),
	[Cuota2] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota2]  DEFAULT (0),
	[Cuota3] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota3]  DEFAULT (0),
	[Cuota4] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota4]  DEFAULT (0),
	[Cuota5] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota5]  DEFAULT (0),
	[Cuota6] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota6]  DEFAULT (0),
	[Cuota7] [int] NULL CONSTRAINT [DF_ZoTipoPromo_Cuota7]  DEFAULT (0),
	[FlgBajaLogica] [char](1) NULL CONSTRAINT [DF_ZoTipoPromo_FlgBajaLogica]  DEFAULT (0),
 CONSTRAINT [PK_ZoTipoPromo] PRIMARY KEY CLUSTERED 
(
	[CodTipoPromo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
