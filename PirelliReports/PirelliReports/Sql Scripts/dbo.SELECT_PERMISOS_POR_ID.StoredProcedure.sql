USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SELECT_PERMISOS_POR_ID]    Script Date: 19/11/2015 1:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_PERMISOS_POR_ID]
(
	@ID INT
)
AS
BEGIN
	SELECT 
		GP.* 
	FROM 
		GRUPOS_PERMISOS GP
	INNER JOIN MD_GRUPOS  G WITH(NOLOCK) ON
		G.GRUPO_ID = GP.GRUPO_ID
	WHERE G.GRUPO_ID = @ID
END

GO
