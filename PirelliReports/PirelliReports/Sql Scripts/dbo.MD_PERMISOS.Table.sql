USE [Comercial]
GO
/****** Object:  Table [dbo].[MD_PERMISOS]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MD_PERMISOS](
	[PERMISO_ID] [int] NOT NULL,
	[PERMISO_DESC] [nvarchar](50) NULL,
 CONSTRAINT [PK_MD_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[PERMISO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
