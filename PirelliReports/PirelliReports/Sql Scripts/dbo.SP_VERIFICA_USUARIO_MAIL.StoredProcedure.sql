USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICA_USUARIO_MAIL]    Script Date: 04/12/2015 18:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VERIFICA_USUARIO_MAIL]
(
	@MAIL NVARCHAR(50)
)
AS
BEGIN
	SELECT * FROM MD_USUARIOS WHERE MAIL = @MAIL
END

GO
