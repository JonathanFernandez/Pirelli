USE Comercial
GO

/****** Object:  Table [dbo].[MD_USUARIOS]    Script Date: 30/09/2015 15:51:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_USUARIOS](
	[USU_ID] [nvarchar](50) NOT NULL,
	[USU_DESC] [nvarchar](50) NULL,
	[MAIL] [nvarchar](50) NULL,
	[PASS] [nvarchar](20) NULL
 CONSTRAINT [PK_MD_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[USU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE Comercial
GO

/****** Object:  Table [dbo].[GRUPOS_USUARIOS]    Script Date: 30/09/2015 15:53:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GRUPOS_USUARIOS](
	[GRUPO_ID]int,
	[USU_ID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GRUPOS_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[GRUPO_ID] ASC,
	[USU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE Comercial
GO

/****** Object:  Table [dbo].[MD_GRUPOS]    Script Date: 30/09/2015 15:54:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_GRUPOS](
	[GRUPO_ID] int not null identity,
	[GRUPO_DESC] [nvarchar](50) NULL
	
 CONSTRAINT [PK_MD_GRUPOS] PRIMARY KEY CLUSTERED 
(
	[GRUPO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE Comercial
GO

/****** Object:  Table [dbo].[GRUPOS_PERMISOS]    Script Date: 30/09/2015 15:54:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GRUPOS_PERMISOS](
	[GRUPO_ID] int not null ,
	[PERMISO_ID] int not null,

	[VALOR] [bit] NOT NULL,
 CONSTRAINT [PK_GRUPOS_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[GRUPO_ID] ASC,
	[PERMISO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE Comercial
GO

/****** Object:  Table [dbo].[MD_PERMISOS]    Script Date: 30/09/2015 15:56:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_PERMISOS](
	[PERMISO_ID] int NOT NULL identity,
	[PERMISO_DESC] [nvarchar](50) NULL,
 CONSTRAINT [PK_MD_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[PERMISO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

---------------------------------------------------------------------------------------------------------


ALTER TABLE [dbo].[GRUPOS_USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_GRUPOS_USUARIOS_MD_GRUPOS] FOREIGN KEY([GRUPO_ID])
REFERENCES [dbo].[MD_GRUPOS] ([GRUPO_ID])
GO

ALTER TABLE [dbo].[GRUPOS_USUARIOS] CHECK CONSTRAINT [FK_GRUPOS_USUARIOS_MD_GRUPOS]
GO

ALTER TABLE [dbo].[GRUPOS_USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_GRUPOS_USUARIOS_MD_USUARIOS] FOREIGN KEY([USU_ID])
REFERENCES [dbo].[MD_USUARIOS] ([USU_ID])
GO

ALTER TABLE [dbo].[GRUPOS_USUARIOS] CHECK CONSTRAINT [FK_GRUPOS_USUARIOS_MD_USUARIOS]
GO

--ALTER TABLE [dbo].[GRUPOS_PERMISOS] ADD  CONSTRAINT [DF_GRUPOS_PERMISOS_AREA_ID]  DEFAULT (N'SIS') FOR [AREA_ID]
--GO

--ALTER TABLE [dbo].[GRUPOS_PERMISOS] ADD  CONSTRAINT [DF_GRUPOS_PERMISOS_VALOR]  DEFAULT ((1)) FOR [VALOR]
--GO


ALTER TABLE [dbo].[GRUPOS_PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK_GRUPOS_PERMISOS_MD_GRUPOS] FOREIGN KEY([GRUPO_ID])
REFERENCES [dbo].[MD_GRUPOS] ([GRUPO_ID])
GO

ALTER TABLE [dbo].[GRUPOS_PERMISOS] CHECK CONSTRAINT [FK_GRUPOS_PERMISOS_MD_GRUPOS]
GO





ALTER TABLE [dbo].[GRUPOS_PERMISOS]  WITH CHECK ADD  CONSTRAINT [FK_GRUPOS_PERMISOS_MD_PERMISOS] FOREIGN KEY([PERMISO_ID])
REFERENCES [dbo].[MD_PERMISOS] ([PERMISO_ID])
GO

ALTER TABLE [dbo].[GRUPOS_PERMISOS] CHECK CONSTRAINT [FK_GRUPOS_PERMISOS_MD_PERMISOS]
GO
