USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_GRUPOS_PERMISOS]    Script Date: 18/11/2015 2:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_GRUPOS_PERMISOS]
(
	@NOMBRE NVARCHAR(50),
	@PERMISO INT


)
AS
BEGIN
	INSERT INTO GRUPOS_PERMISOS (GRUPO_ID,PERMISO_ID,VALOR)
	SELECT
		G.GRUPO_ID,
		@PERMISO,
		1
	FROM
		MD_GRUPOS G
	WHERE G.GRUPO_DESC = @NOMBRE
END

GO
