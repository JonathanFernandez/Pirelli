USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_CLIENTES_ACTIVOS]    Script Date: 19/11/2015 1:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_SELECT_CLIENTES_ACTIVOS]
	
AS
BEGIN
	SELECT  * FROM ZOCLIEN1 WHERE FLGBAJALOGICA = 0
END

GO
