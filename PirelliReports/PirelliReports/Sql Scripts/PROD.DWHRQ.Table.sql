USE [Comercial]
GO
/****** Object:  Table [PROD].[DWHRQ]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PROD].[DWHRQ](
	[UndOpCod] [char](4) NOT NULL,
	[OrgVndCod] [char](4) NOT NULL,
	[CanCod] [char](2) NOT NULL,
	[HrqCod] [char](10) NOT NULL,
	[HrqDsc] [char](35) NULL,
	[RspVndCod] [char](6) NULL,
	[SubTipCod] [char](3) NULL,
	[TipCod] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
