USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_GRUPOS_USUARIO]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_GRUPOS_USUARIO]
(
	@ID VARCHAR(50) = '%'
)

AS
BEGIN
	SELECT 
	G.*
 FROM 
	GRUPOS_USUARIOS GU
INNER JOIN MD_GRUPOS G WITH(NOLOCK) ON 
	G.GRUPO_ID = GU.GRUPO_ID
WHERE 
	USU_ID LIKE @ID
END




GO
