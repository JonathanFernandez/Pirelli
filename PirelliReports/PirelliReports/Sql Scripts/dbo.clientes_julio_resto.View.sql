USE [Comercial]
GO
/****** Object:  View [dbo].[clientes_julio_resto]    Script Date: 10/12/2015 23:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[clientes_julio_resto]
AS
SELECT     HIERARQUIA
FROM         PROD.clientes_julio_tot
WHERE     (HIERARQUIA > N'0004100497')

GO
