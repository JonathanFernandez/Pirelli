USE [Comercial]
GO
/****** Object:  View [dbo].[4100012]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[4100012]
AS
SELECT     cliente, ip, precio_ok, precio_lista, precio_ok_NC
FROM         dbo.precios_ok
WHERE     (cliente = '0004100012')

GO
