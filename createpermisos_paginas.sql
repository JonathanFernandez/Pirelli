USE [Comercial]
GO

/****** Object:  Table [dbo].[MD_PAGINAS]    Script Date: 29/11/2015 18:20:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_PAGINAS](
	[PAGINA_ID] [int] IDENTITY(1,1) NOT NULL,
	[PAGINA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MD_PAGINAS] PRIMARY KEY CLUSTERED 
(
	[PAGINA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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


------------------------------
insert into md_paginas(pagina)
values('ABMFacturasPromoVisa.aspx'),
('ActualizacionMasivaCliente.aspx'),
('ActualizacionMasivaIP.aspx'),
('ActualizacionMasivaStatus.aspx'),
('AdministracionPermisos.aspx'),
('AdministracionUsuarios.aspx'),
('Clientes.aspx'),
('ClienteXIP.aspx'),
('CrystalViewer.aspx'),
('EnvioASap.aspx'),
('FacturasPromoVisa.aspx'),
('IPxCliente.aspx'),
('IPxRegion.aspx'),
('ModificarClienteIP.aspx'),
('Neumaticos.aspx'),
('Promociones.aspx'),
('RegionXIP.aspx'),
('SincronizarClientes.aspx'),
('SincronizarFacturas.aspx'),
('SincronizarNeumaticos.aspx'),
('UsuarioEdit.aspx'),
('VentaMensualCTC.aspx'),
('VentaTotalxCTCxCliente.aspx') 