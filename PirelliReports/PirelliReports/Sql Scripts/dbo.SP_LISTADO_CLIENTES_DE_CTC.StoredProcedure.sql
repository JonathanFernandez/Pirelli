USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_CLIENTES_DE_CTC]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTADO_CLIENTES_DE_CTC]
(
	@CTC CHAR(2)	
)
AS
BEGIN
	SELECT DISTINCT COD , '('+ COD +') ' + RAZSOC  as RAZSOC FROM ZOCLIEN1 WHERE  CTC_CAR = @CTC
END

GO
