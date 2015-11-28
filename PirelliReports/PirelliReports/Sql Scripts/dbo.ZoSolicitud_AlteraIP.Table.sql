
CREATE TABLE [dbo].[ZoSolicitud_AlteraIP](
	[CodSolicitud] [int] NOT NULL,
	[IP] [char](7) NOT NULL,
	[Pais] [varchar](2) NOT NULL,
	[Nota] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO