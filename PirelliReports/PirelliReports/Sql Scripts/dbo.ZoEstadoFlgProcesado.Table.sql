USE [Comercial]
GO
/****** Object:  Table [dbo].[ZoEstadoFlgProcesado]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ZoEstadoFlgProcesado](
	[FlgProcesado] [char](1) NOT NULL,
	[FlgDesc] [varchar](50) NULL,
 CONSTRAINT [PK_ZoEstadoFlgProcesado] PRIMARY KEY CLUSTERED 
(
	[FlgProcesado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
