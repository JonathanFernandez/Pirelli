select * from MD_PERMISOS
select * from MD_USUARIOS
select * delete from MD_GRUPOS

delete from MD_USUARIOS where activo = 0
select * from md_paginas

select * from GRUPOS_PERMISOS
select * from GRUPOS_USUARIOS

delete from GRUPOS_PERMISOS
delete from GRUPOS_USUARIOS

insert into md_paginas(PAGINA_ID, pagina)
values
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

select * from md_paginas