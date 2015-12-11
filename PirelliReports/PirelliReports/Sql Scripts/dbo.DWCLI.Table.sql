USE [Comercial]
GO
/****** Object:  Table [dbo].[DWCLI]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DWCLI](
	[UndOpCod] [char](4) NOT NULL,
	[CliCod] [char](10) NOT NULL,
	[CliDsc] [char](35) NULL,
	[RegCod] [char](6) NULL,
	[EstCod] [char](3) NULL,
	[PaisCod] [char](3) NULL,
	[CidCod] [char](3) NULL,
	[Cidade] [char](35) NULL,
	[CCCod] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
