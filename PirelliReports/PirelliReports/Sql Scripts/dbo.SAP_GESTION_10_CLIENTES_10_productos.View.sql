USE [Comercial]
GO
/****** Object:  View [dbo].[SAP_GESTION_10_CLIENTES_10_productos]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SAP_GESTION_10_CLIENTES_10_productos]
AS
SELECT     dbo.SAP_GESTION_10_CLIENTES.cliente, dbo.SAP_GESTION_10_CLIENTES.VTAS, datac.[10_PRINCIPALES_2003].IP5, 
                      datac.[10_PRINCIPALES_2003].SumOfPcs, datac.[10_PRINCIPALES_2003].Familia
FROM         datac.[10_PRINCIPALES_2003] CROSS JOIN
                      dbo.SAP_GESTION_10_CLIENTES

GO
