USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_CLIENTES_MATRIZ]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTADO_CLIENTES_MATRIZ]
AS
BEGIN
	SELECT DISTINCT [CODCLIMATRIZ] , [RAZSOC] FROM ZOCLIEN1 WHERE CODCLIMATRIZ IS NOT NULL
	
END

GO
