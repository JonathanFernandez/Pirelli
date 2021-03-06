USE [Comercial]
GO
/****** Object:  View [dbo].[SAP_GESTION_10_CLIENTES]    Script Date: 10/12/2015 23:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SAP_GESTION_10_CLIENTES]
AS
SELECT     TOP 10 ano, canal, SUM([net sales]) AS VTAS, cliente
FROM         datac.SAP_GES_DATOS_MAESTROS
GROUP BY ano, canal, cliente
HAVING      (canal = N'REPLACEMENT') AND (ano = N'2003') AND (cliente <> N'NOT APPLIED')
ORDER BY SUM([net sales]) DESC

GO
