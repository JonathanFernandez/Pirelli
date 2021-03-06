USE [Comercial]
GO
/****** Object:  Table [dbo].[DWPROD]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DWPROD](
	[ProdCod] [char](5) NOT NULL,
	[ProdDsc] [char](33) NULL,
	[ProdBndRod] [char](6) NULL,
	[BUCod] [char](2) NULL,
	[GrpComCod] [char](2) NULL,
	[FamCod] [char](2) NULL,
	[McaCod] [char](2) NULL,
	[MktSegCod] [char](3) NULL,
	[MedCod] [char](16) NULL,
	[IndCrgCod] [char](7) NULL,
	[IndVelCod] [char](2) NULL,
	[RWCod] [char](2) NULL,
	[CorCod] [char](5) NULL,
	[SerCod] [char](3) NULL,
	[CalCod] [char](4) NULL,
	[CatLogCod] [char](3) NULL,
	[LnhMcaCod] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
