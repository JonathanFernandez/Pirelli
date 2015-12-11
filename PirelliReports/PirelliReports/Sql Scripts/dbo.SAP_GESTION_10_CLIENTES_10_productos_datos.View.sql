USE [Comercial]
GO
/****** Object:  View [dbo].[SAP_GESTION_10_CLIENTES_10_productos_datos]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SAP_GESTION_10_CLIENTES_10_productos_datos]
AS
SELECT     datac.SAP_GES_DATOS_MAESTROS.*
FROM         datac.SAP_GES_DATOS_MAESTROS INNER JOIN
                      dbo.SAP_GESTION_10_CLIENTES_10_productos ON 
                      datac.SAP_GES_DATOS_MAESTROS.cliente = dbo.SAP_GESTION_10_CLIENTES_10_productos.cliente AND 
                      datac.SAP_GES_DATOS_MAESTROS.ip5 = dbo.SAP_GESTION_10_CLIENTES_10_productos.IP5 AND 
                      datac.SAP_GES_DATOS_MAESTROS.familia = dbo.SAP_GESTION_10_CLIENTES_10_productos.Familia
WHERE     (datac.SAP_GES_DATOS_MAESTROS.ano = N'2003')

GO
