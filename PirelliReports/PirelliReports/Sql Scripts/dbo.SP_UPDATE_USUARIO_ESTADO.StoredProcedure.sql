USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_USUARIO_ESTADO]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_USUARIO_ESTADO]
(
	@ID NVARCHAR(50),
	@ACTIVO BIT
)
AS
BEGIN

	UPDATE MD_USUARIOS
	SET ACTIVO = @ACTIVO
	WHERE 
	USU_ID = @ID

END

GO
