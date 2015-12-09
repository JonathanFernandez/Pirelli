USE [Comercial]
GO

/****** Object:  Table [dbo].[PERMISO_PAGINAS]    Script Date: 07/12/2015 13:32:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PERMISO_PAGINAS](
	[PERMISO_ID] [int] NOT NULL,
	[PAGINA_ID] [int] NOT NULL,
 CONSTRAINT [PK_PERMISO_PAGINAS] PRIMARY KEY CLUSTERED 
(
	[PERMISO_ID] ASC,
	[PAGINA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PERMISO_PAGINAS]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_PAGINAS_MD_PAGINAS] FOREIGN KEY([PAGINA_ID])
REFERENCES [dbo].[MD_PAGINAS] ([PAGINA_ID])
GO

ALTER TABLE [dbo].[PERMISO_PAGINAS] CHECK CONSTRAINT [FK_PERMISO_PAGINAS_MD_PAGINAS]
GO

ALTER TABLE [dbo].[PERMISO_PAGINAS]  WITH CHECK ADD  CONSTRAINT [FK_PERMISO_PAGINAS_MD_PERMISOS] FOREIGN KEY([PERMISO_ID])
REFERENCES [dbo].[MD_PERMISOS] ([PERMISO_ID])
GO

ALTER TABLE [dbo].[PERMISO_PAGINAS] CHECK CONSTRAINT [FK_PERMISO_PAGINAS_MD_PERMISOS]
GO

INSERT INTO PERMISO_PAGINAS(PERMISO_ID, PAGINA_ID)
VALUES 
(1, 1),
(1,	11),
(2,	10),
(3,	7),
(4,	15),
(5,	16),
(6,	14),
(7,	18),
(7,	19),
(7,	20),
(8,	8),
(8,	9),
(8,	12),
(8,	13),
(8,	17),
(8,	22),
(8,	23),
(8,	24),
(8,	25),
(9,	5),
(9,	6),
(10, 2),
(10, 3),
(10, 4),
(13, 21)