USE [Comercial]
GO
/****** Object:  View [dbo].[VISTA_DESC_CLIENTES]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VISTA_DESC_CLIENTES]
AS
SELECT     RazSoc AS DESCRIPCION, Cod AS CODIGO, Cuit, DirSuc AS DIRECCION, CodRegion
FROM         dbo.Zoclien1
WHERE     (FlgBajaLogica = '0')

GO
