USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_CLAVE]    Script Date: 17/11/2015 1:59:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_CLAVE]
(
@CLAVENUEVA NVARCHAR(20),
@USUARIOID NVARCHAR(50)
)
AS
 
BEGIN
	UPDATE DBO.MD_USUARIOS 
	SET
	PASS = @CLAVENUEVA
	WHERE USU_ID = @USUARIOID

END

GO
