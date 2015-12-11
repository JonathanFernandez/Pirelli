USE [Comercial]
GO
/****** Object:  Table [datac].[sysuser]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datac].[sysuser](
	[USERNAME] [nvarchar](50) NOT NULL,
	[USERDATE] [nvarchar](20) NULL,
	[USERPC] [nvarchar](50) NULL,
	[USERWIN] [nvarchar](50) NULL,
	[USERPWRD] [nvarchar](15) NULL,
	[USERDESC] [nvarchar](50) NULL,
	[USERADMIN] [bit] NULL,
	[USERVEND] [nvarchar](250) NULL
) ON [PRIMARY]

GO
