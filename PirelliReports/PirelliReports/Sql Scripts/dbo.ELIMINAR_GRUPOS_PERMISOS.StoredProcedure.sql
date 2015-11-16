USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_GRUPOS_PERMISOS]    Script Date: 15/11/2015 23:45:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[ELIMINAR_GRUPOS_PERMISOS]
(
	@NOMBRE NVARCHAR(50)
)
AS
BEGIN
	DELETE 
	FROM 
		GRUPOS_PERMISOS 
	WHERE 
		GRUPO_ID = (SELECT G.GRUPO_ID FROM MD_GRUPOS  G WHERE G.GRUPO_DESC =@NOMBRE)
END


GO
