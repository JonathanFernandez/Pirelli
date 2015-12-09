USE [Comercial]
GO

/****** Object:  Table [dbo].[MD_PAGINAS]    Script Date: 07/12/2015 13:31:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MD_PAGINAS](
	[PAGINA_ID] [int] NOT NULL,
	[PAGINA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MD_PAGINAS] PRIMARY KEY CLUSTERED 
(
	[PAGINA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO MD_PAGINAS(PAGINA_ID, pagina)
VALUES
(1,'ABMFacturasPromoVisa.aspx'),
(2,'ActualizacionMasivaCliente.aspx'),
(3,'ActualizacionMasivaIP.aspx'),
(4,'ActualizacionMasivaStatus.aspx'),
(5,'AdministracionPermisos.aspx'),
(6,'AdministracionUsuarios.aspx'),
(7,'Clientes.aspx'),
(8,'ClienteXIP.aspx'),
(9,'CrystalViewer.aspx'),
(10,'EnvioASap.aspx'),
(11,'FacturasPromoVisa.aspx'),
(12,'IPxCliente.aspx'),
(13,'IPxRegion.aspx'),
(14,'ModificarClienteIP.aspx'),
(15,'Neumaticos.aspx'),
(16,'Promociones.aspx'),
(17,'RegionXIP.aspx'),
(18,'SincronizarClientes.aspx'),
(19,'SincronizarFacturas.aspx'),
(20,'SincronizarNeumaticos.aspx'),
(21,'UsuarioEdit.aspx'),
(22,'VentaMensualCTC.aspx'),
(23,'VentaTotalxCTCxCliente.aspx'),
(24,'AnualCliente.aspx'),
(25,'MensualXCliente.aspx')