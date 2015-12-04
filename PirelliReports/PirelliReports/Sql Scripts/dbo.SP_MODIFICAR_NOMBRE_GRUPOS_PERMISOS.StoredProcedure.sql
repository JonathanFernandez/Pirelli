USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_NOMBRE_GRUPOS_PERMISOS]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_NOMBRE_GRUPOS_PERMISOS]
(
	@ID INT,
	@NOMBRE NVARCHAR(50)
)
AS
BEGIN
	UPDATE MD_GRUPOS
	SET GRUPO_DESC = @NOMBRE
	WHERE GRUPO_ID = @ID

END

GO
