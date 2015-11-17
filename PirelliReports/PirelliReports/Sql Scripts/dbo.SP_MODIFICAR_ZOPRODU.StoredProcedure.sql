USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_ZOPRODU]    Script Date: 17/11/2015 1:59:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_ZOPRODU]
(
	@IP CHAR(7),
	@PAIS CHAR(2),
	@RANGO CHAR(1),
	@FLGBAJALOGICA CHAR(1)
)
AS
BEGIN
	UPDATE ZOPRODU1
	SET 
		RANGO = @RANGO,
		FLGBAJALOGICA = @FLGBAJALOGICA
	WHERE 
		IP = @IP AND
		PAIS = @PAIS

END

GO
