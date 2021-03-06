USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoCTC]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZoCTC](
	[CodCTC] [char](2) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Region] [char](2) NULL,
	[Negocio] [char](15) NULL,
	[Usuario] [nvarchar](50) NULL,
	[FlgBajaLogica] [char](1) NULL CONSTRAINT [DF_ZoCTC_FlgBajaLogica]  DEFAULT (0),
 CONSTRAINT [PK_ZoCTC] PRIMARY KEY CLUSTERED 
(
	[CodCTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
