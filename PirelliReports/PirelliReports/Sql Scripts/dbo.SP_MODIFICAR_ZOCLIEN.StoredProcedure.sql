USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_ZOCLIEN]    Script Date: 29/11/2015 19:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_ZOCLIEN]
(
	@COD CHAR(10),
	@MATRIZ CHAR(10),
	@REFILL CHAR(10),
	@RAZSOC VARCHAR(45),
	@DIRSUR VARCHAR(40),
	@EMAIL VARCHAR(45),
	@WEB VARCHAR(100),
	@LATITUD FLOAT NULL,
	@LONGITUD FLOAT NULL,
	@FLGBAJALOGICA CHAR(1)

	
)
AS
BEGIN
	UPDATE
		ZOCLIEN1
	SET
		CODCLIMATRIZ = @MATRIZ,
		CODCLIREFILL = @REFILL,
		DIRSUC = @DIRSUR,
		RAZSOC = @RAZSOC,
		EMAIL = @EMAIL,
		PAGINAWEB = @WEB,
		LATITUD = @LATITUD,
		LONGITUD = @LONGITUD,
		FLGBAJALOGICA = @FLGBAJALOGICA
	WHERE COD = @COD


END

GO
