USE [Comercial]
GO
/****** Object:  View [dbo].[clientes]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[clientes]
AS
SELECT     cliente
FROM         dbo.precios_ok
GROUP BY cliente

GO
