USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_GRUPOS_USUARIO]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DELETE_GRUPOS_USUARIO]
(
	@USU_ID NVARCHAR(50)
)
AS
BEGIN
	DELETE FROM GRUPOS_USUARIOS
	WHERE [USU_ID] = @USU_ID
     
END

GO
