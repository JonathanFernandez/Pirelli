USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICAR_CLIENTE_EXISTENTE]    Script Date: 17/11/2015 1:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VERIFICAR_CLIENTE_EXISTENTE]
(
	@COD CHAR(10)
)
AS
BEGIN
	SELECT
		*
	FROM 
		DBO.ZOCLIEN1
	WHERE 
		COD = @COD
END

GO
