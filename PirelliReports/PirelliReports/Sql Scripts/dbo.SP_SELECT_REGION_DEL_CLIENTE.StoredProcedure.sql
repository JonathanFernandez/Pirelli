USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_REGION_DEL_CLIENTE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_REGION_DEL_CLIENTE]
(
	@CODCLIENTE CHAR(10)
)
AS
BEGIN
	SELECT
		R.REG_COD, 
		R.DESCRIPCION
	FROM 
		ZOCLIEN1 C
	INNER JOIN ZOREGION R WITH(NOLOCK) ON
		R.REG_COD = C.CODREGION
	WHERE 
		C.COD = @CODCLIENTE
END

GO
