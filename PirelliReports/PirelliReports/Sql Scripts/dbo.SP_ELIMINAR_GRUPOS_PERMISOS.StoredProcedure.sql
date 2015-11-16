USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_GRUPOS_PERMISOS]    Script Date: 15/11/2015 23:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ELIMINAR_GRUPOS_PERMISOS]
(
	@ID INT
)
AS
BEGIN
	
	DELETE FROM GRUPOS_USUARIOS WHERE GRUPO_ID = @ID
	DELETE FROM GRUPOS_PERMISOS WHERE GRUPO_ID = @ID
	DELETE FROM MD_GRUPOS WHERE GRUPO_ID = @ID

END

GO
