USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VerificarLogin]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VerificarLogin]
(
	@USUARIO NVARCHAR(50),
	@PASSWORD NVARCHAR(50)
)
AS
BEGIN
	SELECT 
		*
	FROM 
		MD_USUARIOS US
	WHERE 
		US.USU_ID = @USUARIO AND
		US.PASS = @PASSWORD

	SELECT DISTINCT 
		PAG.PAGINA_ID,PAG.PAGINA 
	FROM 
		MD_USUARIOS U
	INNER JOIN GRUPOS_USUARIOS GU WITH(NOLOCK) ON
		GU.USU_ID = U.USU_ID
	INNER JOIN MD_GRUPOS G WITH(NOLOCK) ON 
		G.GRUPO_ID = GU.GRUPO_ID
	INNER JOIN GRUPOS_PERMISOS GP WITH(NOLOCK) ON 
		GP.GRUPO_ID = GU.GRUPO_ID
	INNER JOIN MD_PERMISOS PER WITH(NOLOCK) ON
		PER.PERMISO_ID = GP.PERMISO_ID
	INNER JOIN PERMISO_PAGINAS PP WITH(NOLOCK) ON
		PP.PERMISO_ID = GP.PERMISO_ID
	INNER JOIN MD_PAGINAS PAG WITH(NOLOCK) ON	
		PAG.PAGINA_ID = PP.PAGINA_ID

	WHERE U.USU_ID = @USUARIO
	ORDER BY PAG.PAGINA_ID ASC

	SELECT DISTINCT 
		PER.PERMISO_ID,PER.PERMISO_DESC
	FROM 
		MD_USUARIOS U
	INNER JOIN GRUPOS_USUARIOS GU WITH(NOLOCK) ON
		GU.USU_ID = U.USU_ID
	INNER JOIN MD_GRUPOS G WITH(NOLOCK) ON 
		G.GRUPO_ID = GU.GRUPO_ID
	INNER JOIN GRUPOS_PERMISOS GP WITH(NOLOCK) ON 
		GP.GRUPO_ID = GU.GRUPO_ID
	INNER JOIN MD_PERMISOS PER WITH(NOLOCK) ON
		PER.PERMISO_ID = GP.PERMISO_ID

	WHERE U.USU_ID = @USUARIO

END

GO
